-- ��� ���̺� ������ �μ����̺� �� ����� �μ����� ���
select ename, dname
from emp,dept;

select emp.ename,dept.dname,dept.deptno
from emp,dept;

select emp.ename,dept.dname,dept.deptno
from emp,dept
where emp.deptno=dept.deptno;

-- ��Ī ���
select e.ename as enmae ,d.dname as dname,d.deptno as deptno
from emp e, dept d
where e.deptno=d.deptno;

-- ���� ����
select e.ename as enmae ,d.dname as dname,d.deptno as deptno
from emp e, dept d
where e.deptno=d.deptno;

-- ���� ���� ǥ�ؾ�
select e.ename as enmae ,d.dname as dname,d.deptno as deptno
from emp e inner join dept d
on e.deptno=d.deptno;

-- �ܺ� ����
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
where e.deptno(+)=d.deptno(+); */ -- ���� �Ұ���

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


-- �ܺ� ����
select e1.empno, e1.ename , e1.mgr, e2.empno, e2.ename
from emp e1, emp e2
where e1.mgr = e2.empno(+);

select e1.empno, e1.ename , e1.mgr, e2.empno, e2.ename
from emp e1 left outer join emp e2
on e1.mgr = e2.empno;

-- ����
SELECT empno, ename, job, deptno FROM emp WHERE job='CLERK'
-- SMITH / ADAMS / JAMES / MILLER
   -- UNION ������ 
   -- UNION ALL ������ (�ߺ� ������ �ι� ���)
   -- INTERSECT (������)
   -- MINUS (������)
   UNION
SELECT empno, ename, job, deptno FROM emp WHERE deptno=10;
-- CLARK / KING / MILLER