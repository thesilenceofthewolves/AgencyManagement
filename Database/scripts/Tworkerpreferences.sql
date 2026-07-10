CREATE TABLE WorkerPreferences
(
    WorkerPreferenceId INT IDENTITY(1,1) PRIMARY KEY,

    WorkerId INT NOT NULL,

    PreferredNotificationMethod NVARCHAR(20) NOT NULL DEFAULT('SMS'),

    MaximumTravelDistanceKm INT NULL,

    HasDrivingLicence BIT NOT NULL DEFAULT(0),

    HasOwnVehicle BIT NOT NULL DEFAULT(0),

    CONSTRAINT FK_WorkerPreferences_Worker
        FOREIGN KEY (WorkerId)
        REFERENCES Workers(WorkerId),

    CONSTRAINT UQ_WorkerPreferences_Worker
        UNIQUE (WorkerId),

    CONSTRAINT CK_WorkerPreferences_Notification
        CHECK (PreferredNotificationMethod IN ('SMS','Email','Phone', 'WhatApp'))
);
GO