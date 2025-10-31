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
    UI.HeaderInfo : {
        Title : {
            $Type : 'UI.DataField',
            Value : username,
        },
        TypeName : 'Create User',
        TypeNamePlural : '',
    },
);

annotate service.Task with @(
     UI.FieldGroup #GeneratedGroup : {
        $Type : 'UI.FieldGroupType',
        Data : [
            {
                $Type : 'UI.DataField',
                Value : user_ID,
            },
            {
                $Type : 'UI.DataField',
                Value : createdBy,
            },
            {
                $Type : 'UI.DataField',
                Value : title,
            },
            {
                $Type : 'UI.DataField',
                Value : description,
            },
            {
                $Type : 'UI.DataField',
                Value : createdAt,
            },
            {
                $Type : 'UI.DataField',
                Value : limit_date,
            },
            {
                $Type : 'UI.DataField',
                Value : priority,
            },
            {
                $Type : 'UI.DataField',
                Value : status,
            },
/*             {
                $Type : 'UI.DataField',
                Value : statusCriticality,
                Label : 'statusCriticality',
            }, */
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
        {Value: limit_date,
        Criticality: statusColor}
/*         {Value: limit_date,
        Criticality: {
          $edmJson: {
            $If: [
              // Case 1: limit_date more than 5 days ahead → Green (3)
              {
                $Gt: [
                  {
                    $Sub: [
                      { $Path: 'limit_date' },
                      { $Now: {} }
                    ]
                  },
                  5
                ]
              },
              3, // Good (green)

              // Case 2: limit_date between 0 and 5 days → Yellow (2)
              {
                $And: [
                  {
                    $Ge: [
                      {
                        $Sub: [
                          { $Path: 'limit_date' },
                          { $Now: {} }
                        ]
                      },
                      0
                    ]
                  },
                  {
                    $Le: [
                      {
                        $Sub: [
                          { $Path: 'limit_date' },
                          { $Now: {} }
                        ]
                      },
                      5
                    ]
                  }
                ]
              },
              2, // Critical (yellow)

              // Case 3: otherwise → Red (1)
              1
            ]
          }
        }
      } */
    ],
    UI.HeaderInfo : {
        Title : {
            $Type : 'UI.DataField',
            Value : title,
        },
        TypeName : 'title',
        TypeNamePlural : '',
        Description : {
            $Type : 'UI.DataField',
            Value : description,
        },
    },
);

