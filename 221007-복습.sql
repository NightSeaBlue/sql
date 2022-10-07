--1. scott 또는 ward 와 월급이 같은 사원의 정보를 이름, 업무 , 급여를 출력
select ename, job, sal
from emp
where sal in (select sal from emp where ename like 'SCOTT' or ename like 'WARD');

-- 2. chicago에서 근무하는 사원과 같은 업무를 하는 사원의 이름, 업무를 출력
select e.ename , e.job
from emp e left outer join dept d
                on e.deptno = d.deptno
where d.loc like 'CHICAGO';

-- 3. 부서별로 월급이 평균 월급보다 높은 사원을 부서번호, 이름, 급여를 출력
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