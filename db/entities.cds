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
    email: String(100);
    tasks: Association to many Task on tasks.user = $self;
}

entity Task : cuid, managed {
        title: String(100);
        description: String(100);
        priority: Priority;
        status: Status;
        limit_date: Date;
        user: Association to User;
}
