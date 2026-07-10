CREATE TABLE UserRoles
(
    UserId INT NOT NULL,

    RoleId INT NOT NULL,

    CreatedAt DATETIME2 NOT NULL DEFAULT(SYSDATETIME()),

    CONSTRAINT PK_UserRoles
        PRIMARY KEY (UserId, RoleId),

    CONSTRAINT FK_UserRoles_Users
        FOREIGN KEY (UserId)
        REFERENCES Users(UserId),

    CONSTRAINT FK_UserRoles_Roles
        FOREIGN KEY (RoleId)
        REFERENCES Roles(RoleId)
);