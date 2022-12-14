--1. 사원번호, 이름, 업무, 급여,  현재 급여에 15% 증가된 급여를(New Salary),  증가액(Increase)를 출력
SELECT EMPNO,ENAME,JOB,SAL, SAL*1.15 AS NEWSALARY , SAL*1.15-SAL AS INCREASE
FROM EMP;

-- 2. 이름, 입사일, 입사일로부터 6개월 후에 돌아오는 월요일을 출력
SELECT ENAME, HIREDATE, NEXT_DAY(ADD_MONTHS(HIREDATE,6),2) AS NEXTMONDAY
FROM EMP;

-- 3.이름, 입사일, 입사일로부터 현재까지의  년수, 급여, 입사일로부터 현재까지의 급여의 총계를 출력
SELECT ENAME, HIREDATE, TRUNC(MONTHS_BETWEEN(SYSDATE,HIREDATE)/12) AS 년수, SAL, TRUNC(SAL*(MONTHS_BETWEEN(SYSDATE,HIREDATE)/12)) AS 급여총계
FROM EMP;

SELECT ENMAE, HIREDATE,TO_CHAR(SYSDATE,'YYYY')-TO_CHAR(HIREDATE,'YYYY') AS 년수, SAL *(TO_CHAR(SYSDATE,'YYYY')-TO_CHAR(HIREDATE,'YYYY')) AS 급여총계

-- 4. 이름, 업무, 입사일, 입사한 요일을 출력
SELECT ENAME, JOB, HIREDATE,TO_CHAR(HIREDATE,'DAY') AS 입사요일
FROM EMP;

-- 5. 업무별, 부서별 급여 합계와 인원수를 출력하되, 10번 부서를 제외하고 업무가 'SALESMAN'과 'MANAGER'만 출력한다.
SELECT JOB,DEPTNO,SUM(SAL) AS 급여합계, COUNT(*) AS 인원수
FROM EMP
WHERE DEPTNO != 10 AND JOB IN ('SALESMAN','MANAGER')
GROUP BY JOB,DEPTNO;

SELECT JOB,DEPTNO, SUM(SAL) AS 급여합계, COUNT(*) AS 인원수
FROM EMP
WHERE DEPTNO != 10
GROUP BY JOB,DEPTNO
HAVING JOB IN ('SALESMAN','MANAGER');

-- 6. 업무별로 평균급여와 최대급여를 출력하되, 평균급여가 2000이상인 것만 출력하고 평균급여가 높은 순으로 정렬
SELECT FLOOR(AVG(SAL)) AS 평균급여 , MAX(SAL) AS 최대급여
FROM EMP
GROUP BY JOB
HAVING AVG(SAL)>= 2000
ORDER BY MAX(SAL) DESC;

-- 7. 같은 입사년도 별로 인원 수를 출력
SELECT COUNT(*) AS 인원수, TO_CHAR(HIREDATE,'YYYY') AS 입사년도
FROM EMP
GROUP BY TO_CHAR(HIREDATE,'YYYY');

-- 8. 5개씩 급여합계와 인원수를 출력 (ROWNUM이용)
SELECT ceil(ROWNUM/5),SUM(SAL) AS 급여합계, COUNT(*) AS 인원수
FROM EMP
GROUP BY ceil(ROWNUM/5)
ORDER BY CEIL(ROWNUM/5) ASC;

-- 9. 다음과 같이 출력
SELECT count (decode(job,'CLERK',2)) AS CLERK ,COUNT (decode(job,'SALESMAN',2)) AS SALESMAN , COUNT(decode(job,'MANAGER',2)) AS MANAGER
FROM EMP;

select job,count (*) as count
from emp
group by job
having count(*)>2;

-- 10. 다음과 같이 업무별, 부서별 출력
select job as 업무명,nvl(sum(decode(deptno,10,sal)),0) as "10번부서", nvl(sum(decode(deptno,20,sal)),0) as "20번부서" ,nvl(sum(decode(deptno,30,sal)),0) as "30번부서", sum(sal) as 급여합계
from emp
group by job;

select job,deptno,sum(sal) as 급여합계
from emp
group by job, deptno
having deptno in (10,20,30);


