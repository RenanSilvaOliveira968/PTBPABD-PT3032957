CREATE PROCEDURE student_grade_points @Grade VARCHAR(5)
AS BEGIN
SELECT s.name,s.dept_name, c.title, c.dept_name,t.semester, t.year,t.grade

From Student s

Join
	takes t On t.ID = s.ID
JOIN
	course c ON c.course_id = t.course_id
	WHERE t.grade = @Grade
end;

EXEC student_grade_points 'A+';


CREATE FUNCTION return_instructor_location (@nomeProfessor VARCHAR(30))
RETURNS TABLE
AS
	RETURN (
		SELECT
		i.name,
		c.title,
		t.semester,
		t.year,
		s.building,
		s.room_number

		FROM instructor i

		jOIN teaches t ON t.ID = i.ID

		JOIN section s ON t.course_id = s.course_id

		JOIN course c ON c.course_id = s.course_id

		WHERE i.name = @nomeProfessor
);

SELECT * FROM dbo.return_instructor_location('Lembr');

