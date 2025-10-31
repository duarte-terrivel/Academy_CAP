const { User } = require("@sap/cds");

module.exports = cds.service.impl(async function () {
  const { Task } = this.entities;

  // Before creating a Task
  this.before('CREATE', Task, (req) => {
    const data = req.data;

    // Default status = 'New' if not provided
    if (!data.status) {
      data.status = 'New';
    }
  });

  // Before updating a Task
  this.before('UPDATE', Task, async (req) => {
    const { status } = req.data;

    // Only act if the status is being set to 'Done'
    if (status === 'Done') {
      // Fetch current record to ensure update makes sense
      const existing = await SELECT.one.from(Task).where({ ID: req.data.ID });

      // If not already done, register conclusion date
      if (existing && existing.status !== 'Done') {
        req.data.conclusion_date = new Date();
      }
    }
  });
this.after('READ', Task, (data) => {
    const now = new Date();
    const records = Array.isArray(data) ? data : [data];

    for (let each of records) {
      if (each.limit_date) {
        const limit = new Date(each.limit_date);
        const diffDays = Math.ceil((limit - now) / (1000 * 60 * 60 * 24));

        if (diffDays > 5) {
          each.statusColor = 3; // Green (Good)
        } else if (diffDays >= 0 && diffDays <= 5) {
          each.statusColor = 2; // Yellow (Critical)
        } else {
          each.statusColor = 1; // Red (Error)
        }
      } else {
        each.statusColor = 0; // None
      }
    }
  });
});
