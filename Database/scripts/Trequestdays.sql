CREATE TABLE RequestDays
(
    RequestDayId INT IDENTITY(1,1) PRIMARY KEY,

    WorkRequestId INT NOT NULL,

    WorkDate DATE NOT NULL,

    UnitId INT NOT NULL,

    JobRoleId INT NOT NULL,

    StartTime TIME NOT NULL,

    EndTime TIME NOT NULL,

    RequiredWorkers INT NOT NULL,

    Status NVARCHAR(20) NOT NULL DEFAULT('Open'),

    Notes NVARCHAR(255) NULL,

    CreatedDate DATETIME2 NOT NULL DEFAULT(GETDATE()),

    UpdatedDate DATETIME2 NULL,

    CONSTRAINT FK_RequestDays_WorkRequests
        FOREIGN KEY (WorkRequestId)
        REFERENCES WorkRequests(WorkRequestId),

    CONSTRAINT FK_RequestDays_Units
        FOREIGN KEY (UnitId)
        REFERENCES Units(UnitId),

    CONSTRAINT FK_RequestDays_JobRoles
        FOREIGN KEY (JobRoleId)
        REFERENCES JobRoles(JobRoleId),

    CONSTRAINT CK_RequestDays_Workers
        CHECK (RequiredWorkers > 0),

    CONSTRAINT CK_RequestDays_Time
        CHECK (StartTime < EndTime),

    CONSTRAINT CK_RequestDays_Status
        CHECK (Status IN ('Open','Assigned','Completed','Cancelled')),

    CONSTRAINT UQ_RequestDay
        UNIQUE (WorkRequestId, WorkDate, UnitId, JobRoleId, StartTime, EndTime)
);