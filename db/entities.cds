namespace com.sap.duarte;
using { cuid, managed } from '@sap/cds/common';

type Priority : String enum {
    Low;
    Medium;
    High;
}

type Status : String enum {
    New;
    InProgress;
    Done;
}

entity User : cuid, managed {
    username: String(100) @title : '{i18n>user.username}';
    email: String(100) @title : '{i18n>user.email}';
    tasks: Association to many Task on tasks.user = $self;
}

entity Task : cuid, managed {
        title: String(100) @title : '{i18n>task.title}';
        description: String(100) @title : '{i18n>task.description}';
        priority: Priority @title : '{i18n>task.priority}';
        status: Status @title : '{i18n>task.status}';
        limit_date: Date @title : '{i18n>task.limit_date}';
        conclusion_date: Date @title : '{i18n>task.conclusion_date}';
        user: Association to User @title : '{i18n>task.user}';
}
