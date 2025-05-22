CREATE PROCEDURE dbo.salaryHistogram
    @NumIntervals INT
AS
BEGIN
    SET NOCOUNT ON;

    DECLARE 
        @MinSalary DECIMAL(10, 2),
        @MaxSalary DECIMAL(10, 2),
        @IntervalSize DECIMAL(10, 2),
        @CurrentIntervalStart DECIMAL(10, 2),
        @CurrentIntervalEnd DECIMAL(10, 2),
        @i INT = 1;


    SELECT 
        @MinSalary = MIN(Salary),
        @MaxSalary = MAX(Salary)
    FROM Instructor;


    SET @IntervalSize = (@MaxSalary - @MinSalary) / @NumIntervals;

   
    SET @CurrentIntervalStart = @MinSalary;


    WHILE @i <= @NumIntervals
    BEGIN
        
        SET @CurrentIntervalEnd = 
            CASE 
                WHEN @i = @NumIntervals THEN @MaxSalary + 0.01 -- inclui o maior salário no último intervalo
                ELSE @CurrentIntervalStart + @IntervalSize
            END;

  
        SELECT
            CONCAT(FORMAT(@CurrentIntervalStart, '0.00'), ' - ', FORMAT(@CurrentIntervalEnd, '0.00')) AS SalaryRange,
            COUNT(*) AS Frequency
        FROM Instructor
        WHERE Salary >= @CurrentIntervalStart AND Salary < @CurrentIntervalEnd;

        SET @CurrentIntervalStart = @CurrentIntervalEnd;
        SET @i = @i + 1;
    END
END;
