select*from employees;
select*from customers;
select*from sales;

select  c.customer_id,count(s.sale_id) as more_puchases
from customers c
left join sales s
on c.customer_id=s.customer_id
group by c.customer_id
having count(s.sale_id)>1;
 
select*from employees 
where salary>40000;

select count(*), department
from employees 
group by department;

select department,avg(salary) as average_salary
from employees
group by department;

select department ,max(salary) as highest_salary
from employees
where department='it' 
group by department;

select product, sum(amount) as total_sales
from sales
group by product;

select*from customers;
select*from employees;
select*from sales;

select c.customer_id,customer_name,sum(s.amount) as total_sales
from customers c
left join sales s
on c.customer_id=s.customer_id
group by c.customer_id,c.customer_name;

select c.customer_name, s.product, s.amount
from customers c
join sales s
on c.customer_id=s.customer_id;

select*from customers;
select*from sales;

select c.customer_id, c.customer_name
from customers c
left join sales s
on c.customer_id=s.customer_id
where s.customer_id is null
;

select c.city, sum(s.amount) as total_sales
from customers c
join sales s
on c.customer_id=s.customer_id
group by c.city;

select*from customers;
select*from sales;

select s.product, sum(s.amount) as total_sales
from customers c
join sales s
on c.customer_id=s.customer_id
group by s.product
order by total_sales desc limit 1;

select*from employees;

select*from employees
where salary>(select avg(salary) from employees);
select avg(salary) from employees;

select emp_id,name,department,salary
from employees
where salary>(select avg(salary) from employees);

select emp_id,name,department,salary
from employees
order by salary desc limit 1 offset 1;

select emp_id, name,department,salary
from employees
where salary=(
select max(salary) from employees
where salary<(select max(salary) from employees));

-- or
select max(salary) from employees
where salary<(select max(salary) from employees);

select*from employees 
order by salary desc limit 1 offset 2;

select*from customers;
select*from employees;

select emp_id,name,department,salary
from(
select emp_id,name,department,salary,
rank () over (partition by department order by salary desc) as rnk
from employees) as t
where rnk<=3;

select department,avg(salary) as average_salary
from employees
group by department
having avg(salary)>50000;


select emp_id, name, department, salary
from employees
where salary>(select avg(salary) from employees);

select e.emp_id, e.name, e.department, e.salary
from employees e
where e.salary>(select avg(salary) from employees
where department= e.department);

select emp_id,name,department,salary
from (
select emp_id, name, department,salary,
avg (salary) over(partition by department) as avg_dept_salary
from employees) t
where salary>avg_dept_salary;

select department, count(*) as employee_count
from employees
group by department
having count(*)>2;

select*from employees;

select*from employees 
where year(hire_date)='2021';


select*from employees
where hire_date between '2021-01-01' and '2021-12-31' ;

select*from employees
where hire_date>'2022-01-01' ;

select*from employees;

select emp_id,name,department,salary
from (
select emp_id,name,department,salary,
avg (salary) over (partition by department) as avg_dept_salary
from employees) t
where avg_dept_salary<50000;

select department, avg(salary)  as avg_salary
from employees
group by department
having avg(salary)<50000;

select emp_id,name,department,salary
from (
select emp_id,name,department,salary,
rank() over(partition by department order by salary desc) as rnk
from employees) t
where rnk=2;

select*from employees;

select department, max(salary)
from employees
group by department
having max(salary)>50000;

select*from employees;
insert into employees(emp_id,name,department,salary,hire_date) values(7,'sathya','Finance',30000,'2021-10-03');

select emp_id, name, department, salary
from employees
where salary in( select salary
from employees
group by salary
having count(*)>1
);

delete from employees where emp_id=7;
select*from employees;

select department, count(*) as count_employees
from employees
group by department
having count(*)>1;

select  emp_id,name,department,salary
from employees
where salary between 40000 and 60000;

select*from employees;

select department, avg(salary) as average_salary
from employees
group by department
order by avg(salary) asc limit 1;

select*from employees;


SELECT emp_id, name, department, salary, hire_date
FROM employees
WHERE hire_date > DATE_SUB(CURDATE(), INTERVAL 2 YEAR);


select max(salary) from employees
where salary<(select maX(salary) from employees);

-- or
select*from employees;

select emp_id, name, department, salary
from employees
order by salary desc limit 1 offset 2;

-- or

select emp_id, name, department, salary
from(
select emp_id,name,department,salary,
rank() over(order by salary desc) as rnk
from employees) t
where rnk=2;

select emp_id,name,department,salary
from(
select emp_id,name,department,salary,
rank() over(partition by department order by salary desc) as rnk
from employees) t
where rnk<=3
order by department desc;

select department, avg(salary)
from employees 
group by department
having avg(salary)>1;

select emp_id, name, department, salary
from employees 
where salary in(
select salary
from employees
group by salary
having count(*)>1);

select department,avg(salary)
from employees
group by department
order by avg(salary) asc limit 1;

select emp_id,name,department,salary,
sum(salary) over(order by hire_date) as cumulative_salary
from employees;

select emp_id,name,department,salary,hire_date
from employees
where hire_date<'2022-01-01';

select avg(salary) from employees;

select emp_id,name,department,salary
from employees
where salary>(select avg(salary) from employees);

select emp_id,name,department,salary,hire_date
from employees
order by salary desc limit 1 offset 1;

select emp_id,name,department,salary
from(
select emp_id, name, department, salary,
rank() over(partition by department order by salary desc) as rnk
from employees) t
where rnk<=2;

select emp_id, name,department,salary
from(
select emp_id,name,department,salary,
rank() over(partition by department order by salary asc) as rnk
from employees) t
where rnk=1;

select emp_id,name,department,salary
from(
select emp_id,name,department,salary,
rank() over(partition by department order by salary desc)as rnk
from employees) t
where rnk=1;

select department,sum(salary) total_salary_expennses
from employees
group by department
having sum(salary)>100000;

select emp_id,name,department,salary
from(
select emp_id,name,department,salary,
avg(salary) over(partition by department) as average_dept_salary
from employees)t
where salary>average_dept_salary;

select emp_id,name,department,salary,
sum(salary) over(partition by department order by hire_date)as cumulative_per_dept
from employees;






