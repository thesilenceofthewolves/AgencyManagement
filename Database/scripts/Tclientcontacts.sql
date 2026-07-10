CREATE TABLE ClientContacts
(
    ClientContactId INT IDENTITY(1,1) PRIMARY KEY,

    BranchId INT NOT NULL,

    FirstName NVARCHAR(100) NOT NULL,

    LastName NVARCHAR(100) NOT NULL,

    JobTitle NVARCHAR(100) NULL,

    PhoneNumber NVARCHAR(20) NULL,

    Email NVARCHAR(255) NULL,

    IsActive BIT NOT NULL DEFAULT(1),

    CreatedDate DATETIME2 NOT NULL DEFAULT(GETDATE()),

    UpdatedDate DATETIME2 NULL,

    CONSTRAINT FK_ClientContacts_Branches
        FOREIGN KEY (BranchId)
        REFERENCES Branches(BranchId),

    CONSTRAINT UQ_ClientContact_Email
    UNIQUE (BranchId, Email)



);
GO