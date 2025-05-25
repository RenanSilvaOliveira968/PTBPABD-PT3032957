CREATE TRIGGER dbo.lost_credits
ON takes
FOR DELETE
AS
BEGIN

	UPDATE Student
	Set tot_cred = tot_cred - c.credits
	FROM Student S
	JOIN DELETED D ON D.ID = S.ID
	JOIN course c ON c.course_id = D.course_id;


END
