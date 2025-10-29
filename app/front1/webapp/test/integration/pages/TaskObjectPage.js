sap.ui.define(['sap/fe/test/ObjectPage'], function(ObjectPage) {
    'use strict';

    var CustomPageDefinitions = {
        actions: {},
        assertions: {}
    };

    return new ObjectPage(
        {
            appId: 'front1',
            componentId: 'TaskObjectPage',
            contextPath: '/User/tasks'
        },
        CustomPageDefinitions
    );
});