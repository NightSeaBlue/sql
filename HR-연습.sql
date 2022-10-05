--1. 이름의 성이 'King' 사원의 사번과 부서명을 출력 ( employees, departments )
SELECT E.EMPLOYEE_ID AS 사번 , D.DEPARTMENT_NAME AS 부서명
FROM EMPLOYEES E inner JOIN DEPARTMENTS D
ON E.DEPARTMENT_ID = d.department_id
WHERE E.lasT_NAME like 'King';

-- 2.이름의 성이 'King' 사원의 사번과 부서명 그리고 업무명을 출력 ( employees, departments, jobs )
select e.employee_id as 사번 , d.department_name as 부서명, j.job_title as 업무명
from employees e inner join departments d 
                        on e.department_id = d.department_id
                        inner join jobs j
                        on e.job_id = j.job_id
where e.last_name like 'King';

-- 3. 2007년 상반기에 입사한 사원들의 사번과 이름, 입사일 그리고 부서명을 출력
select e.employ_id as 사번 , e.first_name||' '||e.last_name as 이름, e.hire_date as 입사일,
       d.department_name as 부서명
from employees e inner join departments d
on e.department_id = d.department_id
where e.to_char(hire_date,'YYYYMM') in ('200701', '200706');
