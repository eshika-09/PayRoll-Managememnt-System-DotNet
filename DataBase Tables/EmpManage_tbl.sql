--CREATE TABLE--

create table EmpManage(
empid varchar2(30)not null,
full_name varchar2(50),
designation varchar2 (10),
dept varchar2(100),
basic_pay number(6,0));


--ACTION QUERIES--

select * from EmpManage e order by e.empid;
select full_name,account_status,dob,phone,email,state,city,pincode,address from EmpManage where empid = '1'


--drop table Empmanage
