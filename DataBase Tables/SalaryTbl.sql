create table salarytbl_1(
empid varchar2(30)not null,
full_name varchar2(50),
designation varchar2(20),
dept varchar2(20),
month varchar2(20),
year number(4,0),
basic_pay number(7,2),
SDay number(10,4),
hra number(8,2),
da number(8,2),
ta number(8,2),
ma number(8,2),
pf number(8,2),
food number(8,2),
leaves number(8,2),
earnings number(8,2),
deduction number(8,2),
NetSalary number(8,2),
createdby varchar2(50),
createddate date,
constraint empid1_pk1 primary key (empid));

 select * from salarytbl_1;
 
 select * from dnet09.signup;
 

--delete from salarytbl_1 where empid=2

insert into salarytbl_1(empid,full_name,designation,dept,basic_pay)values('IT19','Ayush Wunnava','SDE1', 'IT & CNS', 95000);


insert into salarytbl_1(empid,month,year,basic_pay,SDay,hra,da,ta,ma,pf,food,leaves,earnings,deduction,NetSalary,createdby,createddate)values(1,'January', 2023, 70000, 12.3, 2345.4, 2331.2,2345.4,2345.4,2345.4,2345.4,2345.4,2345.4,2345.4,527819.9,'Eshika',sysdate);


insert into salarytbl_1 (empid,full_name,designation,dept,month,year,basic_pay,SDay,hra,da,ta,ma,pf,food,leaves,earnings,deduction,NetSalary)
values(IT16,'Eshika Goyal','SDE 1','IT & CNS','January',2023,70000,2258.064,14000,7000,1400,700,2100,2800,2,23100,13683.87,79416.13);


update salarytbl_1 set month = 'January', year = 2023, SDay = 2258.064, hra = 14000, da = 7000, ta = 1400, ma = 700, pf = 2100, food = 2800, leaves = 2, earnings = 23100, deduction = 13683.87, NetSalary = 79416.13 where empid=1;

--drop table salarytbl_1;

select full_name,dept,designation,basic_pay,hra,pf,ma,da,food,leaves,earnings,deduction,NetSalary from salarytbl_1 ;








