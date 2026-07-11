DECLARE @FirstNames TABLE (Name NVARCHAR(50));
INSERT INTO @FirstNames VALUES
('John'),('Jane'),('Michael'),('Sarah'),('David'),
('Emma'),('James'),('Olivia'),('Daniel'),('Sophia'),
('William'),('Emily'),('Thomas'),('Grace'),('Joseph'),
('Chloe'),('Matthew'),('Charlotte'),('Andrew'),('Amelia');

DECLARE @LastNames TABLE (Name NVARCHAR(50));
INSERT INTO @LastNames VALUES
('Smith'),('Jones'),('Brown'),('Taylor'),('Wilson'),
('Davies'),('Thomas'),('Roberts'),('Evans'),('Walker'),
('Johnson'),('White'),('Harris'),('Martin'),('Lewis'),
('Clark'),('Hall'),('Allen'),('Young'),('King');

DECLARE @Domains TABLE (Domain NVARCHAR(50));
INSERT INTO @Domains VALUES
('test.com'),('wax.com'),('mail.com'),('example.com');

;WITH Numbers AS
(
    SELECT TOP (100)
        ROW_NUMBER() OVER (ORDER BY (SELECT NULL)) AS n
    FROM sys.objects
),
RandomData AS
(
    SELECT 
        n,
        (SELECT TOP 1 Name FROM @FirstNames ORDER BY NEWID()) AS FirstName,
        (SELECT TOP 1 Name FROM @LastNames ORDER BY NEWID()) AS LastName,
        (SELECT TOP 1 Domain FROM @Domains ORDER BY NEWID()) AS Domain
    FROM Numbers
)
INSERT INTO Workers (FirstName, LastName, Email, PhoneNumber, IsActive, CreatedDate)
SELECT
    FirstName,
    LastName,
    LOWER(FirstName + '.' + LastName + CAST(n AS NVARCHAR(4)) + '@' + Domain),
    '07' + RIGHT('000000000' + CAST(ABS(CHECKSUM(NEWID())) % 1000000000 AS VARCHAR(9)), 9),
    ABS(CHECKSUM(NEWID())) % 6 + 1,   -- RANDOM 1–6 PER ROW
    GETDATE()                         -- REQUIRED because CreatedDate is NOT NULL
FROM RandomData;
