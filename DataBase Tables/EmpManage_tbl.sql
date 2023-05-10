
create table EmpManage(
empid varchar2(30)not null,
full_name varchar2(50),
designation varchar2 (10),
dept varchar2(100),
basic_pay number(6,0));

select * from EmpManage e order by e.empid;

select full_name,account_status,dob,phone,email,state,city,pincode,address from EmpManage where empid = '1'

update EmpManage set full_name='Ayush Wunnava', phone=9844729401, email='ayush.w@gmail.com', state='Telangana', city='Hyderabad', pincode=123456, address='Full Address' where empid=1;

--drop table Empmanage

--select * from signup s left join Salarytbl_1 e  on s.empid = e.empid; 

insert into EmpManage(empid,full_name,designation,dept,basic_pay)values('IT16', 'Eshika Goyal', 'SDE-1', 'IT & CNS', 85000)
