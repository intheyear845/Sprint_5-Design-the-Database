-- VIEWS

CREATE TABLE student (
    id SERIAL PRIMARY KEY,
    student_name VARCHAR(50) NOT NULL,
    class VARCHAR(10) NOT NULL,
    section VARCHAR(10) NOT NULL
);

INSERT INTO student (student_name, class, section)
VALUES
('Jim', '10', 'A'),
('Reem', '9', 'B'),
('Surya', '9', 'C'),
('Priya', '11', 'A'),
('April', '10', 'B'),
('Sarah', '12', 'A'),
('Sam', '9', 'A'),
('Sneha', '10', 'C'),
('Diya', '9', 'A'),
('Arjun', '11', 'C');

CREATE TABLE student_grade(
    id SERIAL PRIMARY KEY,
    student_id INTEGER REFERENCES student(id),
    subject VARCHAR(50) NOT NULL,
    grade VARCHAR(2) NOT NULL
);


INSERT INTO student_grade(student_id, subject, grade)
VALUES
(1, 'Chemistry', 'A'),
(1, 'Physics', 'B'),
(1, 'Biology', 'F'),
(2, 'Chemistry', 'B'),
(2, 'Physics', 'F'),
(2, 'Biology', 'C'),
(3, 'Chemistry', 'A'),
(3, 'Physics', 'F'),
(3, 'Biology', 'A'),
(4, 'Chemistry', 'A'),
(4, 'Physics', 'B'),
(4, 'Biology', 'F'),
(5, 'Chemistry', 'A'),
(5, 'Physics', 'A'),
(5, 'Biology', 'B'),
(6, 'Chemistry', 'F'),
(6, 'Physics', 'F'),
(6, 'Biology', 'F'),
(7, 'Chemistry', 'B'),
(7, 'Physics', 'C'),
(7, 'Biology', 'B'),
(8, 'Chemistry', 'C'),
(8, 'Physics', 'F'),
(8, 'Biology', 'A'),
(9, 'Chemistry', 'B'),
(9, 'Physics', 'B'),
(9, 'Biology', 'B'),
(10, 'Chemistry', 'B'),
(10, 'Physics', 'C'),
(10, 'Biology', 'A');


CREATE VIEW physics_failed AS SELECT student.student_name, student.class, student_grade.grade FROM student INNER JOIN 
student_grade ON student.id = student_grade.student_id 
WHERE student_grade.subject = 'Physics' AND student_grade.grade = 'F';


-- INDEX

INSERT INTO employees VALUES (
    2,
    'Manager',
    'Rebecca',
    'Yarros',
    'rebeccayarros@gmail.com',
    '9962323269',
    'Female',
    '1995-02-06'   
),
(
    3,
    'Manager',
    'Rick',
    'Riordan',
    'rickriordan@gmail.com',
    '9123456569',
    'Male',
    '1895-11-10'   
),
(
    4,
    'Manager',
    'John',
    'Green',
    'johngreen@gmail.com',
    '9384726459',
    'Male',
    '1985-07-03'
);

CREATE INDEX employee_email_idx ON employees(email);

