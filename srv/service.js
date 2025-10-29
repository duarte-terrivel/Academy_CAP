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
});
