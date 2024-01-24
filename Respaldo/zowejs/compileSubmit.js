const { submitLocal, compile } = require('./common');

// import * as config from './config.json';
const source = process.argv[2];
const job = process.argv[3];
const dd = process.argv[4] || 'SYSOUT';
const step = process.argv[5] || 'RUN';
compileSubmit (source,job,dd,step);

async function compileSubmit (source, job, dd, step) {
    await compile (source);
    await submitLocal (job, dd, step);
}

