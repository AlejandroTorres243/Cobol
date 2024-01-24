const { exec } = require('child_process');

// import * as config from './config.json';
const job = process.argv[2];
const rc = +process.argv[3] || 0;
const command = `zowe jobs submit data-set "${job}" --wait-for-output --rfj`;
exec (command, (error, stdout, stderr) => {
    if (error) {
        console.error(`error: ${error.message}`);
    } else if (stderr) {
        console.error(new Error(`\nCommand:\n ${command} \n stderr:\n ${stderr}`));
    } else {
        data = JSON.parse(stdout).data;
        const retcode = data.retcode;
        if (retcode.split(' ')[1] <= rc) {
            console.log ('Job ok');
        } else {
            console.error (new Error (`Job failed with retcode ${retcode} Additional output:\n ${JSON.stringify(data,null,1)}`));
        }
    }
});