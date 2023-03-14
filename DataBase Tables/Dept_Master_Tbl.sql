create table master_dept(
dept_code varchar2(2),
dept_name varchar(50),
empid varchar2(20));

select t.dept_code||signup_seq.nextval from master_dept t
select * from master_dept

select t.dept_code from master_dept t where dept_name='Acounts';

CREATE SEQUENCE dept_seq
 START WITH     001
 INCREMENT BY   1
 MAXVALUE 9999999999
 NOCACHE
 NOCYCLE;

insert into master_dept (adminid) values('ADMIN'||admin_seq.nextval);

select 'ADMIN'||admin_seq.nextval ADMIN_ID from dual t

select t.dept_code||signup_seq.nextval ADMIN_ID from master_dept t where dept_name='General Affairs'
