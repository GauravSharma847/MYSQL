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

        --1. default
        -- only valid single column is the one on the basis of which yoou made group by
         SELECT designation ,COUNT(designation) as "count per dep" , 
         MAX(salary) as "MAX SALARY" FROM employee
        --  i will make group on the basis of given column
        GROUP BY designation;
        -- as is an alias or a temporary name
        
        -- Group By -> to form group
               --   -> 

        -- HAVING : it is always used with a aggregate function
        --  used to add condition to group by
        --  therefore it comes after group by statemnt
        -- QUES: designation tells me what is thhe highest salary
        --       but also salary should be greater than 3000
        --       
        SELECT designation ,COUNT(designation) as "count per dep" , 
        MAX(salary) as "MAX SALARY" FROM employee
        GROUP BY designation
        HAVING MAX(salary) > 3000;

        -- Having applies condition group wise
        -- Where applies condition row wise
       
         -- QUES: designation tells me what is thhe highest salary
        --       i also dont want data of deptCode 20
        SELECT designation ,COUNT(designation) as "count per dep" , 
        MAX(salary) as "MAX SALARY" FROM employee
        WHERE DeptCode <> 20
        GROUP BY designation;
        
         -- QUES: designation tells me what is thhe highest salary
        --       i also dont want data of SALESMAN
        SELECT designation ,COUNT(designation) as "count per dep" , 
        MAX(salary) as "MAX SALARY" FROM employee
        WHERE DeptCode<>() "SALESMAN"
        GROUP BY designation;

         -- QUES: designation tells me what is thhe highest salary
        --       i also dont want data of SALESMAN
        --        and max salaries dept wise should be grater than 3000
        SELECT designation ,
        COUNT(designation) as "count per dep" , 
        MAX(salary) as "MAX SALARY" FROM employee
        WHERE designation <> "SALESMAN"
        GROUP BY designation
        HAVING MAX(salary) > 3000
        ORDER BY MAX(salary);

        -- QUES: give me the average salries of the employees
        -- DeptCode wise where number of employees is more then 2
        -- in increasing order ??
        Select DeptCode, avg(salary), count(DeptCode),
        FROM employee
        GROUP BY DeptCode
        HAVING COUNT(DeptCode) > 2
        ORDER BY avg(Salary);