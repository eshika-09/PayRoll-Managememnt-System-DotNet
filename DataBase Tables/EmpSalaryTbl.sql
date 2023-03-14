create table EmpSalaryTbl
(
EmpId int,
Name varchar(100),
PFNumber varchar(100),
Designation varchar(50),
Department varchar(50),
AccountNumber varchar(50),
PAN varchar(50),
ModeofPay varchar(50),
UAN varchar(50)
);


--------------------------------------------------------
--------------------------------------------------------
--PROCEDURE QUERY--
create procedure GetSalaryDetail
empid varchar(5),
PaidMonth varchar2(12);
as
begin
--Employee Details--
select e.empid as'Employee ID',
e.full_name as 'Employee Name',
e.PFNumber as 'PF. No.',
s.NoOfDays as 'No of Days Worked',
s.NoOfDaysPaid as 'No of Days Paid',
e.Designation as 'Designation',
e.Department as 'Department',
e.AccountNumber as 'Bank Account Number' ,
e.PAN as 'PAN Number',
e.ModeofPay as 'Mode of Pay',
e.UAN as 'UAN'
from EmpSalaryTbl as e join salarytbl_1 as s on e.empid=s.empid where e.empid=@empid and s.PaidMonth=@month


--Earnings--
select basic_pay, hra,
da as 'Daily Allowance',
ta as 'Travel Allowance',
ma as 'Medical allowance',
pf as 'Prvident Fund',
food as 'Food Allowance' from salarytbl_1 where where empid=@Empid and PaidMonth=@month

--Deduction--
 select
                 pf as 'Provident Fund',
                 food as 'Food Allowance'
                 from
                 salarytbl_1
                 where empid=@empidand PaidMonth=@month
               
 
   --Gross earning total amount
                 select
                 basic_pay+
                 hra+
                 da+
                 ta +
                 ma +
                 from
                 salarytbl_1
                 where empid=@empid and PaidMonth=@month
   
               --Gross deduction total amount
               select
                 pf+food
                 from
                 salarytbl_1
                 where empid=@empid and PaidMonth=@month
              
   
 end;
        
 drop procedure GetSalaryDetail    
