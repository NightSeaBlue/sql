/*
    Select 검색할 항목들
    From   테이블 명
    Where  조건
    동등 연산자를 사용 하지 않음 , Name is null 이런 식으로 비교함.
*/ 

/*
    1. 컬럼 

    2. 연산자

     - 산술 연산자 : +, -, *, /, mod

     - 비교 연산자 : >, <, >=, <=, =, != (<>)

     - 논리 연산자 : not, and, or

    - 문자열 연산자 : like, ||

    3. IN / BETWEEN / EXISTS / NOT

    4. IS NULL, IS NOT NULL

    5. 함수

    6. ANY / SOME / ALL

*/
 -- 모든 사원의 사원명, 급여, 급여와 보너스를 더한 합계 출력 --
 -- 컬럼 명이 변경되는 경우 As 를 활용해 별칭을 계속 지정해줄 필요가 있음. --
 -- As는 생략이 가능함.--
SELECT ename,sal,sal+nvl(comm,0) As Total_sal
FROM emp;
--WHERE

-- 연결 연산자 || 사용 --
Select ename||' '||job As staff
From emp;

-- 중복 행 제거 , Distinct
Select distinct Job from emp;

---------------------------------------------------------------------
-- 1. 20번 부서에서 근무하는 사원의 사원번호, 이름, 부서번호 출력
Select empno, ename, deptno
From emp
Where deptno =20;

-- 2. 입사일이 81/01/01 에서 81/06/09인 사원의 사원번호, 이름, 입사일을 출력
Select empno, ename, hiredate
From emp
Where hiredate between '81/01/01' and '81/06/09';

-- 3. 담당업무가 salesman, clerk인 사원들의 이름과 업무를 출력
Select ename,job
From emp
Where job LIKE 'SALESMAN' or job LIKE 'CLERK';

SELECT ENAME,JOB
FROM EMP
WHERE JOB IN ('SALESMAN','CLERK');

SELECT ENAME,JOB
FROM EMP
WHERE JOB = UPPER('salesman') or Job = UPPER('clerk');

-- 4. 업무가 President이고 급여가 1500 이상이거나, 업무가 Salesman인 사원의 정보 출력
Select * 
From emp
Where (JOB LIKE 'PRESIDENT' AND SAL >= 1500) OR JOB LIKE 'SALESMAN';

-- 5. 업무가 PRESIDENT 또는 SALESMAN 이고 급여가 1500이상인 사원의 정보를 출력
SELECT *
FROM EMP
WHERE (JOB LIKE 'PRESIDENT' OR JOB LIKE 'SALESMAN') AND SAL>=1500;

-- 6. 커미션이 없는 사원의 이름, 급여, 커미션을 출력
SELECT ENAME,SAL,COMM
FROM EMP
WHERE COMM IS NULL OR COMM = 0;

-- 7. 사원명, 급여, 커미션, 총급여(급여+커미션)을 출력
SELECT ENAME,SAL,COMM,SAL+NVL(COMM,0) AS TOTAL_SAL
FROM EMP;

-- 8. 이름 A로 시작하는 사원명 출력
SELECT ENAME
FROM EMP
-- SUBSTR 특정 문자열 추출(정보,추출위치, 추출갯수)
WHERE SUBSTR(ENAME,1,1) LIKE 'A';

SELECT ENAME
FROM EMP
WHERE ENAME LIKE 'A%';

-- 9. 이름의 두번째 문자가 L인 사원명 출력
SELECT ENAME
FROM EMP
-- INSTR : 특정 문자가 해당된 문자열 위치 출력 
WHERE INSTR(ENAME,'L',2,1)=2;


-- _ : 앞의 한칸 뒤에 한칸 표시, % : 나머지
-- % : 그 자리가 위치하는 곳에서 다른 문자나 숫자 따위가 0개 또는 하나 이상임을 표시
-- _ : 해당 위치에 어떤 문자나 숫자 따위가 꼭 위치해야 함을 의미


SELECT ENAME
FROM EMP
WHERE ENAME LIKE '_L%';

-- 10. 이름에 L이 두번 이상 포함된 사원명 출력
SELECT ENAME
FROM EMP 
WHERE ENAME LIKE '%L%L%';

-- 11. 커미션이 NULL이 아닌 사원의 모든 정보 출력
SELECT *
FROM EMP
WHERE COMM IS NOT NULL;

-- 12. 보너스가 급여보다 10% 이상 많은 모든 사원에 대해 이름,급여,보너스를 출력
SELECT ENAME,SAL,COMM
FROM EMP
WHERE COMM >= SAL*1.10;

-- 13. 업무가 CLERK이거나 ANALYST이고 급여가 1000,3000,5000이 아닌 모든 사원의 정보를 출력
SELECT *
FROM EMP
WHERE JOB LIKE 'CLERK' OR JOB LIKE 'ANALYST' AND SAL != 1000 AND SAL!=3000 AND SAL!=5000;

SELECT *
FROM EMP
WHERE JOB IN('CLERK','ANALYST') AND SAL NOT IN(1000,3000,5000);

-- 14. 부서번호가 30 이거나 또는 관리자가 7782인 사원의 모든 정보를 출력
SELECT *
FROM EMP
WHERE DEPTNO = 30 OR MGR = 7782;