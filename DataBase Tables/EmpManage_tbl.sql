create table EmpManage(
empid varchar2(5)not null,
full_name varchar2(50),
account_status varchar2 (10),
dob date,
phone number(10,0),
email varchar2(100),
state varchar2(20),
city varchar2(20),
pincode number(6,0),
address varchar2 (255),
ctc number (15,0));

select * from EmpManage e order by e.empid;

select full_name,account_status,dob,phone,email,state,city,pincode,address from EmpManage where empid = '1'

update EmpManage set full_name='Eshika Goyal', phone=9361087305, email='abc@gmail.com', state='Uttar Pradesh', city='Noida', pincode=123456, address='Full Address' where empid=1;

DBMS_SQL

--drop table Empmanage

--select * from signup s left join Salarytbl_1 e  on s.empid = e.empid; 

