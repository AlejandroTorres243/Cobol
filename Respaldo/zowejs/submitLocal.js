const { submitLocal } = require('./common');

const job = process.argv[2];
const dd = process.argv[4] || 'SYSOUT';
const step = process.argv[3] || 'RUN';

submitLocal (job,dd,step);

