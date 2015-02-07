select power(2,3) from dual;
-- can't just do power(2,3) b/c sql requires to have both SELECT and FROM

select 10 num, 0.7 percent from dual;
--or
select 10 "number", 0.7 percent from dual;
--or
select 10 as "number", 0.7 as percent from dual;
-- number in quotes b/c it is something we are defining
--can't do select 10 num, 0.7 percent, num*percent as answer from dual;
-- b/c the temp table can't be built, b/c it requires both num and percent and
-- those aren't existing yet.
-- WHERE, GROUPBY, and HAVING all work on the same temp table, but ORDERBY
--  doesn't have to worry about that,
--  ex: select 10 num, 0.7 percent, num*percent as nump 
--      FROM dual ORDERBY nump
--  but can't do WHERE nump>4

-- forced to be reduntant in calculations if not using subqueries
select num* percent as nump from (select 10 num, 0.7 percent from dual)
-- how to select all cols from the temp table in a subquery?
select t.*, num*percent as nump from (select 10 num, 0.7 percent from dual) t
-- ^we made an alias for the temp table in the subquery and called it 't'
-- can use subquery in the select statement too
select t.*, (select * from dual) n, num*percent as nump from
  (select 10 num, 0.7 percent from dual) t;
--if did the following, w/out naming the col, we will get the col name as the query
select t.*, (select * from dual), num*percent as nump from
  (select 10 num, 0.7 percent from dual) t;
  
-- alias names in double quotes, " ", will preserve the case
select t.*, (select * from dual) n, "Num"*"Percent" as nump from
  (select 10 "Num", 0.7 "Percent" from dual) t

-- single quote for char string
select t.* (select dname from dep thwere deptno = 10) job, "Num" * "Percent"
from (select 10 "Num", 