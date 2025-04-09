# PTBPABD-PT3032957

<h1>Criando a Conexão</h1>
![Image](https://github.com/user-attachments/assets/72e8e7cf-16ac-4e2f-9758-3840c6d35ca8)

<h1>Criando as Tabelas</h1>
![image](https://github.com/user-attachments/assets/de090f81-bd08-45b5-9d13-de62536b68db)

<h1>Arquivo SLQ Aula 04 </h1>
[Script.zip](https://github.com/user-attachments/files/19577779/Script.zip)

<h1>Aula 04.B.ac Expressões JOIN e Views</h1>
[Uploading Aula 04.B.ac Expressões JOIN e Views--Aula 04.B.ac Expressões JOIN e Views

--Questão 01
/*
select instructor.ID, instructor.name, COUNT(teaches.sec_id) as 'Número de sessões'
FROM instructor
LEFT OUTER JOIN  teaches
ON instructor.ID = teaches.ID
GROUP BY instructor.ID, instructor.name;*/


--Questão 02
/*
select instructor.ID, instructor.name,
(select COUNT(teaches.sec_id )
FROM teaches
where teaches.ID = instructor.ID) as 'Número de sessões'
FROM instructor
*/

-- Questão 03
/*
select teaches.course_id, teaches.sec_id,instructor.ID, teaches.year,teaches.semester,instructor.name
FROM instructor
JOIN teaches
ON instructor.ID = teaches.ID
WHERE teaches.year = 2010 AND teaches.semester = 'Spring';
*/

--Questão 04

--Não consigo deixar um unico nome e tenho raiva de quem consegue, fique com meu humilde order by
/*
select student.ID,student.name, department.dept_name,takes.grade,course.credits,
	course.credits *
    CASE
        WHEN takes.grade = 'A+' THEN 4.0
        WHEN takes.grade = 'A'  THEN 3.7
        WHEN takes.grade = 'A-' THEN 3.4
        WHEN takes.grade = 'B+' THEN 3.0
        WHEN takes.grade = 'B'  THEN 2.8
        ELSE 0
    END
    AS soma
FROM student
JOIN takes ON student.ID = takes.ID
JOIN course ON takes.course_id = course.course_id
JOIN department ON student.dept_name = department.dept_name
ORDER BY student.ID;
*/
--Questão 05
/*
CREATE VIEW coeficiente_rendimento AS select student.ID,student.name, department.dept_name,takes.grade,course.credits,
	course.credits *
    CASE
        WHEN takes.grade = 'A+' THEN 4.0
        WHEN takes.grade = 'A'  THEN 3.7
        WHEN takes.grade = 'A-' THEN 3.4
        WHEN takes.grade = 'B+' THEN 3.0
        WHEN takes.grade = 'B'  THEN 2.8
        ELSE 0
    END
    AS pontos
FROM student
JOIN takes
ON student.ID = takes.ID
JOIN course
ON takes.course_id = course.course_id
JOIN department
ON student.dept_name = department.dept_name;

select *
FROM coeficiente_rendimento */


.sql…]()
