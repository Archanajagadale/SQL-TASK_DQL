Create database task;
use Task;
CREATE TABLE employees (
    emp_id INT PRIMARY KEY,
    emp_name VARCHAR(100),
    dept VARCHAR(50),
    city VARCHAR(50),
    salary DECIMAL(10,2),
    hire_date DATE,
    manager_id INT
);

INSERT INTO employees 
(emp_id, emp_name, dept, city, salary, hire_date, manager_id)
VALUES
(1, 'Aarav Shah', 'IT', 'Pune', 72000, '2021-03-15', NULL),
(2, 'Sneha Rao', 'HR', 'Mumbai', 48000, '2022-07-01', 1),
(3, 'Karan Mehta', 'Sales', 'Delhi', 55000, '2023-01-10', 1),
(4, 'Priya Nair', 'IT', 'Pune', 64000, '2020-11-23', 1),
(5, 'Ramesh Iyer', 'Finance', 'Mumbai', 59000, '2019-05-30', NULL),
(6, 'Anita Desai', 'Sales', 'Pune', 41000, '2024-02-12', 3);

Select * from Employees;

-- Q1
Select Emp_name,salary,Dept from employees
where Dept="IT";

-- Q2
Select * from employees
where city ="Pune" and Salary > 50000;

-- Q3
Select * from employees
where hire_date between "2022-01-01" and "2023-12-31";

-- Q4
Select * from employees
Where manager_id is null;

-- Q5
Select * from employees
Where Emp_name like "A%";

-- Q6
Select * from employees
Where Emp_name like "%sh";

-- Q7
Select * from employees
Where Emp_name like "%an%";

-- Q8
Select * from employees
Where Emp_name like "_a____";

-- Q9
select dept, COUNT(*)
from employees
group by dept;

-- Q10
select city, AVG(salary) 
from  employees
group by city;

-- q11
Select Dept, sum(salary),
Max(salary)
from employees
group by dept;


-- q12
SELECT dept, city, COUNT(*) AS employee_count
FROM employees
WHERE salary > 30000
GROUP BY dept, city;

SELECT dept, COUNT(*) AS employee_count
FROM employees
GROUP BY dept
Having count(*) >3;

-- Show cities where avg salary id above 600000
select city, avg(salary) from employees
group by city
having avg(salary) >60000;

-- Show departments whose total salary payout is between 200000 and 500000.
select Dept, sum(salary) from employees
group by dept
having Sum(salary) between 200000 and 500000;

-- Excluding HR, show departments with average salary above 45000, highest average first.
select Dept, avg(salary) from employees
Where dept <> "HR"
group by Dept 
having avg(salary)>45000
order by (avg(salary)) desc;

-- shw the 5 highest-paid employees.
select EMP_name, Rank() over (order by salary DESC)AS RK from employees;

Select * from employees
order by salary DESC
Limit 5;

-- Show the 3 most recently hired mployees.
Select * from employees
order by hire_date
Limit 3;

-- Skip the 5 highest-paid employees and how the next 5 (page 2).
Select * from employees
order by salary Desc
Limit 5
offset 5;

-- Find the third highest distinct salary using LMIT and OFFSET.
Select Distinct salary from employees
order by salary DESC
Limit 1
offset 2;

-- Among employees whose name starts ith 'S', show the top 3 cities byheadcount.
Select city, count(*) from employees
Group by city
Having EMp_name like "A%";

Select * from Employees;
Select city, count(*) from employees
Where emp_name like "A%"
Group by City;

-- w page 3 (10 rows per page) of Pune mployees sorted by name.
SELECT *
FROM employees
WHERE city = 'Pune'
ORDER BY emp_name ASC
LIMIT 10 OFFSET 20;

-- Find cities where at least 2 employeenames contain 'ar'. Show the top 3 bycount.
Select City from employees
where emp_name like "%ar%"
group by city;

