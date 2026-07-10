DROP TABLE IF EXISTS WorkerRoles;
CREATE TABLE WorkerRoles
(
    WorkerRoleId INT IDENTITY(1,1) PRIMARY KEY,

    WorkerId INT NOT NULL,
    JobRoleId INT NOT NULL,

    IsPrimaryRole BIT NOT NULL DEFAULT(0),

    CreatedDate DATETIME2 NOT NULL DEFAULT(GETDATE()),

    CONSTRAINT FK_WorkerRoles_Workers
        FOREIGN KEY (WorkerId)
        REFERENCES Workers(WorkerId),

    CONSTRAINT FK_WorkerRoles_JobRoles
        FOREIGN KEY (JobRoleId)
        REFERENCES JobRoles(JobRoleId),

    CONSTRAINT UQ_WorkerRole UNIQUE (WorkerId, JobRoleId)
);