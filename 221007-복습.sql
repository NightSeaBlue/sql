--1. scott �Ǵ� ward �� ������ ���� ����� ������ �̸�, ���� , �޿��� ���
select ename, job, sal
from emp
where sal in (select sal from emp where ename like 'SCOTT' or ename like 'WARD');

-- 2. chicago���� �ٹ��ϴ� ����� ���� ������ �ϴ� ����� �̸�, ������ ���
select e.ename , e.job
from emp e left outer join dept d
                on e.deptno = d.deptno
where d.loc like 'CHICAGO';

-- 3. �μ����� ������ ��� ���޺��� ���� ����� �μ���ȣ, �̸�, �޿��� ���
SELECT E.DEPTNO, E.ENAME, E.SAL
FROM EMP E
WHERE E.SAL> (SELECT AVG(SAL) FROM EMP E2 WHERE E.DEPTNO = E2.DEPTNO)
ORDER BY E.DEPTNO;

SELECT E.DEPTNO, E.ENAME, E.SAL
FROM EMP E RIGHT OUTER JOIN (SELECT DEPTNO, AVG(SAL) AS AVG FROM EMP GROUP BY DEPTNO) EX
            ON E.DEPTNO=EX.DEPTNO 
WHERE E.SAL > EX.AVG;

SELECT E.DEPTNO, E.ENAME, E.SAL
FROM (SELECT DEPTNO, AVG(SAL) AS AVG FROM EMP GROUP BY DEPTNO) EX LEFT OUTER JOIN EMP E 
            ON EX.DEPTNO=E.DEPTNO 
WHERE E.SAL > EX.AVG;