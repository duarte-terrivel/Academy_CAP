sap.ui.define([
    "sap/fe/test/JourneyRunner",
	"front1/test/integration/pages/UserList",
	"front1/test/integration/pages/UserObjectPage",
	"front1/test/integration/pages/TaskObjectPage"
], function (JourneyRunner, UserList, UserObjectPage, TaskObjectPage) {
    'use strict';

    var runner = new JourneyRunner({
        launchUrl: sap.ui.require.toUrl('front1') + '/test/flpSandbox.html#front1-tile',
        pages: {
			onTheUserList: UserList,
			onTheUserObjectPage: UserObjectPage,
			onTheTaskObjectPage: TaskObjectPage
        },
        async: true
    });

    return runner;
});

