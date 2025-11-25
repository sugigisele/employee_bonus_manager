CREATE TABLE employees (
    employee_id   NUMBER PRIMARY KEY,
    first_name    VARCHAR2(50),
    last_name     VARCHAR2(50),
    department_id NUMBER,
    salary        NUMBER
);

INSERT INTO employees VALUES (100, 'Alice', 'Niyonsaba', 10, 2000);
INSERT INTO employees VALUES (101, 'John', 'Doe', 10, 3000);
INSERT INTO employees VALUES (102, 'Grace', 'Uwimana', 20, NULL);
INSERT INTO employees VALUES (103, 'Eric', 'Manzi', 10, 2500);
INSERT INTO employees VALUES (104, 'Diane', 'Mugisha', 30, 4000);
COMMIT;

-- Departments Table
CREATE TABLE departments (
    department_id NUMBER PRIMARY KEY,
    dept_name     VARCHAR2(50)
);

INSERT INTO departments VALUES (10, 'Sales');
INSERT INTO departments VALUES (20, 'Finance');
INSERT INTO departments VALUES (30, 'HR');
COMMIT;
