--CREATING THE SIGNUP TABLE--

create table signup(
full_name varchar2(50),
dob date,
phone number(10,0),
email varchar2(100),
state varchar2(20),
city varchar2(20),
pincode number(6,0),
address varchar2(255),
empid varchar2(30) not null,
pass varchar2(10) null,
empclass varchar2(10),
account_status varchar2(20),
constraint empid_pk primary key (empid));

--------------------------------------------------------
--------------------------------------------------------
--APPLICATION QUERY--

select * from signup;
select * from adminsignup

--create table signup1 as  select * from signup;
--select * from signup1 where empid= 5 --for update
Aman221001

select * from v$session;

--SIGNUP SEQUENCE--
CREATE SEQUENCE signup_seq
 START WITH     001
 INCREMENT BY   1
 MAXVALUE 9999999999
 NOCACHE
 NOCYCLE;


--drop table signup

--------------------------------------------------------
--------------------------------------------------------
--------------------------------------------------------
--------------------------------------------------------

--CREATING THE SIGNUP TABLE--

create table adminsignup(
full_name varchar2(50),
dob date,
phone number(10,0),
email varchar2(100),
state varchar2(20),
city varchar2(20),
pincode number(6,0),
address varchar2(255),
adminid varchar2(30) not null,
pass varchar2(10) null,
empclass varchar2(10),
account_status varchar2(20),
constraint adminid_pk primary key (adminid));

--------------------------------------------------------
--------------------------------------------------------

select * from signup;

--APPLICATION QUERY--
select * from adminsignup order by full_name,dob,phone,email,state,city,pincode,address,pass,empclass desc;

select 'ADMIN'||admin_seq.nextval ADMIN_ID from master_dept;

--ADMINSIGNUP SEQUENCE--
CREATE SEQUENCE admin_seq
 START WITH     1001
 INCREMENT BY   1
 MAXVALUE 9999999999
 NOCACHE
 NOCYCLE;
 
insert into adminsignup(full_name,dob,phone,email,state,city,pincode,address,adminid,password,empclass)
values('Kshitij Mishra','8-Nov-1998',9899234671,'kshtijmishra811@gmail.com','Himachal Pradesh','Shimla',608703,'Full Address','ADMIN1001','Pass@2023','HR Manager');

insert into adminsignup(full_name,dob,phone,email,state,city,pincode,address,adminid,password,empclass)values('Parth Mishra','8-Nov-1998',9899234671,'parthmishra811@gmail.com','Himachal Pradesh',
'Shimla',608703,'Full Address','ADMIN1002',12345678,'GA');

--drop table adminsignup

            


