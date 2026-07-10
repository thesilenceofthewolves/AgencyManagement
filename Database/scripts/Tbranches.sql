CREATE TABLE Branches
(
    BranchId INT IDENTITY(1,1) PRIMARY KEY,

    ClientId INT NOT NULL,

    BranchName NVARCHAR(200) NOT NULL,

    PhoneNumber NVARCHAR(20) NULL,

    Email NVARCHAR(255) NULL,

    Address NVARCHAR(255) NULL,

    City NVARCHAR(100) NULL,

    PostCode NVARCHAR(20) NULL,

    IsActive BIT NOT NULL DEFAULT(1),

    CreatedDate DATETIME2 NOT NULL DEFAULT(GETDATE()),

    UpdatedDate DATETIME2 NULL,

    CONSTRAINT FK_Branches_Clients
        FOREIGN KEY (ClientId)
        REFERENCES Clients(ClientId),

    CONSTRAINT UQ_ClientBranch
        UNIQUE (ClientId, BranchName)
);
GO