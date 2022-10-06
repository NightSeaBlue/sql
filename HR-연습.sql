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
-- (*) Grant�� ���� �μ��� �������� ���� ���������� Grant�� ��µǷ���
select e.employee_id as ��� , e.first_name||' '||e.last_name as �̸�, e.hire_date as �Ի���,
       d.department_name as �μ���
from employees e full outer join departments d
on e.department_id = d.department_id
where to_char(e.HIRE_DATE,'YYYY/MM') BETWEEN '2007/01' and '2007/06';

-- 4.'Executive' �μ����� ����� �ش� ����� �Ŵ���(���) �̸��� ���
-- (*) �Ŵ���(���)�� ���� ����� 'King'�� ��µǷ���
select e1.first_name||' '||e1.last_name as �̸�, e2.first_name||' '||e2.last_name as ����̸�
from employees e1 left outer join departments d
                on e1.department_id = d.department_id 
                FULL OUTER join employees e2
                on e1.manager_id = e2.employee_id
where d.department_name like 'Executive';

