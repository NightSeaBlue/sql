--? 1. SCOTT�� �޿����� ���� ����� ������ �����ȣ, �̸�, ������, �޿��� ���
select empno, ename, job, sal
from emp
where sal > (select sal from emp where ename like 'SCOTT');

-- 2. 30�� �μ��� �ּ� �޿����� ���μ��� �ּ� �޿��� ���� �μ��� ���
select deptno, min(sal)
from emp
group by deptno
having min(sal) > (select min(sal) from emp where deptno=30);

-- 3. �������� ��� �޿� �߿��� ���� ���� �޿��� ���� ������ ���
select job, round(avg(sal)) as ��ձ޿�
from EMP
GROUP BY JOB
HAVING avg(sal) = (select min(avg(sal)) from emp group by job);




-- 4. �����ȣ�� 7521�� ������ ���� ��� 7934�� �������� �޿��� ���� �޴� ����� ������ ���
select *
from emp
where job like (select job from emp where empno = 7521) and sal>(select sal from emp where empno=7934);

select *
from emp
where job in (select job from emp where empno =7521)
and sal > (select sal from emp where empno=7934);

-- 5. 'WARD'�� �μ��� ������ ���� ��� ��� ���
select ename
from emp
where ENAME != 'WARD' AND job like (select job from emp where ename like 'WARD') AND DEPTNO like (SELECT DEPTNO FROM EMP WHERE ENAME LIKE 'WARD');


select ename
from emp
where ENAME not like 'WARD' 
AND job in (select job from emp where ename like 'WARD') 
AND DEPTNO in (SELECT DEPTNO FROM EMP WHERE ENAME LIKE 'WARD');