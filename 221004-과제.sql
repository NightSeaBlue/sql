-- 1. 2003�⿡ �Ի��� ������� ���, �̸�, �Ի����� ���
Select EMPLOYEE_ID,FIRST_NAME ||' '|| lAST_NAME AS NAME, HIRE_DATE
FROM EMPLOYEES
WHERE TO_CHAR(HIRE_DATE,'YYYY') LIKE '2003';

-- 2. ������ FI_ACCOUNT / FI_MGR / SA_MAN / SA_REP �� ������� ������ ���
SELECT *
FROM EMPLOYEES
WHERE JOB_ID LIKE 'FI_ACCOUNT' OR JOB_ID LIKE 'FI_MGR' OR JOB_ID LIKE 'SA_MAN' OR JOB_ID LIKE 'SA_REP';

SELECT *
FROM EMPLOYEES
WHERE JOB_ID IN ('FI_ACCOUNT','FI_MGR','SA_MAN','SA_REP');

-- 3. Ŀ�̼��� �޴� ������� ����� ���
SELECT FIRST_NAME ||' '|| lAST_NAME AS NAME , commission_pct
FROM EMPLOYEES
WHERE commission_pct >0;

--? 4.������ SA_MAN �Ǵ� SA_REP�̸� "�Ǹźμ�"�� �� �ܴ� "�� �� �μ�"��� ���
SELECT JOB_ID,DECODE(JOB_ID,'SA_MAN','�Ǹźμ�','SA_REP','�Ǹźμ�','�� �� �μ�') AS �μ���
FROM EMPLOYEES;

SELECT JOB_ID, CASE(JOB_ID)
WHEN 'SA_MAN' THEN '�Ǹźμ�'
WHEN 'SA_REP' THEN '�Ǹźμ�'
ELSE '�� �� �μ�'
END AS �μ���
FROM EMPLOYEES;

-- 5. �������� �Ի��ڵ��� �ּұ޿�, �ִ� �޿�, �޿��� ���� �׸��� ��� �޿��� ���Ͻÿ�
SELECT TO_CHAR(HIRE_DATE,'yyyy'),MIN(SALARY) AS �ּұ޿�, MAX(SALARY) AS �ִ�޿�, SUM(SALARY) AS �޿�����, TRUNC(AVG(SALARY)) AS ��ձ޿�
FROM EMPLOYEES
GROUP BY TO_CHAR(HIRE_DATE,'yyyy');


-- 6. �μ��� ��� �޿��� $10,000 �̻��� �μ��� ���Ͻÿ�. ( ��ձ޿��� ���� ������ )
SELECT TRUNC(AVG(SALARY)) AS ��ձ޿�
FROM EMPLOYEES
GROUP BY DEPARTMENT_ID
HAVING AVG(SALARY)> 10000
ORDER BY AVG(SALARY) DESC;

-- 7. �μ��� �ִ� �޿��� ���Ͻÿ�.
SELECT DEPARTMENT_ID,MAX(SALARY) AS �ִ�޿�
FROM EMPLOYEES
GROUP BY department_id
ORDER BY MAX(SALARY) DESC;
