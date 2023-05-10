select * from signup;
select * from salarytbl_1 for update;
select * from leavetbl;
select * from empmanage;


--Inner Join on 2 tables
select leavetbl.empid, salarytbl_1.dept from leavetbl left join salarytbl_1 on leavetbl.empid = salarytbl_1.empid;


--Inner join on 3 tables
select *
  from signup s,
       salarytbl_1 t,
       leavetbl b
      -- empmanage z
 where 1=1
   and s.empid = t.empid
   and t.empid = b.empid
  -- and t.empid(+) = z.empid
   ;

select s.empid, s.full_name, m.basic_pay, m.dept
from signup s,
salarytbl_1 m,
leavetbl l
where s.empid = m.empid
and m.empid = l.empid
order by m.basic_pay desc
;

select s.empid, s.dob, s.empclass
from signup s, leavetbl l
where 1=1
and s.empid = l.empid;
