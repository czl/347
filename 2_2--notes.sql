SELECT e1.EMPNO, e1.ENAME, e1.JOB, e1.MGR, e1.HIREDATE, e1.SAL, e1.COMM, e1.DEPTNO, e2.ename 
FROM EMP e1 join emp e2
ON e1.mgr = e2.empno
ORDER BY 1;
-- order by 1 means order by first column, order by 2 means order by col 2
-- doing self join to match employ

SELECT e1.*, e2.ename 
FROM EMP e1 left outer join emp e2
on e1.mgr = e2.empno
order by 1;

--creating views
CREATE VIEW emp_view1 AS SELECT empno, ename, sal
FROM emp
WHERE sal > 2000;
-- using views
SELECT * FROM emp_view1;
-- everytime select from emp_view1 is going to call the query 'create view emp_view1...'
-- so, nothing is cached and it just runs the code
-- views are important b/c they can limit what users can see
-- say we want to hide the commission, so this way the user can query employees without 
--  seeing the commissions

-- but another important use of views for this class is....
-- we are going to build views for all classes of the heirarchy
-- so if we build a view where type == owner, thn we only get owner,
-- if we build view for only employee type, then we only see employee stuff
-- so we will have a 4th ddl file with the views of the hierarchy
-- for this logical model

--summary:
-- roll everything up into one table
-- create views so basically have heirarchy
-- and just use views to do stuff