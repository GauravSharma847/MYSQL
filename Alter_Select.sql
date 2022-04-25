CREATE TABLE employee(
    --Unique annnd NoT NULL
    EmpCode INT(4) ,
    EmpFName VARCHAR(40) NOT NULL ,
    EmpName VARCHAR(20) ,
    Job VARCHAR(50) NOT NULL,
    -- correct char to int
    ManagerCode CHAR(4),
    HireDate DATE NOT NULL,
    --salary datatype add
    salary INT(20) NOT NULL,
    commision INT(20),
    DeptCode INT(3) NOT NULL
    --email
);

-- ALTER 
    -- column -> add,remove,rename
        -- add column
            -- ALTER TABLE tablename
                -- ADD COLUMN columnName Datatype;
                ALTER TABLE employee
                    ADD email VARCHaR(50) NOT NULL;
                -- ADD COLUMN AFTER
                ALTER TABLE employee
                    ADD COLUMN dob DATE
                    AFTER EmpName;
                -- ADD COLUMN FIRST
                ALTER TABLE employee
                    ADD COLUMN ManagerFName VARCHAR(40)
                    FIRST;
        -- REMOVE
            ALTER TABLE employee
            DROP COLUMN ManagerFName;
            DROP COLUMN dob; 
        -- Rename Column name with Constraint
            ALTER TABLE employee
            CHANGE ManagerCode NewManagerCode int(5);

            ALTER TABLE employee
            CHANGE COLUMN Job designation VARCHAR(50) NOT NULL;

-- constrainsts -> add,remove,modify
    -- add
    ALTER TABLE employee
    CHANGE COLUMN EmpCode EmpCode INT(4) UNIQUE NOT NULL;

    ALTER TABLE employee
    CHANGE COLUMN Salary Salary FLOAT;

    -- remove
    ALTER TABLE employee
    CHANGE COLUMN DeptCode DeptCode INT(3);

      --INSERT
    INSERT INTO EMPLOYEE  
VALUES (9369, 'TONY', 'STARK', 'SOFTWARE ENGINEER', 7902, '1980-12-17', 2800,0,20,"abc@gmail.com"),
       (9499, 'TIM', 'ADOLF', 'SALESMAN', 7698, '1981-02-20', 1600, 300,30,"abc@gmail.com"),    
       (9566, 'KIM', 'JARVIS', 'MANAGER', 7839, '1981-04-02', 3570,0,20,"abc@gmail.com"),
       (9654, 'SAM', 'MILES', 'SALESMAN', 7698, '1981-09-28', 1250, 1400, 30,"abc@gmail.com"),
       (9782, 'KEVIN', 'HILL', 'MANAGER', 7839, '1981-06-09', 2940,0,10,"abc@gmail.com"),
       (9788, 'CONNIE', 'SMITH', 'ANALYST', 7566, '1982-12-09', 3000,0,20,"abc@gmail.com"),
       (9839, 'ALFRED', 'KINSLEY', 'PRESIDENT', 7566, '1981-11-17', 5000,0, 10,"abc@gmail.com"),
       (9844, 'PAUL', 'TIMOTHY', 'SALESMAN', 7698, '1981-09-08', 1500,0,30,"abc@gmail.com"),
       (9876, 'JOHN', 'ASGHAR', 'SOFTWARE ENGINEER', 7788, '1983-01-12',3100,0,20,"abc@gmail.com"),
       (9900, 'ROSE', 'SUMMERS', 'TECHNICAL LEAD', 7698, '1981-12-03', 2950,0, 20,"abc@gmail.com"),
       (9902, 'ANDREW', 'FAULKNER', 'ANAYLYST', 7566, '1981-12-03', 3000,0, 10,"abc@gmail.com"),
       (9934, 'KAREN', 'MATTHEWS', 'SOFTWARE ENGINEER', 7782, '1982-01-23', 3300,0,20,"abc@gmail.com"),
       (9591, 'WENDY', 'SHAWN', 'SALESMAN', 7698, '1981-02-22', 500,0,30,"abc@gmail.com"),
       (9698, 'BELLA', 'SWAN', 'MANAGER', 7839, '1981-05-01', 3420, 0,30,"abc@gmail.com"),
       (9777, 'MADII', 'HIMBURY', 'ANALYST', 7839, '1981-05-01', 2000, 200, NULL,"abc@gmail.com"),
       (9860, 'ATHENA', 'WILSON', 'ANALYST', 7839, '1992-06-21', 7000, 100, 50,"abc@gmail.com"),
       (9861, 'JENNIFER', 'HUETTE', 'ANALYST', 7839, '1996-07-01', 5000, 100, 50,"abc@gmail.com");
    
-- Select Keyword
    -- select everything
    SELECT * from employee;
    -- select needed columns
    SELECT EmpCode,EmpFName,EmpName FROM employee;

    -- clauses
    --  -> where (for putting conditions)
        SELECT * FROM employee 
        WHERE  salary>2000 ;
        
        SELECT EmpFName,EmpName,DeptCode FROM employee
        WHERE EmpCode=7566;

        -- not equals to(<>)
        SELECT EmpFName,EmpName,DeptCode FROM employee
        WHERE EmpCode<>7566;

        --  OPERATORS :
            -- comparisons : =,>,<,>=,<=
            -- <> -> not equals to
            -- Logical Operators : AND,BETWEEN,LIKE,NOT
    
            -- ORDER BY
            -- by default orderiing is ascending order
            SELECT * FROM employee
            ORDER BY Salary;   

            -- In descending order
            SELECT * FROM employee
            ORDER BY Salary DESC; 

            -- in the case of common order data(for say same salary)
            SELECT * FROM employee
            ORDER BY Salary DESC, DeptCode ASC; 

            -- aggregate functions: count,sum,avg,max,min
                
            -- count number of employees
                SELECT count(*) FROM employee;
            -- count average salary
                SELECT avg(*) FROM employee;
            -- highest earner data
                SELECT max(*) FROM employee;
            -- total salary
                SELECT sum(*) FROM employee;

            -- GROUP BY (group by is used to group the key passed and function id applied on group by keyword)
            -- it will group the deptcode for say 
            -- one group including all 10,one group including 20 similary  30,40 etc
            -- and then conditions or Aggregate functions are applied on these groups
            -- for function max(salary)
            -- it will display max(salary) from each of
            -- 10,20,30,40 etc
            
            SELECT DeptCode ,max(salary) FROM employee
            GROUP BY DeptCode;

            -- count number of employees in each dept           
            SELECT DeptCode ,count(DeptCode) FROM employee
            GROUP BY DeptCode;

            --  calculate max salary dept wis and give there name    
            SELECT DeptCode ,max(salary),EmpFName,EmpName,ManagerCode FROM employee
            GROUP BY DeptCode;

                -- HAVING function
            -- we cannot use where with GROUP BY so SQL provide HAVING ,having works as where
            -- used only with aggregate function
            -- in short it is used to add check on GROUP BY
            SELECT DeptCode ,min(salary),EmpFName,EmpName,ManagerCode FROM employee
            GROUP BY DeptCode
            HAVING min(salary>2000);
            -- NOTE: 
            -- 1...Group by jo hai wo same type of data ko ek group me daal dega 
            -- 2...aur isme jo aggregate function use hua hai for say min(salary) ye in particular groups me jo minimum salary
            -- ka data hoga use display kar dega
            -- 3...HAVING me jo aggregate function hai wo us aggregate function pe lgega jispe jiske according group hua hai
            -- matlab 2 me jo data aya hai ye usme se jo >2000 hai unhe dispaly kardega
            
