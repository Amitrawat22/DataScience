show databases;

create database customer;
use customer;

#create customer info table

create table customer_info(
	id integer auto_increment,
    first_name varchar(25),
    last_name varchar(25),
    salary integer,
    primary key(id)
);

select *from customer_inf0;
show tables;

#insert records in table
insert into customer_info(first_name,last_name,salary)
values
('John','Daniel', 50000),
('Krish','Naik', 60000),
('Amit','Rawat',70000),
('Ankit','Sharma',NULL);

select *from customer_info where salary is not null;

#sql update statement to replace null values

update customer_info set salary = 50000 where id = 4;
select *from customer_info;

##sql delete statement 

delete from customer_info where id = 4;
select *from customer_info;

#sql alter table
#add columns in existing table

alter table customer_info add email varchar(25);
select *from customer_info;

update customer_info set email = "Ankit@gmail.com" where id = 4;
select *from customer_info;

select email from customer_info where id in(2,3);

update customer_info
set email = case
	when id = 2 then(select email from customer_info where id = 3)
	when id = 3 then(select email from customer_info where id = 2)
	else email
end
where id in(2,3);

select *from customer_info where id in(2,3);

update customer_info
set email = 'Krish@gmail.com'
where id = 2;

update customer_info
set email = 'Amit@gmail.com'
where id = 3;

select *from customer_info;

alter table customer_info add dob date;

##alter table modify column

alter table customer_info modify dob year;
#schema
#describe or desc command in sql is responsible for showing detailed information about the structure or schema of a table in database
desc customer_info;

# alter table to drop column

alter table customer_info drop column email;

desc customer_info;

select *from customer_info





