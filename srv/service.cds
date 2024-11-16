using { BusinessPartnerA2X } from './external/BusinessPartnerA2X.cds'; 
using { incidentapp07 as my } from '../db/schema.cds';

@path: '/service/incidentapp07'
@requires: 'authenticated-user'
service incidentapp07Srv {
  @odata.draft.enabled
  entity Incidents as projection on my.Incidents;
  @odata.draft.enabled
  entity Customers as projection on my.Customers;
  //@odata.draft.enabled
  //entity Conversations as projection on my.Conversations;

  annotate my.Incidents {
    title    @changelog;
    status   @changelog;
  };

  annotate my.Customers with @PersonalData : {
    DataSubjectRole : 'Customer',
    EntitySemantics : 'DataSubject'
  } {
    ID           @PersonalData.FieldSemantics: 'DataSubjectID';
    firstName    @PersonalData.IsPotentiallyPersonal;
    lastName     @PersonalData.IsPotentiallyPersonal;
    email        @PersonalData.IsPotentiallyPersonal;
  };

}