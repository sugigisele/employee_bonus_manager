CREATE OR REPLACE PROCEDURE manage_bonuses IS
    -- Collection Types
    TYPE CityMap IS TABLE OF VARCHAR2(50) INDEX BY PLS_INTEGER;
    v_city CityMap;

    TYPE BonusArray IS VARRAY(3) OF NUMBER;
    v_recent_bonuses BonusArray := BonusArray(100, 150, 200);

    TYPE SalaryTable IS TABLE OF NUMBER;
    v_salaries SalaryTable := SalaryTable(2000, 3000, NULL, 2500, 4000);

    TYPE EmployeeRec IS RECORD (
        emp_id    NUMBER,
        emp_name  VARCHAR2(50),
        dept_name VARCHAR2(50),
        salary    NUMBER,
        bonus     NUMBER
    );
    v_emp EmployeeRec;

    emp_row employees%ROWTYPE;
    CURSOR c_emp IS
        SELECT employee_id, first_name, salary FROM employees;
    emp_cursor_rec c_emp%ROWTYPE;

BEGIN
    DBMS_OUTPUT.PUT_LINE('===== EMPLOYEE BONUS MANAGER (Procedure) =====');

    -- Associative Array
    v_city(100) := 'Kigali';
    v_city(101) := 'Musanze';
    v_city(102) := 'Huye';
    v_city(103) := 'Rubavu';
    v_city(104) := 'Nyamata';

    -- Loop through salaries using Nested Table
    FOR i IN 1 .. v_salaries.COUNT LOOP
        v_emp.emp_id := 100 + i;
        v_emp.emp_name := 'Employee_' || i;
        v_emp.dept_name := 'Sales';
        v_emp.salary := v_salaries(i);

        SAVEPOINT start_process;

        IF v_emp.salary IS NULL THEN
            DBMS_OUTPUT.PUT_LINE('Invalid salary for ' || v_emp.emp_name || '. Skipping...');
            ROLLBACK TO start_process;
            GOTO skip_record;
        END IF;

        v_emp.bonus := v_emp.salary * 0.10;

        DBMS_OUTPUT.PUT_LINE('ID: ' || v_emp.emp_id);
        DBMS_OUTPUT.PUT_LINE('Name: ' || v_emp.emp_name);
        DBMS_OUTPUT.PUT_LINE('Department: ' || v_emp.dept_name);
        DBMS_OUTPUT.PUT_LINE('Salary: ' || v_emp.salary);
        DBMS_OUTPUT.PUT_LINE('Bonus: ' || v_emp.bonus);
        DBMS_OUTPUT.PUT_LINE('City: ' || v_city(v_emp.emp_id));
        DBMS_OUTPUT.PUT_LINE('Recent Bonuses: ' ||
            v_recent_bonuses(1) || ', ' || v_recent_bonuses(2) || ', ' || v_recent_bonuses(3));

        <<skip_record>>
        NULL;
    END LOOP;

    -- Table-based Record
    DBMS_OUTPUT.PUT_LINE('===== TABLE-BASED RECORD DEMO =====');
    SELECT * INTO emp_row FROM employees WHERE employee_id = 100;
    DBMS_OUTPUT.PUT_LINE('Employee Name: ' || emp_row.first_name || ' ' || emp_row.last_name ||
                         ' | Salary: ' || emp_row.salary);

    -- Cursor-based Record
    DBMS_OUTPUT.PUT_LINE('===== CURSOR-BASED RECORD DEMO =====');
    OPEN c_emp;
    LOOP
        FETCH c_emp INTO emp_cursor_rec;
        EXIT WHEN c_emp%NOTFOUND;
        DBMS_OUTPUT.PUT_LINE('ID: ' || emp_cursor_rec.employee_id ||
                             ', Name: ' || emp_cursor_rec.first_name ||
                             ', Salary: ' || emp_cursor_rec.salary);
    END LOOP;
    CLOSE c_emp;

    DBMS_OUTPUT.PUT_LINE('===== PROCEDURE EXECUTED SUCCESSFULLY =====');

EXCEPTION
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('Unexpected error: ' || SQLERRM);
END;
/
    -- TESTING THE PROCEDURE
SET SERVEROUTPUT ON;
EXEC manage_bonuses;
