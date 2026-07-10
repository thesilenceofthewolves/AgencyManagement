DROP TABLE IF EXISTS WorkerWalifications;
CREATE TABLE WorkerQualifications
(
    WorkerQualificationId INT IDENTITY(1,1) PRIMARY KEY,

    WorkerId INT NOT NULL,

    QualificationId INT NOT NULL,

    IssueDate DATE NULL,

    ExpiryDate DATE NULL,

    Notes NVARCHAR(255) NULL,

    CONSTRAINT FK_WorkerQualifications_Worker
        FOREIGN KEY (WorkerId)
        REFERENCES Workers(WorkerId),

    CONSTRAINT FK_WorkerQualifications_Qualification
        FOREIGN KEY (QualificationId)
        REFERENCES Qualifications(QualificationId),

    CONSTRAINT UQ_WorkerQualification
        UNIQUE (WorkerId, QualificationId)
);
GO