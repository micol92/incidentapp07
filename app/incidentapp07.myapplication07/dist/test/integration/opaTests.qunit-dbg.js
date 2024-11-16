sap.ui.require(
    [
        'sap/fe/test/JourneyRunner',
        'incidentapp07/myapplication07/test/integration/FirstJourney',
		'incidentapp07/myapplication07/test/integration/pages/IncidentsList',
		'incidentapp07/myapplication07/test/integration/pages/IncidentsObjectPage',
		'incidentapp07/myapplication07/test/integration/pages/ConversationsObjectPage'
    ],
    function(JourneyRunner, opaJourney, IncidentsList, IncidentsObjectPage, ConversationsObjectPage) {
        'use strict';
        var JourneyRunner = new JourneyRunner({
            // start index.html in web folder
            launchUrl: sap.ui.require.toUrl('incidentapp07/myapplication07') + '/index.html'
        });

       
        JourneyRunner.run(
            {
                pages: { 
					onTheIncidentsList: IncidentsList,
					onTheIncidentsObjectPage: IncidentsObjectPage,
					onTheConversationsObjectPage: ConversationsObjectPage
                }
            },
            opaJourney.run
        );
    }
);