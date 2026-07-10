CREATE TABLE Assignments
(
    AssignmentId INT IDENTITY(1,1) PRIMARY KEY,

    RequestDayId INT NOT NULL,

    WorkerId INT NOT NULL,

    Status NVARCHAR(20) NOT NULL DEFAULT('Offered'),

    AssignedDate DATETIME2 NOT NULL DEFAULT(GETDATE()),

    AcceptedDate DATETIME2 NULL,

    DeclinedDate DATETIME2 NULL,

    CancelledDate DATETIME2 NULL,

    CompletedDate DATETIME2 NULL,

    NoShowDate DATETIME2 NULL,

    UpdatedDate DATETIME2 NULL,

    Notes NVARCHAR(500) NULL,

    CONSTRAINT FK_Assignments_RequestDays
        FOREIGN KEY (RequestDayId)
        REFERENCES RequestDays(RequestDayId),

    CONSTRAINT FK_Assignments_Workers
        FOREIGN KEY (WorkerId)
        REFERENCES Workers(WorkerId),

    CONSTRAINT CK_Assignments_Status
        CHECK (Status IN
        (
            'Offered',
            'Accepted',
            'Declined',
            'Cancelled',
            'Completed',
            'NoShow'
        )),

    CONSTRAINT UQ_Assignment
        UNIQUE (RequestDayId, WorkerId)
);
GO