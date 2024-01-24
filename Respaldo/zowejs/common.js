const util = require('node:util');
const exec = util.promisify(require('node:child_process').exec);
const fs = require('node:fs');

function getParts (file) {
    const [, user, lib, item] = file.toUpperCase().split('/');
    return {
        user,
        lib,
        item: item.split('.')[0]
    }
};

function hostFile (file) {
    const {user, lib, item} = getParts (file);
    return `${user}.${lib}(${item})`;
}

async function upload (file) {
    const {user, lib, item} = getParts (file);
    let command = `zowe zos-files upload file-to-data-set "${file}" "${user}.${lib}(${item})"`
    await exec (command);
};

async function submitLocal (job, dd, step) {
    await upload (job);
    const command = `zowe jobs submit data-set "${hostFile(job)}" --wait-for-output --rfj`;
    const jobid = await execCommand (command,getJobId);
    if (jobid) {
        const command = `zowe jobs list sfbj ${jobid}`;
        const sysout = await execCommand (command,getSysout,[step,dd]);
        if (sysout) {
            const command = `zowe jobs view sfbi ${jobid} ${sysout}`
            await execCommand (command,getOut);
        }
    }    
}

async function compile (source) {
    await upload (source);
    const {user, lib, item} = getParts (source);
    // const job = `./${user}/jcl/compile.jcl`;
    const job = `./zowejs/compile.jcl`;
    const file = fs.readFileSync(job,'utf8');
    const lines = file.split('\n');
    let newLines = setVariable (lines,'PGM',item);
    newLines = setVariable(newLines,'PATH',`${user}.${lib}(${item})`);
    const submit = './zowejs/submit.jcl';
    fs.writeFileSync(submit,newLines.join('\n'));
    command = `zowe jobs submit local-file "${submit}" --wait-for-output --rfj`;
    const jobid = await execCommand (command,getJobId);
    if (jobid) {
        const command = `zowe jobs list sfbj ${jobid}`;
        const sysout = await execCommand (command);
        console.log(sysout);
    }    
}

async function submitHostVO (job, dd, step) {
    const command = `zowe jobs submit data-set "${job}" --wait-for-output --rfj`;
    const jobid = await execCommand (command,getJobId);
    if (jobid) {
        const command = `zowe jobs list sfbj ${jobid}`;
        const sysout = await execCommand (command,getSysout,[step,dd]);
        if (sysout) {
            const command = `zowe jobs view sfbi ${jobid} ${sysout}`
            await execCommand (command,getOut);
        }
    }    
}

function setVariable (lines, item, value) {
    return lines.map(line => line.match(`\/\/.*SET ${item}=(\S*)`) ? `// SET ${item}=${value}`: line);
};

async function execCommand (command, task, params) {
    let result;
    try {
        result = await exec (command);
    } catch (error) {
        console.error(`error: ${error.message}`);
    }
    // console.log (result);
    if (result)
        if (result?.stdout) 
            return task? task (result.stdout, params): result.stdout;
        else 
            throw new Error(`\nCommand:\n ${command} \n stderr:\n ${result.stderr}`);
    else 
        throw new Error(`\nCommand:\n ${command} \n result undefined`);
}

function getJobId (stdout) {
    data = JSON.parse(stdout).data;
    const retcode = data.retcode;
    if (retcode.split(' ')[1] <= 4) {
        console.log ('Job ok');
        return data.jobid
    } else {
        console.error (new Error (`Job failed with retcode ${retcode} Additional output:\n ${JSON.stringify(data,null,1)}`));
    }
}

function getSysout (data, params) {
    const result = data.split('\n').filter(line => line.match(`.*${params[1]}.*${params[0]}.*`));
    if (result.length > 0) {
        return result[0].split(' ')[0];
    }
}

function getOut (data) {
    console.log(data);
}


module.exports = { upload, submitLocal, compile, submitHostVO };
 