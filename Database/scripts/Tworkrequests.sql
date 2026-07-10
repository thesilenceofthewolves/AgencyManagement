CREATE TABLE WorkRequests
(
    WorkRequestId INT IDENTITY(1,1) PRIMARY KEY,

    BranchId INT NOT NULL,

    ClientContactId INT NOT NULL,

    RequestReference NVARCHAR(50) NULL,

    StartDate DATE NOT NULL,

    EndDate DATE NOT NULL,

    Status NVARCHAR(20) NOT NULL DEFAULT('Draft'),

    Priority NVARCHAR(20) NOT NULL DEFAULT('Normal'),

    Notes NVARCHAR(500) NULL,

    CreatedDate DATETIME2 NOT NULL DEFAULT(GETDATE()),

    UpdatedDate DATETIME2 NULL,

    CONSTRAINT FK_WorkRequests_Branches
        FOREIGN KEY (BranchId)
        REFERENCES Branches(BranchId),

    CONSTRAINT FK_WorkRequests_ClientContacts
        FOREIGN KEY (ClientContactId)
        REFERENCES ClientContacts(ClientContactId),

    CONSTRAINT CK_WorkRequests_Status
        CHECK (Status IN
        (
            'Draft',
            'Submitted',
            'Open',
            'Completed',
            'Cancelled'
        )),

    CONSTRAINT CK_WorkRequests_Priority
        CHECK (Priority IN
        (
            'Low',
            'Normal',
            'High',
            'Urgent'
        )),

    CONSTRAINT CK_WorkRequests_Dates
        CHECK (StartDate <= EndDate)
);
GO