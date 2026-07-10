DROP TABLE IF EXISTS Availability;
GO

CREATE TABLE Availability
(
    AvailabilityId INT IDENTITY(1,1) PRIMARY KEY,

    WorkerId INT NOT NULL,

    AvailableDate DATE NOT NULL,

    StartTime TIME NOT NULL,

    EndTime TIME NOT NULL,

    Notes NVARCHAR(255) NULL,

    CONSTRAINT FK_Availability_Worker
        FOREIGN KEY (WorkerId)
        REFERENCES Workers(WorkerId),

    CONSTRAINT CK_Availability_Time
        CHECK (StartTime < EndTime),

    CONSTRAINT UQ_Availability
        UNIQUE
        (
            WorkerId,
            AvailableDate,
            StartTime,
            EndTime
        )
);
GO