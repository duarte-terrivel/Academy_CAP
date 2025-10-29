using CatalogService as service from '../../srv/service';
annotate service.Task with @(
     UI.FieldGroup #GeneratedGroup2 : {
        $Type : 'UI.FieldGroupType',
        Data : [
            {
                $Type : 'UI.DataField',
                Value : title,
            },
            {
                $Type : 'UI.DataField',
                Value : description,
            },
        ],
    },
    UI.Facets #Facets2: [
        {
            $Type : 'UI.ReferenceFacet',
            ID : 'GeneratedFacet1',
            Label : 'General Information',
            Target : '@UI.FieldGroup#GeneratedGroup',
        }
    ],
    UI.LineItem #Tasks2 : [
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
    UI.SelectionFields : [
        status,
        priority,
        user.username,
    ],
);

annotate service.Task with {
    user @Common.ValueList : {
        $Type : 'Common.ValueListType',
        CollectionPath : 'User',
        Parameters : [
            {
                $Type : 'Common.ValueListParameterInOut',
                LocalDataProperty : user_ID,
                ValueListProperty : 'ID',
            },
            {
                $Type : 'Common.ValueListParameterDisplayOnly',
                ValueListProperty : 'username',
            },
            {
                $Type : 'Common.ValueListParameterDisplayOnly',
                ValueListProperty : 'email',
            },
        ],
    }
};

