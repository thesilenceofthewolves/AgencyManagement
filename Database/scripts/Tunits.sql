CREATE TABLE Units
(
    UnitId INT IDENTITY(1,1) PRIMARY KEY,

    BranchId INT NOT NULL,

    UnitName NVARCHAR(200) NOT NULL,

    UnitCode NVARCHAR(50) NULL,

    Description NVARCHAR(500) NULL,

    IsActive BIT NOT NULL DEFAULT(1),

    CreatedDate DATETIME2 NOT NULL DEFAULT(GETDATE()),

    UpdatedDate DATETIME2 NULL,

    CONSTRAINT FK_Units_Branches
        FOREIGN KEY (BranchId)
        REFERENCES Branches(BranchId),

    CONSTRAINT UQ_BranchUnit
        UNIQUE (BranchId, UnitName),

    CONSTRAINT UQ_UnitCode
        UNIQUE (UnitCode)
);
GO