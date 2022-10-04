/*
    Select �˻��� �׸��
    From   ���̺� ��
    Where  ����
    ���� �����ڸ� ��� ���� ���� , Name is null �̷� ������ ����.
*/ 

/*
    1. �÷� 

    2. ������

     - ��� ������ : +, -, *, /, mod

     - �� ������ : >, <, >=, <=, =, != (<>)

     - �� ������ : not, and, or

    - ���ڿ� ������ : like, ||

    3. IN / BETWEEN / EXISTS / NOT

    4. IS NULL, IS NOT NULL

    5. �Լ�

    6. ANY / SOME / ALL

*/
 -- ��� ����� �����, �޿�, �޿��� ���ʽ��� ���� �հ� ��� --
 -- �÷� ���� ����Ǵ� ��� As �� Ȱ���� ��Ī�� ��� �������� �ʿ䰡 ����. --
 -- As�� ������ ������.--
SELECT ename,sal,sal+nvl(comm,0) As Total_sal
FROM emp;
--WHERE

-- ���� ������ || ��� --
Select ename||' '||job As staff
From emp;

-- �ߺ� �� ���� , Distinct
Select distinct Job from emp;

---------------------------------------------------------------------
-- 1. 20�� �μ����� �ٹ��ϴ� ����� �����ȣ, �̸�, �μ���ȣ ���
Select empno, ename, deptno
From emp
Where deptno =20;

-- 2. �Ի����� 81/01/01 ���� 81/06/09�� ����� �����ȣ, �̸�, �Ի����� ���
Select empno, ename, hiredate
From emp
Where hiredate between '81/01/01' and '81/06/09';

-- 3. �������� salesman, clerk�� ������� �̸��� ������ ���
Select ename,job
From emp
Where job LIKE 'SALESMAN' or job LIKE 'CLERK';

SELECT ENAME,JOB
FROM EMP
WHERE JOB IN ('SALESMAN','CLERK');

SELECT ENAME,JOB
FROM EMP
WHERE JOB = UPPER('salesman') or Job = UPPER('clerk');

-- 4. ������ President�̰� �޿��� 1500 �̻��̰ų�, ������ Salesman�� ����� ���� ���
Select * 
From emp
Where (JOB LIKE 'PRESIDENT' AND SAL >= 1500) OR JOB LIKE 'SALESMAN';

-- 5. ������ PRESIDENT �Ǵ� SALESMAN �̰� �޿��� 1500�̻��� ����� ������ ���
SELECT *
FROM EMP
WHERE (JOB LIKE 'PRESIDENT' OR JOB LIKE 'SALESMAN') AND SAL>=1500;

-- 6. Ŀ�̼��� ���� ����� �̸�, �޿�, Ŀ�̼��� ���
SELECT ENAME,SAL,COMM
FROM EMP
WHERE COMM IS NULL OR COMM = 0;

-- 7. �����, �޿�, Ŀ�̼�, �ѱ޿�(�޿�+Ŀ�̼�)�� ���
SELECT ENAME,SAL,COMM,SAL+NVL(COMM,0) AS TOTAL_SAL
FROM EMP;

-- 8. �̸� A�� �����ϴ� ����� ���
SELECT ENAME
FROM EMP
-- SUBSTR Ư�� ���ڿ� ����(����,������ġ, ���ⰹ��)
WHERE SUBSTR(ENAME,1,1) LIKE 'A';

SELECT ENAME
FROM EMP
WHERE ENAME LIKE 'A%';

-- 9. �̸��� �ι�° ���ڰ� L�� ����� ���
SELECT ENAME
FROM EMP
-- INSTR : Ư�� ���ڰ� �ش�� ���ڿ� ��ġ ��� 
WHERE INSTR(ENAME,'L',2,1)=2;


-- _ : ���� ��ĭ �ڿ� ��ĭ ǥ��, % : ������
-- % : �� �ڸ��� ��ġ�ϴ� ������ �ٸ� ���ڳ� ���� ������ 0�� �Ǵ� �ϳ� �̻����� ǥ��
-- _ : �ش� ��ġ�� � ���ڳ� ���� ������ �� ��ġ�ؾ� ���� �ǹ�


SELECT ENAME
FROM EMP
WHERE ENAME LIKE '_L%';

-- 10. �̸��� L�� �ι� �̻� ���Ե� ����� ���
SELECT ENAME
FROM EMP 
WHERE ENAME LIKE '%L%L%';

-- 11. Ŀ�̼��� NULL�� �ƴ� ����� ��� ���� ���
SELECT *
FROM EMP
WHERE COMM IS NOT NULL;

-- 12. ���ʽ��� �޿����� 10% �̻� ���� ��� ����� ���� �̸�,�޿�,���ʽ��� ���
SELECT ENAME,SAL,COMM
FROM EMP
WHERE COMM >= SAL*1.10;

-- 13. ������ CLERK�̰ų� ANALYST�̰� �޿��� 1000,3000,5000�� �ƴ� ��� ����� ������ ���
SELECT *
FROM EMP
WHERE JOB LIKE 'CLERK' OR JOB LIKE 'ANALYST' AND SAL != 1000 AND SAL!=3000 AND SAL!=5000;

SELECT *
FROM EMP
WHERE JOB IN('CLERK','ANALYST') AND SAL NOT IN(1000,3000,5000);

-- 14. �μ���ȣ�� 30 �̰ų� �Ǵ� �����ڰ� 7782�� ����� ��� ������ ���
SELECT *
FROM EMP
WHERE DEPTNO = 30 OR MGR = 7782;