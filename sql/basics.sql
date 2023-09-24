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

select *from customer_info;

#sql constraints
#notnull
create table students(
	id int not null,
    first_name varchar(25) not null,
    last_name varchar(25) not null,
    age int 
);

select *from students;
desc students;

# now i want to add notnull feature to age so by using alter table we can doo it
alter table students modify age int not null;
desc students;

#unique
create table person(
	id int not null,
    first_name varchar(25) not null,
    last_name varchar(25) not null,
    age int not null,
    unique(id)
);

insert into person values(3,'Amit2','Rawat2','21');


select *from person;

alter table person 
ADD unique(first_name);

desc person;

Alter table person
add constraint uc_person unique(age,first_name);

desc person;
#here age  becomes multi unique constraint
#drop unique constraints

alter table person 
drop index uc_person;

desc person;

#primary key

create table person1(
 id int not null,
 first_name varchar(25) not null,
 last_name varchar(25),
 age int,
 constraint pk_person primary key(id,last_name)
);

desc person1;

alter table person1
add primary key(id);

alter table person1
drop primary key;

desc person1;


use customer;

create table person2(
	id int not null,
    first_name varchar(25) not null,
    last_name varchar(25) not null,
    age int
);
desc person2;

drop table person2;

alter table person2 
add primary key(id);

drop table person2;


alter table person2
add constraint pk_person2 primary key(id,age);

alter table person2
drop primary key;



-- foreign key


create table person2(
	id int not null,
    first_name varchar(25) not null,
    last_name varchar(25) not null,
    age int,
    salary int,
    primary key(id)
);
desc person2;

create table department(
	id int not null,
    department_id int not null,
    department_name varchar(25) not null,
    primary key(department_id)
);
desc department;

alter table department 
add foreign key(id) references person2(id);


drop table department;

drop table person2;
 -- check constraints
 
 create table person2(
	id int not null,
    first_name varchar(25) not null,
    last_name varchar(25) not null,
    age int,
    salary int,
    primary key(id),
    check (salary<50000)
);
 desc person2;
 
 insert into person2 values(2,'Amit','Naik','21',40000);
 
 select *from person2;
 
 
 #default
 
 drop table person2;
 
  create table person2(
	id int not null,
    first_name varchar(25) not null,
    last_name varchar(25) not null,
    city_name varchar(25) default 'delhi'
);
desc person2;

alter table person2
alter  city_name drop default;











