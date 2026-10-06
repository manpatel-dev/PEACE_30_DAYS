GIT -- DAY 1 : CREATE TABLE FIRST DAYS

-- ==========================
-- DEPARTMENT TABLE
-- ==========================
CREATE TABLE department (
    dept_id INT PRIMARY KEY,
    dept_name VARCHAR(50)
);

INSERT INTO department VALUES
(1, 'HR'),
(2, 'IT'),
(3, 'Finance'),
(4, 'Marketing'),
(5, 'Sales');

-- ==========================
-- EMPLOYEE TABLE
-- ==========================
CREATE TABLE employee (
    emp_id INT PRIMARY KEY,
    emp_name VARCHAR(50),
    salary NUMERIC(10,2),
    dept_id INT,
    manager_id INT,
    FOREIGN KEY (dept_id) REFERENCES department(dept_id)
);

INSERT INTO employee VALUES
(101, 'Amit', 50000, 2, 105),
(102, 'Priya', 65000, 1, 106),
(103, 'Rahul', 45000, 2, 105),
(104, 'Sneha', 70000, 3, 107),
(105, 'Karan', 90000, 2, NULL),
(106, 'Neha', 85000, 1, NULL),
(107, 'Rohit', 95000, 3, NULL),
(108, 'Pooja', 55000, 4, NULL),
(109, 'Arjun', 60000, NULL, NULL),
(110, 'Meera', 52000, 5, NULL);

-- ==========================
-- CUSTOMER TABLE
-- ==========================
CREATE TABLE customer (
    customer_id INT PRIMARY KEY,
    customer_name VARCHAR(50),
    city VARCHAR(30)
);

INSERT INTO customer VALUES
(1,'Ramesh','Surat'),
(2,'Suresh','Pune'),
(3,'Mahesh','Mumbai'),
(4,'Anjali','Delhi'),
(5,'Kajal','Ahmedabad');

-- ==========================
-- ORDERS TABLE
-- ==========================
CREATE TABLE orders (
    order_id INT PRIMARY KEY,
    customer_id INT,
    order_date DATE,
    FOREIGN KEY (customer_id)
    REFERENCES customer(customer_id)
);

INSERT INTO orders VALUES
(1001,1,'2026-01-10'),
(1002,2,'2026-01-11'),
(1003,1,'2026-02-15'),
(1004,3,'2026-03-05');

-- ==========================
-- PRODUCT TABLE
-- ==========================
CREATE TABLE product (
    product_id INT PRIMARY KEY,
    product_name VARCHAR(50),
    price NUMERIC(10,2)
);

INSERT INTO product VALUES
(1,'Laptop',70000),
(2,'Mouse',800),
(3,'Keyboard',1500),
(4,'Monitor',12000),
(5,'Printer',9000);

-- ==========================
-- ORDER DETAILS TABLE
-- ==========================
CREATE TABLE order_details (
    order_detail_id INT PRIMARY KEY,
    order_id INT,
    product_id INT,
    quantity INT,
    FOREIGN KEY (order_id)
    REFERENCES orders(order_id),
    FOREIGN KEY (product_id)
    REFERENCES product(product_id)
);

INSERT INTO order_details VALUES
(1,1001,1,1),
(2,1001,2,2),
(3,1002,3,1),
(4,1003,4,1),
(5,1004,2,5);

select * from order_details;

-- ==========================
-- PROJECT TABLE
-- ==========================
CREATE TABLE project (
    project_id INT PRIMARY KEY,
    project_name VARCHAR(50)
);

INSERT INTO project VALUES
(1,'Banking App'),
(2,'E-Commerce'),
(3,'Hospital System'),
(4,'AI Chatbot');

select * from project;
-- ==========================
-- EMPLOYEE_PROJECT TABLE
-- ==========================
CREATE TABLE employee_project (
    emp_id INT,
    project_id INT,
    PRIMARY KEY(emp_id, project_id),
    FOREIGN KEY(emp_id)
    REFERENCES employee(emp_id),
    FOREIGN KEY(project_id)
    REFERENCES project(project_id)
);

INSERT INTO employee_project VALUES
(101,1),
(101,2),
(102,2),
(103,3),
(104,1),
(105,4),
(108,3),
(110,2);

select * from employee_project;

-- ==========================
-- STUDENT TABLE
-- ==========================
CREATE TABLE student (
    student_id INT PRIMARY KEY,
    student_name VARCHAR(50),
    course_id INT
);

INSERT INTO student VALUES
(1,'Jay',101),
(2,'Krishna',102),
(3,'Nisha',103),
(4,'Aarti',101),
(5,'Ravi',NULL);

select * from student;
-- ==========================
-- COURSE TABLE
-- ==========================
CREATE TABLE course (
    course_id INT PRIMARY KEY,
    course_name VARCHAR(50),
    faculty_id INT
);

INSERT INTO course VALUES
(101,'Java',1),
(102,'Python',2),
(103,'Database',3);

select * from course;
-- ==========================
-- FACULTY TABLE
-- ==========================
CREATE TABLE faculty (
    faculty_id INT PRIMARY KEY,
    faculty_name VARCHAR(50)
);

INSERT INTO faculty VALUES
(1,'Prof. Sharma'),
(2,'Prof. Patel'),
(3,'Prof. Mehta');

select * from faculty;