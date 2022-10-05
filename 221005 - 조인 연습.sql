--1. EMP ���̺��� �����ȣ, �̸�, ����, �μ���ȣ�� DEPT ���̺��� �μ���, �ٹ����� ���
select e.empno as empno, e.ename as ename , e.job as job , e.deptno as deptno,
       d.dname as dname, d.loc as location
from emp e FULL OUTER join dept d
on e.deptno = d.deptno;

-- 2. SALESMAN ����� �����ȣ, �̸�, �޿�, �μ���, �ٹ����� ���
select e.empno as empno, e.ename as �̸�, e.sal as sal, d.dname as �μ���, d.loc as �ٹ���
from emp e FULL OUTER join dept d
on e.deptno = d.deptno
where job like 'SALESMAN';

-- 3. ���ʽ�(comm)�� �޴� ����� ���� �̸�, �μ���, ��ġ�� ���
SELECT E.ENAME AS �̸� , D.DNAME AS �μ��� , D.LOC AS �ٹ���
FROM EMP E FULL OUTER JOIN DEPT D
ON E.DEPTNO = D.DEPTNO
WHERE COMM != 0;

-- 4. �μ��� �μ���� �޿� �հ踦 ���
SELECT D.DNAME AS �μ��� , SUM(SAL) AS �޿��հ�
FROM EMP E FULL OUTER JOIN DEPT D
ON E.DEPTNO = D.DEPTNO
GROUP BY D.DNAME;

-- 5.������ ��MANAGER���� ����� ������ �̸�, ����, �μ���, �ٹ����� ���
SELECT E.ENAME AS �̸� , E.JOB AS ���� , D.DNAME AS �μ��� , D.LOC AS �ٹ���
FROM EMP E FULL OUTER JOIN DEPT D
ON E.EMPNO = D.DEPTNO
WHERE E.JOB LIKE 'MANAGER';

