create table leavetbl(
empid int not null,
count number(2,0),
full_name varchar2(50),
reason varchar2(255),
strtdate date,
enddate date);

select * from leavetbl
