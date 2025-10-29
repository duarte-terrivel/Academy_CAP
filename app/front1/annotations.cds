using CatalogService as service from '../../srv/service';
annotate service.User with @(
    UI.FieldGroup #GeneratedGroup : {
        $Type : 'UI.FieldGroupType',
        Data : [
            {
                $Type : 'UI.DataField',
                Value : username,
            },
            {
                $Type : 'UI.DataField',
                Value : email,
            },
        ],
    },
    UI.Facets : [
        {
            $Type : 'UI.ReferenceFacet',
            ID : 'GeneratedFacet1',
            Label : 'General Information',
            Target : '@UI.FieldGroup#GeneratedGroup',
        },
        {
            $Type : 'UI.ReferenceFacet',
            Label : 'Tasks',
            ID : 'Tasks',
            Target : 'tasks/@UI.LineItem#Tasks',
        },
    ],
    UI.LineItem : [
        {
            $Type : 'UI.DataField',
            Value : username,
        },
        {
            $Type : 'UI.DataField',
            Value : email,
        },
    ],
    UI.SelectionFields : [
        tasks.priority,
        tasks.status,
        username,
    ],
);

annotate service.Task with @(
     UI.FieldGroup #GeneratedGroup : {
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
    UI.Facets : [
        {
            $Type : 'UI.ReferenceFacet',
            ID : 'GeneratedFacet1',
            Label : 'General Information',
            Target : '@UI.FieldGroup#GeneratedGroup',
        }
    ],
    UI.LineItem #Tasks : [
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
);

annotate service.Task with {
    priority @(
        Common.ValueList : {
            $Type : 'Common.ValueListType',
            CollectionPath : 'Task',
            Parameters : [
                {
                    $Type : 'Common.ValueListParameterInOut',
                    LocalDataProperty : priority,
                    ValueListProperty : 'priority',
                },
            ],
            Label : 'Priority',
        },
        Common.ValueListWithFixedValues : true,
)};

annotate service.Task with {
    status @(
        Common.ValueList : {
            $Type : 'Common.ValueListType',
            CollectionPath : 'Task',
            Parameters : [
                {
                    $Type : 'Common.ValueListParameterInOut',
                    LocalDataProperty : status,
                    ValueListProperty : 'status',
                },
            ],
            Label : 'Status',
        },
        Common.ValueListWithFixedValues : true,
)};

annotate service.User with {
    username @(
        Common.ValueList : {
            $Type : 'Common.ValueListType',
            CollectionPath : 'User',
            Parameters : [
                {
                    $Type : 'Common.ValueListParameterInOut',
                    LocalDataProperty : username,
                    ValueListProperty : 'username',
                },
            ],
            Label : 'Username',
        },
        Common.ValueListWithFixedValues : true,
)};

