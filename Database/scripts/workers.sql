CREATE TABLE Workers
(
    WorkerId INT IDENTITY(1,1) NOT NULL,

    WorkerCode NVARCHAR(20) NOT NULL,

    UserId INT NOT NULL,

    FirstName NVARCHAR(100) NOT NULL,

    LastName NVARCHAR(100) NOT NULL,

    DateOfBirth DATE NULL,

    Gender NVARCHAR(20) NULL,

    MobileNumber NVARCHAR(20) NOT NULL,

    AddressLine1 NVARCHAR(200) NULL,

    AddressLine2 NVARCHAR(200) NULL,

    City NVARCHAR(100) NULL,

    PostCode NVARCHAR(20) NULL,

    EmploymentStatus NVARCHAR(20) NOT NULL DEFAULT('Active'),

    CreatedAt DATETIME2 NOT NULL DEFAULT(SYSDATETIME()),

    UpdatedAt DATETIME2 NULL,

    CONSTRAINT PK_Workers
        PRIMARY KEY (WorkerId),

    CONSTRAINT UQ_Workers_WorkerCode
        UNIQUE (WorkerCode),

    CONSTRAINT FK_Workers_Users
        FOREIGN KEY (UserId)
        REFERENCES Users(UserId)
);
