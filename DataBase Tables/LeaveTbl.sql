--CREATE TABLE--

create table leavetbl(
empid varchar2(30) not null,
leaveid int,
leavecount number(2,0),
full_name varchar2(50),
reason varchar2(255),
strtdate date,
enddate date,
approvestatus varchar2(10) default(0),  -- 0-inital, 1- Approve, 2-Reject
createdby varchar2(50),
createddate date default(sysdate),
updatedby varchar2(50) ,
updateddate date default(sysdate),
attribute1 varchar2(50),
attribute2 varchar2(50),
attribute3 varchar2(50),
attribute4 varchar2(50),
attribute5 varchar2(50)
);

--ACTION QUERIES--

select * from leavetbl
select e.* from leavetbl e where empid = 'IT16' order by e.createddate desc;
insert into leavetbl (empid, leaveid, leavecount, full_name, reason, strtdate,enddate,approvestatus)values(1, leave_seq.nextval,2, 'Eshika Goyal', 'reason', '18-Jan-2023', '20-Jan-2023', 0);

update leavetbl set approvestatus='0' where approvestatus='Rejected' and leaveid in ('30','35','31','32');

delete from leavetbl where empid = 'IT16';
delete from leavetbl where leaveid = 20;

--drop table leavetbl;


--CREATE SEQUENCE--

CREATE SEQUENCE leave_seq
 START WITH     1
 INCREMENT BY   1
 NOCACHE
 NOCYCLE;

--DELETE SEQ--
DROP SEQUENCE leave_seq
