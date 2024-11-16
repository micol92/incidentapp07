using { incidentapp07Srv } from '../srv/service.cds';

annotate incidentapp07Srv.Incidents with @UI.HeaderInfo: { TypeName: 'Incident', TypeNamePlural: 'Incidents', Title: { Value: title } };
annotate incidentapp07Srv.Incidents with {
  ID @UI.Hidden @Common.Text: { $value: title, ![@UI.TextArrangement]: #TextOnly }
};
annotate incidentapp07Srv.Incidents with @UI.Identification: [{ Value: title }];
annotate incidentapp07Srv.Incidents with {
  customer @Common.ValueList: {
    CollectionPath: 'Customers',
    Parameters    : [
      {
        $Type            : 'Common.ValueListParameterInOut',
        LocalDataProperty: customer_ID, 
        ValueListProperty: 'ID'
      },
      {
        $Type            : 'Common.ValueListParameterDisplayOnly',
        ValueListProperty: 'firstName'
      },
      {
        $Type            : 'Common.ValueListParameterDisplayOnly',
        ValueListProperty: 'lastName'
      },
      {
        $Type            : 'Common.ValueListParameterDisplayOnly',
        ValueListProperty: 'phoneNumber'
      },
      {
        $Type            : 'Common.ValueListParameterDisplayOnly',
        ValueListProperty: 'email'
      },
    ],
  }
};
annotate incidentapp07Srv.Incidents with @UI.DataPoint #urgency: {
  Value: urgency,
  Title: 'Urgency',
};
annotate incidentapp07Srv.Incidents with @UI.DataPoint #status: {
  Value: status,
  Title: 'Status',
};
annotate incidentapp07Srv.Incidents with @UI.DataPoint #customerEmail: {
  Value: customerEmail,
  Title: 'Customer Email',
};
annotate incidentapp07Srv.Incidents with {
  title @title: 'Title';
  urgency @title: 'Urgency';
  status @title: 'Status';
  customerEmail @title: 'Customer Email';
  createdAt @title: 'Created At';
  createdBy @title: 'Created By';
  modifiedAt @title: 'Modified At';
  modifiedBy @title: 'Modified By'
};

annotate incidentapp07Srv.Incidents with @UI.LineItem: [
    { $Type: 'UI.DataField', Value: title },
    { $Type: 'UI.DataField', Value: urgency },
    { $Type: 'UI.DataField', Value: status },
    { $Type: 'UI.DataField', Value: customerEmail },
    { $Type: 'UI.DataField', Value: createdAt },
    { $Type: 'UI.DataField', Value: createdBy },
    { $Type: 'UI.DataField', Value: modifiedAt },
    { $Type: 'UI.DataField', Value: modifiedBy },
    { $Type: 'UI.DataField', Label: 'Customer', Value: customer_ID }
];

annotate incidentapp07Srv.Incidents with @UI.FieldGroup #Main: {
  $Type: 'UI.FieldGroupType', Data: [
    { $Type: 'UI.DataField', Value: title },
    { $Type: 'UI.DataField', Value: urgency },
    { $Type: 'UI.DataField', Value: status },
    { $Type: 'UI.DataField', Value: customerEmail },
    { $Type: 'UI.DataField', Value: createdAt },
    { $Type: 'UI.DataField', Value: createdBy },
    { $Type: 'UI.DataField', Value: modifiedAt },
    { $Type: 'UI.DataField', Value: modifiedBy },
    { $Type: 'UI.DataField', Label: 'Customer', Value: customer_ID }
  ]
};

annotate incidentapp07Srv.Incidents with {
  customer @Common.Text: { $value: customer.email, ![@UI.TextArrangement]: #TextOnly }
};

annotate incidentapp07Srv.Incidents with {
  conversations @Common.Label: 'Conversations';
  customer @Common.Label: 'Customer'
};

annotate incidentapp07Srv.Incidents with @UI.HeaderFacets: [
 { $Type : 'UI.ReferenceFacet', Target : '@UI.DataPoint#urgency' },
 { $Type : 'UI.ReferenceFacet', Target : '@UI.DataPoint#status' },
 { $Type : 'UI.ReferenceFacet', Target : '@UI.DataPoint#customerEmail' }
];

annotate incidentapp07Srv.Incidents with @UI.Facets: [
  { $Type: 'UI.ReferenceFacet', ID: 'Main', Label: 'General Information', Target: '@UI.FieldGroup#Main' },
  { $Type : 'UI.ReferenceFacet', ID : 'Conversations', Target : 'conversations/@UI.LineItem' }
];

annotate incidentapp07Srv.Incidents with @UI.SelectionFields: [
  customer_ID
];

annotate incidentapp07Srv.Conversations with @UI.HeaderInfo: { TypeName: 'Conversation', TypeNamePlural: 'Conversations' };
annotate incidentapp07Srv.Conversations with {
  incident @Common.ValueList: {
    CollectionPath: 'Incidents',
    Parameters    : [
      {
        $Type            : 'Common.ValueListParameterInOut',
        LocalDataProperty: incident_ID, 
        ValueListProperty: 'ID'
      },
      {
        $Type            : 'Common.ValueListParameterDisplayOnly',
        ValueListProperty: 'title'
      },
      {
        $Type            : 'Common.ValueListParameterDisplayOnly',
        ValueListProperty: 'urgency'
      },
      {
        $Type            : 'Common.ValueListParameterDisplayOnly',
        ValueListProperty: 'status'
      },
      {
        $Type            : 'Common.ValueListParameterDisplayOnly',
        ValueListProperty: 'customerEmail'
      },
      {
        $Type            : 'Common.ValueListParameterDisplayOnly',
        ValueListProperty: 'createdAt'
      },
      {
        $Type            : 'Common.ValueListParameterDisplayOnly',
        ValueListProperty: 'createdBy'
      },
      {
        $Type            : 'Common.ValueListParameterDisplayOnly',
        ValueListProperty: 'modifiedAt'
      },
      {
        $Type            : 'Common.ValueListParameterDisplayOnly',
        ValueListProperty: 'modifiedBy'
      },
    ],
  }
};
annotate incidentapp07Srv.Conversations with @UI.DataPoint #timestamp: {
  Value: timestamp,
  Title: 'Timestamp',
};
annotate incidentapp07Srv.Conversations with @UI.DataPoint #author: {
  Value: author,
  Title: 'Author',
};
annotate incidentapp07Srv.Conversations with @UI.DataPoint #message: {
  Value: message,
  Title: 'Message',
};
annotate incidentapp07Srv.Conversations with {
  timestamp @title: 'Timestamp';
  author @title: 'Author';
  message @title: 'Message'
};

annotate incidentapp07Srv.Conversations with @UI.LineItem: [
    { $Type: 'UI.DataField', Value: timestamp },
    { $Type: 'UI.DataField', Value: author },
    { $Type: 'UI.DataField', Value: message }
];

annotate incidentapp07Srv.Conversations with @UI.FieldGroup #Main: {
  $Type: 'UI.FieldGroupType', Data: [
    { $Type: 'UI.DataField', Value: timestamp },
    { $Type: 'UI.DataField', Value: author },
    { $Type: 'UI.DataField', Value: message }
  ]
};

annotate incidentapp07Srv.Conversations with {
  incident @Common.Text: { $value: incident.title, ![@UI.TextArrangement]: #TextOnly }
};

annotate incidentapp07Srv.Conversations with {
  incident @Common.Label: 'Incident'
};

annotate incidentapp07Srv.Conversations with @UI.HeaderFacets: [
 { $Type : 'UI.ReferenceFacet', Target : '@UI.DataPoint#timestamp' },
 { $Type : 'UI.ReferenceFacet', Target : '@UI.DataPoint#author' },
 { $Type : 'UI.ReferenceFacet', Target : '@UI.DataPoint#message' }
];

annotate incidentapp07Srv.Conversations with @UI.Facets: [
  { $Type: 'UI.ReferenceFacet', ID: 'Main', Label: 'General Information', Target: '@UI.FieldGroup#Main' }
];

annotate incidentapp07Srv.Conversations with @UI.SelectionFields: [
  incident_ID
];

annotate incidentapp07Srv.Customers with @UI.HeaderInfo: { TypeName: 'Customer', TypeNamePlural: 'Customers', Title: { Value: email } };
annotate incidentapp07Srv.Customers with {
  ID @UI.Hidden @Common.Text: { $value: email, ![@UI.TextArrangement]: #TextOnly }
};
annotate incidentapp07Srv.Customers with @UI.Identification: [{ Value: email }];
annotate incidentapp07Srv.Customers with @UI.DataPoint #firstName: {
  Value: firstName,
  Title: 'First Name',
};
annotate incidentapp07Srv.Customers with @UI.DataPoint #lastName: {
  Value: lastName,
  Title: 'Last Name',
};
annotate incidentapp07Srv.Customers with {
  firstName @title: 'First Name';
  lastName @title: 'Last Name';
  phoneNumber @title: 'Phone Number';
  email @title: 'Email'
};

annotate incidentapp07Srv.Customers with @UI.LineItem: [
    { $Type: 'UI.DataField', Value: firstName },
    { $Type: 'UI.DataField', Value: lastName },
    { $Type: 'UI.DataField', Value: phoneNumber },
    { $Type: 'UI.DataField', Value: email }
];

annotate incidentapp07Srv.Customers with @UI.FieldGroup #Main: {
  $Type: 'UI.FieldGroupType', Data: [
    { $Type: 'UI.DataField', Value: firstName },
    { $Type: 'UI.DataField', Value: lastName },
    { $Type: 'UI.DataField', Value: phoneNumber },
    { $Type: 'UI.DataField', Value: email }
  ]
};

annotate incidentapp07Srv.Customers with {
  incidents @Common.Label: 'Incidents'
};

annotate incidentapp07Srv.Customers with @UI.HeaderFacets: [
 { $Type : 'UI.ReferenceFacet', Target : '@UI.DataPoint#firstName' },
 { $Type : 'UI.ReferenceFacet', Target : '@UI.DataPoint#lastName' }
];

annotate incidentapp07Srv.Customers with @UI.Facets: [
  { $Type: 'UI.ReferenceFacet', ID: 'Main', Label: 'General Information', Target: '@UI.FieldGroup#Main' }
];

annotate incidentapp07Srv.Customers with @UI.SelectionFields: [
  email
];

