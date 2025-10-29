sap.ui.define(['sap/fe/test/ObjectPage'], function(ObjectPage) {
    'use strict';

    var CustomPageDefinitions = {
        actions: {},
        assertions: {}
    };

    return new ObjectPage(
        {
            appId: 'front1',
            componentId: 'UserObjectPage',
            contextPath: '/User'
        },
        CustomPageDefinitions
    );
});