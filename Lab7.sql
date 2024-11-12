CREATE TABLE countries (
    id SERIAL PRIMARY KEY,
    name VARCHAR(50)
);
CREATE TABLE employees (
    id SERIAL PRIMARY KEY,
    name VARCHAR(50),
    surname VARCHAR(50),
    salary INTEGER
);
CREATE TABLE departments (
    department_id SERIAL PRIMARY KEY,
    budget INTEGER
);

INSERT INTO countries (name)
VALUES ('Kazakhstan'),
       ('USA'),
       ('Canada');

INSERT INTO employees (name, surname, salary)
VALUES ('Marshall', 'New', 50000),
       ('Asan', 'Mathers', 65000),
       ('Dan', 'Ball', 40000);

INSERT INTO departments (budget)
VALUES(100000),
      (300000),
      (500000);


CREATE INDEX idx_countries_name ON countries (name);
SELECT * FROM countries WHERE name = 'Canada';


CREATE INDEX idx_employees_name_surname ON employees (name, surname);
SELECT * FROM employees WHERE name = 'Asan' AND surname = 'Mathers';


CREATE UNIQUE INDEX idx_employees_salary ON employees (salary);
SELECT * FROM employees WHERE salary < 70000 AND salary > 40000;


CREATE INDEX idx_employees_name_sub ON employees ((substring(name FROM 1 FOR 4)));
SELECT * FROM employees WHERE substring(name FROM 1 FOR 4) = 'Dan';


CREATE INDEX idx_departments_budget_salary2 ON departments (budget);
CREATE INDEX idx_employees_salary2 ON employees (salary);
SELECT *
FROM employees e
JOIN departments d ON d.department_id = e.id WHERE d.budget > 150000 AND e.salary < 50000;