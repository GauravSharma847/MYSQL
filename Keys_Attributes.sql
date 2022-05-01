* CANDIDATE KEY -> any column that uniquely identifies an entry is known as candidate key.
* PRIMARY Key   -> candidate key that is uniqely identify an entry is known as PRIMARY Key.

Table 1: Customer
* Name
* Phone
* C_Id(PRIMARY Key)

Table 2: Orders
* P_Name
* O_Id(Primary Key)
* C_Id(Foreign Key)

C_Id column inside Order table is Foreign Key.

* Foreign Key -> It is n attribute that is a Primary key inside another table. 
    -> it is used to establish a parent-child relation.

CREATE table cust(
    c_id INTEGER NOT NULL UNIQUE,
    phNo INTEGER NOT NULL UNIQUE,
    c_name VARCHAR(255) NOT NULL,
    PRIMARY KEY(c_id)
);
INSERT INTO cust VALUES(1,911,"JASBIR");

-- without parent u can't have child
CREATE table orders(
    o_id INTEGER NOT NULL UNIQUE
    P_Name VARCHAR(255) NOT NULL,
    c_id INTEGER,
FOREIGN KEY(c_id) REFERENCES cust(c_id)
);
INSERT INTO orders VALUES(2,"Pen",1);
-- DROP TABLE orders
-- ON update cascade -> if u want to delete 
-- jab bhi parent table me se apka ko bhi entry remove hogi to uske associated data children se be delete ya update hojayega
CREATE table orders(
    o_id INTEGER NOT NULL UNIQUE,
    P_Name
    c_id
FOREIGN KEY(c_id) REFERENCES cust(c_id) ON UPDATE CASCADE ON DELETE CASCADE 
);