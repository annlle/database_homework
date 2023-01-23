CREATE TABLE students(
    student_id serial PRIMARY KEY,
    first_name varchar(255)  NOT NULL CONSTRAINT empty_f_name CHECK(first_name !=''),
    last_name varchar(255)  NOT NULL CONSTRAINT empty_l_name CHECK(last_name !=''),
    group_name text REFERENCES groups(name_of_group)
);

CREATE TABLE groups(
    group_id serial PRIMARY KEY,
    name_of_group text NOT NULL CONSTRAINT empty_group CHECK(name_of_group !=''),
    faculty int REFERENCES faculties(faculty_id)
);

ALTER TABLE groups
ADD CONSTRAINT uniqel UNIQUE (name_of_group);

CREATE TABLE faculties(
    faculty_id serial PRIMARY KEY,
    name_of_fac varchar(255) NOT NULL CONSTRAINT empty_fac CHECK(name_of_fac !='')
);

CREATE TABLE disciplines(
    discipline_id serial PRIMARY KEY,
    name_of_discipline varchar(255) CONSTRAINT empty_discipline CHECK(name_of_discipline !='')
);

ALTER TABLE disciplines
ADD COLUMN teacher int REFERENCES teachers(teacher_id);

CREATE TABLE exams(
    student int REFERENCES students(student_id),
    discipline int REFERENCES disciplines(discipline_id),
    grade int NOT NULL
);

CREATE TABLE teachers(
    teacher_id serial PRIMARY KEY,
    first_name varchar(255) NOT NULL,
    last_name varchar(255) NOT NULL,
);

ALTER TABLE teachers
ADD COLUMN discipline int REFERENCES disciplines(discipline_id);


INSERT INTO faculties(name_of_fac) VALUES
('Faculty of Computer Sciencies and Technologies'),
('Faculty of Humanities'),
('Faculty of Economic');

INSERT INTO groups(name_of_group, faculty) VALUES 
('KNT-132', 1), ('GF-312', 2), ('FE-722',3);

INSERT INTO students(first_name, last_name, group_name) VALUES
('Anatoliy', 'Smyk', 'GF-312'), 
('Dmytro','Trofymov', 'KNT-132'), 
('Tetyana','Chervona', 'FE-722');

INSERT INTO teachers(first_name, last_name) VALUES
('Natallya', 'Romanenko'), ('Galyna','Vyshnyakova'), ('Mark','Ryabov');

INSERT INTO disciplines(name_of_discipline) VALUES
('Basics of programming'), ('English'), ('Finances');

UPDATE teachers SET discipline = 1 WHERE teacher_id = 3;
UPDATE teachers SET discipline = 2 WHERE teacher_id = 1;
UPDATE teachers SET discipline = 3 WHERE teacher_id = 2;

UPDATE disciplines SET teacher = 1 WHERE discipline_id = 2;
UPDATE disciplines SET teacher = 2 WHERE discipline_id = 3;
UPDATE disciplines SET teacher = 3 WHERE discipline_id = 1;

INSERT INTO exams VALUES
(1, 2, 80), (2,1,90), (3,3,95)