sap.ui.define([
    "sap/fe/test/JourneyRunner",
	"front2/test/integration/pages/TaskList",
	"front2/test/integration/pages/TaskObjectPage"
], function (JourneyRunner, TaskList, TaskObjectPage) {
    'use strict';

    var runner = new JourneyRunner({
        launchUrl: sap.ui.require.toUrl('front2') + '/test/flpSandbox.html#front2-tile',
        pages: {
			onTheTaskList: TaskList,
			onTheTaskObjectPage: TaskObjectPage
        },
        async: true
    });

    return runner;
});

