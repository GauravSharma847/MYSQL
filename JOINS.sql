-- Joins are the tools that are used to accesss data from
-- two or more tables with the help of common key or attribute.

-- JOIN TYPES
-- Inner Join - common data between tables is called inner join

-- Left-Outer-Join -  complete data of left table 

-- Right-Outer-Join - complete data of right table
 
--  Join Sql command for getting data of the table is not possible in MySQl
    -- But using union command we can combine left outer join and right outr join 

CREATE TABLE DEPARTMENT
(
   DEPTCODE   INT(10) PRIMARY KEY ,
   DeptName   VARCHAR(15) UNIQUE,
   LOCATION VARCHAR(33) NOT NULL;

);

INSERT INTO DEPARTMENT VALUES (10, 'FINANCE', 'EDINBURGH'),
                              (20,'SOFTWARE','PADDINGTON'),
                              (30, 'SALES', 'MAIDSTONE'),
                              (40,'MARKETING', 'DARLINGTON'),
                              (50,'ADMIN', 'BIRMINGHAM');


-- SYNTAX 
-- SELECT Column name 
-- FROM table 1
-- INNERJOIN table 2 ON table 1.columnName = table 2.columnName

SELECT * FROM department
INNER JOIN employee 
ON 
employee.DEPTCODE=department.DEPTCODE;

SELECT * 
FROM employee
INNER JOIN department ON
employee.DeptCode = department.DeptCode;

-- **************

SELECT employee.DeptCode,department.DeptName,department.LOCATION,employee.EmpFName
FROM employee
RIGHT JOIN department ON
employee.DeptCode = department.DeptCode;