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
)
INSERT INTO Workers
(
    FirstName,
    LastName,
    Email,
    PhoneNumber,
    CreatedDate,
    EmploymentEndDate,
    EmploymentEndReason,
    Status
)
SELECT
    fn.Name AS FirstName,
    ln.Name AS LastName,
    LOWER(fn.Name + '.' + ln.Name + CAST(n.n AS NVARCHAR(4)) + '@' + d.Domain),
    '07' + RIGHT('000000000' + CAST(ABS(CHECKSUM(NEWID())) % 1000000000 AS VARCHAR(9)), 9),
    GETDATE(),              -- required, NOT NULL
    NULL,                   -- still employed
    NULL,                   -- no reason
    ra.Status               -- random 1–6
FROM Numbers n
CROSS APPLY (SELECT TOP 1 Name FROM @FirstNames ORDER BY NEWID()) fn
CROSS APPLY (SELECT TOP 1 Name FROM @LastNames ORDER BY NEWID()) ln
CROSS APPLY (SELECT TOP 1 Domain FROM @Domains ORDER BY NEWID()) d
CROSS APPLY (SELECT ABS(CHECKSUM(NEWID())) % 6 + 1 AS Status) ra;
