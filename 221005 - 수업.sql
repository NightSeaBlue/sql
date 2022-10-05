-- 사원 테이블에 사원명과 부서테이블에 그 사원의 부서명을 출력
select ename, dname
from emp,dept;

select emp.ename,dept.dname,dept.deptno
from emp,dept;

select emp.ename,dept.dname,dept.deptno
from emp,dept
where emp.deptno=dept.deptno;

-- 별칭 사용
select e.ename as enmae ,d.dname as dname,d.deptno as deptno
from emp e, dept d
where e.deptno=d.deptno;

-- 내부 조인
select e.ename as enmae ,d.dname as dname,d.deptno as deptno
from emp e, dept d
where e.deptno=d.deptno;

-- 내부 조인 표준안
select e.ename as enmae ,d.dname as dname,d.deptno as deptno
from emp e inner join dept d
on e.deptno=d.deptno;

-- 외부 조인
select e.ename as enmae ,d.dname as dname,d.deptno as deptno
from emp e, dept d
where e.deptno(+)=d.deptno; -- right outer join

select e.ename as enmae ,d.dname as dname,d.deptno as deptno
from emp e RIGHT OUTER JOIN dept d
on e.deptno=d.deptno; -- RIGHT outer join

select e.ename as enmae ,d.dname as dname,d.deptno as deptno
from emp e, dept d
where e.deptno=d.deptno(+); -- LEFT outer join

select e.ename as enmae ,d.dname as dname,d.deptno as deptno
from emp e LEFT outer join dept d
on e.deptno=d.deptno; -- LEFT outer join

/*select e.ename as enmae ,d.dname as dname,d.deptno as deptno
from emp e, dept d
where e.deptno(+)=d.deptno(+); */ -- 실행 불가능

-- full outer join
select e.ename as enmae ,d.dname as dname,d.deptno as deptno
from emp e full outer join dept d
on e.deptno=d.deptno;

-- self join
select e1.empno, e1.ename , e1.mgr, e2.empno, e2.ename
from emp e1, emp e2
where e1.mgr = e2.empno;

select e1.empno, e1.ename , e1.mgr, e2.empno, e2.ename
from emp e1 inner join emp e2
on e1.mgr = e2.empno;


-- 외부 조인
select e1.empno, e1.ename , e1.mgr, e2.empno, e2.ename
from emp e1, emp e2
where e1.mgr = e2.empno(+);

select e1.empno, e1.ename , e1.mgr, e2.empno, e2.ename
from emp e1 left outer join emp e2
on e1.mgr = e2.empno;

-- 집합
SELECT empno, ename, job, deptno FROM emp WHERE job='CLERK'
-- SMITH / ADAMS / JAMES / MILLER
   -- UNION 합집합 
   -- UNION ALL 합집합 (중복 교집합 두번 출력)
   -- INTERSECT (교집합)
   -- MINUS (차집합)
   UNION
SELECT empno, ename, job, deptno FROM emp WHERE deptno=10;
-- CLARK / KING / MILLER