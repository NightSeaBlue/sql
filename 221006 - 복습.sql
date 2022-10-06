--1. ����� ��L���ڰ� �ִ� ����� ���� �̸�, ����, �μ���, ��ġ�� ���
select e.ename,e.job,d.dname,d.loc
from emp e left outer join dept d
            on e.deptno = d.deptno
where e.ename like '%L%';

select e.ename as ename, e.job as job, d.dname as dname, d.loc as loc
from emp e, dept d
where e.deptno = d.deptno and e.ename like '%L%';

-- 2. �����ں��� ���� �Ի��� ����� ���� �̸�, �Ի���, ������ �̸�, ������ �Ի����� ���
select e1.ename as �����,e1.hiredate as ����Ի���
        ,e2.ename as �����ڸ�, e2.hiredate as �������Ի���
from emp e1 inner join emp e2
            on e1.mgr = e2.empno
where e1.hiredate < e2.hiredate;

select e1.ename as �����,e1.hiredate as ����Ի���
        ,e2.ename as �����ڸ�, e2.hiredate as �������Ի���
from emp e1, emp e2
where e1.mgr = e2.empno and e1.hiredate < e2.hiredate;

-- 3. �Ʒ��� ����� ��� ( �����ڰ� ���� KING�� �����Ͽ� ��� ����� ��� )
select e1.empno as ��� , e1.ename as �����, e1.mgr as �Ŵ������, e2.ename as �Ŵ�����
from emp e1 left outer join emp e2
            on e1.mgr = e2.empno
order by e1.empno asc;

select e1.empno as ��� , e1.ename as �����, e1.mgr as �Ŵ������, e2.ename as �Ŵ�����
from emp e1 , emp e2
where e1.mgr = e2.empno(+)
order by e1.empno asc;

-- nvl�� ���ڸ� �Է°���
