CREATE OR REPLACE PROCEDURE insert_student (
    IN student_name VARCHAR (50),
    IN class VARCHAR (10),
    IN section VARCHAR (10)
)
LANGUAGE SQL
AS $$
INSERT INTO student (student_name, class, section)
VALUES (student_name, class, section);
$$;


-- CREATE OR REPLACE PROCEDURE update_student_grade (
--     IN p_student_id INT,
--     IN p_subject VARCHAR (50),
--     IN p_grade VARCHAR (2)
-- )
-- LANGUAGE SQL
-- AS $$
-- UPDATE student_grade
-- SET student_grade.grade = p_grade
-- WHERE student_grade.student_id = p_student_id AND student_grade.subject = p_subject
-- ORDER BY student_grade.id;
-- $$;

SELECT proname
FROM pg_proc
WHERE pronamespace = (SELECT oid FROM pg_namespace WHERE nspname = 'public');


CREATE OR REPLACE PROCEDURE update_employee(
    IN employee_id NUMERIC,
    IN employee_phone VARCHAR (100)
)

LANGUAGE 'plpgsql'
AS $$
BEGIN
UPDATE employees
SET phone = employee_phone
WHERE pk_emp_id = employee_id;
END;
$$;

storedb=# CALL update_employee(2, '1234123455');
CALL
storedb=# SELECT * FROM employees;
 pk_emp_id |  type   | first_name | last_name |          email          |   phone    | gender |    dob
-----------+---------+------------+-----------+-------------------------+------------+--------+------------
         1 | Manager | Jane       | Austen    | janeausten@gmail.com    | 9965473569 | Female | 1775-12-16
         3 | Manager | Rick       | Riordan   | rickriordan@gmail.com   | 9123456569 | Male   | 1895-11-10
         4 | Manager | John       | Green     | johngreen@gmail.com     | 9384726459 | Male   | 1985-07-03
         2 | Manager | Rebecca    | Yarros    | rebeccayarros@gmail.com | 1234123455 | Female | 1995-02-06
(4 rows)