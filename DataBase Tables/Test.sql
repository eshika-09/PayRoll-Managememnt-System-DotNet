create table letter_occur(
Name varchar2(255));

insert into letter_occur Name values('Eshika Goyal');

select * from letter_occur

select Name, length(Name)-length(replace(Name, 'a',''))from letter_occur;

drop table letter_occur;

select regexp_count('Eshika Goyal','a',1)occurance from letter_occur; 
