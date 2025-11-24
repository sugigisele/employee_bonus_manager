##Employee Bonus Manager (PL/SQL Project)


#Overview



#Employee Bonus Manager is a PL/SQL project that demonstrates the use of Collections, Records, GOTO statements, and Transaction Control through a realistic business scenario.
The project simulates how a company might calculate and manage employee bonuses while handling missing data and database interactions safely.

It is designed as a stored procedure that can be compiled and executed in Oracle SQL Developer.

Objectives
This project aims to:

Show the use of all three PL/SQL collection types: Associative Arrays, Nested Tables, and VARRAYs.
Demonstrate all three record types: User-defined, Table-based, and Cursor-based records.
Implement GOTO for flow control and error handling.
Apply transaction control (SAVEPOINT, ROLLBACK).
Use exception handling to manage runtime errors gracefully.
Represent a real-world problem that connects PL/SQL programming with business logic.
Problem Definition
A company wants to manage and compute employee performance bonuses.

Employee salaries are stored in a Nested Table collection.
Each employee’s profile (ID, name, department, salary, bonus) is managed through a Record.
Cities where employees work are stored in an Associative Array.
Recent bonus values are kept in a VARRAY.
If an employee’s salary is missing (NULL), the procedure skips processing that employee using a GOTO statement and rolls back to a savepoint.
Concepts Demonstrated
Concept Description
Associative Array Key-value pairs (Employee ID → City)
VARRAY Fixed-size array of recent bonuses
Nested Table Dynamic collection of employee salaries
User-defined Record Custom record type for employee details
Table-based Record Uses %ROWTYPE to fetch a full row from employees
Cursor-based Record Loops through query results one by one
GOTO Statement Skips invalid salary entries
Transaction Control Uses SAVEPOINT and ROLLBACK TO
Exception Handling Handles unexpected runtime errors
DBMS_OUTPUT Displays formatted output for readability
What I Learned
How to use and differentiate Associative Arrays, VARRAYs, and Nested Tables.
How to design and use Records in different contexts.
The importance of transaction control in PL/SQL.
Practical use of GOTO for skipping invalid data.
Writing modular, reusable PL/SQL procedures.
Author

SUGI Gisele Software Engineering Student – AUCA Database Development with PL/SQL November 2025 Instructor: Eric Maniraguha
