-- index 확인
SELECT INDEX_NAME, INDEX_TYPE
FROM USER_INDEXES
WHERE table_name = 'EMPLOYEES';

SELECT EMPLOYEE_ID,first_name,last_name,phone_number
FROM EMPLOYEES
WHERE salary=3000;

SELECT EMPLOYEE_ID,first_name,last_name,phone_number FROM EMPLOYEES
WHERE EMPLOYEE_ID =8000;

CREATE INDEX idx_emp_salary ON employees(salary);

COMMIT;


SELECT*FROM emp;

