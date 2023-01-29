CREATE TABLE workers(
    id SERIAL PRIMARY KEY,
    name text CONSTRAINT name_null CHECK (name != '') NOT NULL,
    salary int NOT NULL,
    birthday date CONSTRAINT birthday_incorrect CHECK (birthday < current_date)
);

--1
INSERT INTO workers(name, salary, birthday) VALUES 
('Oleg', 300, '1998-03-26');

--2
INSERT INTO workers(name, salary, birthday) VALUES
('Jaroslava', 500, '1994-09-12');

--3
INSERT INTO workers(name, salary, birthday) VALUES
('Sasha', 1000, '1999-12-30'),
('Masha', 200, '1995-11-01');

--4
UPDATE workers 
SET salary = 500
WHERE name = 'Oleg';

--5
UPDATE workers
SET salary = 400
WHERE salary > 500;

--6
SELECT * FROM workers
WHERE salary > 400;

--7
SELECT * FROM workers
WHERE id = 4;

--8
SELECT extract('years' from age(birthday)) AS "вік", salary AS "заробітна платня" 
FROM workers
WHERE name = 'Zhenya';

--9
SELECT * FROM workers
WHERE name = 'Petya';

--10
SELECT * FROM workers
WHERE extract('years' from age(birthday)) = 27 OR salary > 800;

--11
SELECT name, extract('years' from age(birthday)) AS age FROM workers
WHERE extract('years' from age(birthday)) BETWEEN 25 AND 28;

--12
SELECT id, name, birthday FROM workers
WHERE extract('month' from birthday) = 9;

--13
DELETE FROM workers
WHERE id = 4;

--14
DELETE FROM workers
WHERE name = 'Oleg';

--15
DELETE FROM workers
WHERE extract('years' from age(birthday)) > 30;
