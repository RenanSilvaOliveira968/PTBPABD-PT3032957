CREATE TRIGGER dbo.trigger_prevent_assignment_teaches 
ON dbo.teaches
AFTER INSERT
AS
BEGIN
    SET NOCOUNT ON;

    IF EXISTS (
        SELECT 1
        FROM inserted i
        WHERE (
            SELECT COUNT(*) 
            FROM teaches t 
            WHERE t.ID = i.ID
        ) > 2
    )
    BEGIN

        ROLLBACK TRANSACTION;
        
    END
END;
