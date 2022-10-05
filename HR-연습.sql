--1. �̸��� ���� 'King' ����� ����� �μ����� ��� ( employees, departments )
SELECT E.EMPLOYEE_ID AS ��� , D.DEPARTMENT_NAME AS �μ���
FROM EMPLOYEES E inner JOIN DEPARTMENTS D
ON E.DEPARTMENT_ID = d.department_id
WHERE E.lasT_NAME like 'King';

-- 2.�̸��� ���� 'King' ����� ����� �μ��� �׸��� �������� ��� ( employees, departments, jobs )
select e.employee_id as ��� , d.department_name as �μ���, j.job_title as ������
from employees e inner join departments d 
                        on e.department_id = d.department_id
                        inner join jobs j
                        on e.job_id = j.job_id
where e.last_name like 'King';

-- 3. 2007�� ��ݱ⿡ �Ի��� ������� ����� �̸�, �Ի��� �׸��� �μ����� ���
select e.employ_id as ��� , e.first_name||' '||e.last_name as �̸�, e.hire_date as �Ի���,
       d.department_name as �μ���
from employees e inner join departments d
on e.department_id = d.department_id
where e.to_char(hire_date,'YYYYMM') in ('200701', '200706');
