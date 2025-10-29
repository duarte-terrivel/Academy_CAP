/* using {CatalogService} from './service.cds';

annotate CatalogService.Task with @(UI: {
    SelectionFields  : [
        title,
        priority
    ],
    LineItem: [
        {Value: title},
        {Value: description},
        {Value: priority,
        Criticality: {$edmJson: {$If: [
            //when equals 1
            {$Eq: [
                {$Path: 'priority'},
                'Low'
            ]},
            //put green
            3,
            {$If: [
                //when equals 2
                {$Eq: [
                    {$Path: 'priority'},
                    'Medium'
                ]},
                //put yellow
                2,
                //put red
                1
            ]}
        ]}}},
    ],
    Facets           : [{
        $Type : 'UI.ReferenceFacet',
        Label : '{i18n>Details}',
        Target: '@UI.FieldGroup#Details'
    }, ],
    FieldGroup #Details: {Data: [
        {Value: title},
        {Value: description},
        {Value: priority},
        {Value: limit_date},
        {Value: conclusion_date},
        {Value: user},
    ]}
});

annotate CatalogService.Task with {
  title        @Common.FieldControl: #Mandatory;
  priority     @Common.FieldControl: #ReadOnly;
  createdBy    @Common.FieldControl: #Hidden;
};

 */