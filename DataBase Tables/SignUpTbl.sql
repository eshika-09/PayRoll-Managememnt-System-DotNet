create table signup(
full_name varchar2(50),
dob date,
phone number(10,0),
email varchar2(100),
state varchar2(20),
city varchar2(20),
pincode number(6,0),
address varchar2(255),
empid int not null,
pass varchar2(10) null,
empclass varchar2(10),
account_status varchar2(20),
constraint empid_pk primary key (empid));

 
select * from signup;


create table adminsignup(
full_name varchar2(50),
dob date,
phone number(10,0),
email varchar2(100),
state varchar2(20),
city varchar2(20),
pincode number(6,0),
address varchar2(255),
adminid varchar2(10),
password varchar2(10) null,
empclass varchar2(10),
account_status varchar2(20),
constraint adminid_pk primary key (adminid));

select * from adminsignup;

insert into adminsignup(full_name,dob,phone,email,state,city,pincode,address,adminid,password,empclass,account_status)
            values('Pooja Singh','9-Aug-1978',1234567890,'abc@gmail.com','Maharashtra','Mumbai',608703,'Full Address','M01',12345,'Manager','Pending');
            


