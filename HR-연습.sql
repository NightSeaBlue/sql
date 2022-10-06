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
-- (*) Grant는 아직 부서가 배정받지 못한 상태이지만 Grant도 출력되려면
select e.employee_id as 사번 , e.first_name||' '||e.last_name as 이름, e.hire_date as 입사일,
       d.department_name as 부서명
from employees e full outer join departments d
on e.department_id = d.department_id
where to_char(e.HIRE_DATE,'YYYY/MM') BETWEEN '2007/01' and '2007/06';

-- 4.'Executive' 부서에서 사원과 해당 사원의 매니저(상사) 이름을 출력
-- (*) 매니저(상사)가 없는 사원인 'King'이 출력되려면
select e1.first_name||' '||e1.last_name as 이름, e2.first_name||' '||e2.last_name as 상사이름
from employees e1 left outer join departments d
                on e1.department_id = d.department_id 
                FULL OUTER join employees e2
                on e1.manager_id = e2.employee_id
where d.department_name like 'Executive';

