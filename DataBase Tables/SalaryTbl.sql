create table salarytbl(
empid int not null,
full_name varchar2(50),
dept varchar2(20),
mngr_name varchar2(20),
basic number(9,4),
bonus number(5,4),
tax number(2,0),
medic number(10,2),
travel number(5,0),
taken number(2,0),
Left number(2,0),
descp varchar2(255));

select * from salarytbl
