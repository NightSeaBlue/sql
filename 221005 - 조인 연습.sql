--1. EMP 테이블에서 사원번호, 이름, 업무, 부서번호와 DEPT 테이블에서 부서명, 근무지를 출력
select e.empno as empno, e.ename as ename , e.job as job , e.deptno as deptno,
       d.dname as dname, d.loc as location
from emp e FULL OUTER join dept d
on e.deptno = d.deptno;

-- 2. SALESMAN 사원만 사원번호, 이름, 급여, 부서명, 근무지를 출력
select e.empno as empno, e.ename as 이름, e.sal as sal, d.dname as 부서명, d.loc as 근무지
from emp e FULL OUTER join dept d
on e.deptno = d.deptno
where job like 'SALESMAN';

-- 3. 보너스(comm)를 받는 사원에 대해 이름, 부서명, 위치를 출력
SELECT E.ENAME AS 이름 , D.DNAME AS 부서명 , D.LOC AS 근무지
FROM EMP E FULL OUTER JOIN DEPT D
ON E.DEPTNO = D.DEPTNO
WHERE COMM != 0;

-- 4. 부서별 부서명과 급여 합계를 출력
SELECT D.DNAME AS 부서명 , SUM(SAL) AS 급여합계
FROM EMP E FULL OUTER JOIN DEPT D
ON E.DEPTNO = D.DEPTNO
GROUP BY D.DNAME;

-- 5.업무가 ‘MANAGER’인 사원의 정보를 이름, 업무, 부서명, 근무지를 출력
SELECT E.ENAME AS 이름 , E.JOB AS 업무 , D.DNAME AS 부서명 , D.LOC AS 근무지
FROM EMP E FULL OUTER JOIN DEPT D
ON E.EMPNO = D.DEPTNO
WHERE E.JOB LIKE 'MANAGER';

