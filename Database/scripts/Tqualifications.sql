DROP TABLE IF EXISTS Qualifications ;
CREATE TABLE Qualifications
(
    QualificationId INT IDENTITY(1,1) PRIMARY KEY,

    QualificationName NVARCHAR(100) NOT NULL,

    Description NVARCHAR(255) NULL,

    IsActive BIT NOT NULL DEFAULT(1),

    CONSTRAINT UQ_Qualification UNIQUE(QualificationName)
);
GO