SELECT * FROM EMP e join dept d
on(e.deptno = d.deptno);

SELECT * FROM EMP e, DEPT d
WHERE e.deptno = d.deptno;
-- older way of doing inner join

SELECT deptno, count(sal) FROM EMP
group by deptno
having count(*) < 20
order by deptno;

-- order works on what having returns, which works on what group returns,
-- which works on what select returns
-- count() counts the number of rows returned, so count(*) is saying counts for all columns

SELECT * FROM emp e right outer join dept d on (e.deptno = d.deptno);
