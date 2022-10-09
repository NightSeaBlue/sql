-- index »Æ¿Œ
SELECT INDEX_NAME, INDEX_TYPE
FROM USER_INDEXES
WHERE table_name = 'EMPLOYEES';

SELECT EMPLOYEE_ID,first_name,last_name,phone_number
FROM EMPLOYEES
WHERE salary=3000;

commit;