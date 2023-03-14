
create table admintbl(
username varchar2(50),
password varchar2(10) null);

select * from admintbl;

select * from adminsignup;

select * from signup;

-- Create table
create table adminsignup
(
  FULL_NAME      VARCHAR2(50),
  DOB            DATE,
  PHONE          NUMBER(10),
  EMAIL          VARCHAR2(100),
  STATE          VARCHAR2(20),
  CITY           VARCHAR2(20),
  PINCODE        NUMBER(6),
  ADDRESS        VARCHAR2(255),
  ADMINID        VARCHAR2(10) not null,
  PASSWORD       VARCHAR2(10),
  EMPCLASS       VARCHAR2(20),
  ACCOUNT_STATUS VARCHAR2(20)
)
tablespace DNET09
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
-- Create/Recreate primary, unique and foreign key constraints 
alter table adminsignup
  add constraint adminid_PK primary key (adminid)
  using index 
  tablespace DNET09
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
