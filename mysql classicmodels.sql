use classicmodels;
show tables;
select*from customers;
-- where clause
select*from customers where country ="usa";
select*from customers where city="nyc";
select*from customers where creditlimit>100000;
select  customernumber,customername from customers where creditlimit>10000;
-- And,or,not operators
select*from customers where creditlimit>100000 and country="usa" and salesrepemployeenumber=1165;
select*from customers where country="germany" or country="usa";
select*from customers where 
(country="germany" or country="usa") and creditlimit>100000;
select*from customers where not country="usa";
select*from customers where not(country="germany" or country="usa");
-- like operators
select*from customers where phone like"%44%";
select*from customers where contactfirstname like "a%";
select*from customers where customername like "%s";
select*from customers where customername like "a%";
select* from customers where postalcode like "3%";
select*from customers where phone like "%5";
select contactfirstname,customername,customernumber from customers
order by customername, customernumber desc;
select customernumber,customername,contactfirstname,country from customers
where country="france" order by customername desc;
-- limit clause
select*from customers limit 10;
select*from customers order by creditlimit desc limit 3 offset 1;
-- between operators
select customername,customernumber,creditlimit from customers
where creditlimit between 100000 and 200000 ;
select*from orders;
select*from orders
where orderdate between ("2003-01-06" and "2003-10-31") and status="shipped"
order by orderdate;
-- IN and NOT IN operators(instead of or operators)
select*from customers where country in("germany","usa","france");
select*from customers where country not in("germany","usa","france") and  city not in("norway");
-- string functions
select contactfirstname,length(contactfirstname),length(trim(contactfirstname)) from customers;
select contactfirstname,upper(contactfirstname) from customers;
select contactfirstname,left(contactfirstname,3) from customers;
select contactfirstname,right(contactfirstname,3) from customers;
select contactfirstname,mid(contactfirstname,2,3) from customers;
-- replace string
select contactfirstname, replace(contactfirstname,"a","e") from customers;
-- concat
select concat(contactfirstname," ",contactlastname) as fullname from customers;
-- difference between concat vs concat_ws
select*from employees;
select concat(firstname," ",lastname," ",jobtitle) as fullname from employees;
select concat_ws(" ",firstname,lastname,jobtitle) as details from employees;
-- aggregation funtions
select*from orderdetails;
select sum(quantityordered) as otal,
	round(avg(quantityordered),2) as average,
	max(quantityordered) as largest,
	min(quantityordered) as smallest,
	count(quantityordered) as numberofcounts from orderdetails;
select ceil(avg(quantityordered)) from orderdetails;
select floor(avg(quantityordered)) from orderdetails;
-- Date functions
select*from orders;
select orderdate,
    month(orderdate),
	monthname(orderdate),
	year(orderdate),
    day(orderdate),
    dayname(orderdate)
	from orders;
-- difference between abs and datediff    
select datediff(orderdate,shippeddate)from orders;  #minus values
select abs(datediff(orderdate,shippeddate)) from orders; # minus values into positive 
select datediff(shippeddate,orderdate) from orders; #highestt value and lowest values







    
    









    
    













 
 


