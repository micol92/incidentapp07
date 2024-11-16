sap.ui.define(['sap/fe/test/ObjectPage'], function(ObjectPage) {
    'use strict';

    var CustomPageDefinitions = {
        actions: {},
        assertions: {}
    };

    return new ObjectPage(
        {
            appId: 'incidentapp07.myapplication07',
            componentId: 'ConversationsObjectPage',
            contextPath: '/Incidents/conversations'
        },
        CustomPageDefinitions
    );
});