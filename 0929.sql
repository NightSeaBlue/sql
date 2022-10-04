-- �������

/*
     �̸�          name                   varchar2(10)
     �ֹε�Ϲ�ȣ   jumin                  char(15)   
     ��ȭ��ȣ      tel                     varchar2(20) 
     ����         gender                  varchar2(10)    
     ����         age                     number(3)    
     �����       home                     varchar2(20)
     
*/

CREATE TABLE info_tab --��ҹ��ڸ� �������� �ʱ� ������ ����� ǥ�⸦ ���� ���
(
    name                   varchar2(10),
    jumin                  char(15),
    tel                     varchar2(20),
    gender                  varchar2(10),
    age                     number(3),
    home                     varchar2(20)
);

-- ���̺� ���� Ȯ��
DESC info_tab;

-- ������ Ȯ��
Select * FROM info_tab;

/*  ���̺� �� : student_score
    �й�      ID      char(4)
    �л���    name    varchar2(20)      
    ����      kor     number(3)
    ����      eng     number(3)
    ����      total   number
    ���      avg     number(5,2) -- �޸� ���� ��ü �ڸ��� , �ڿ� ���°� �Ҽ��� �ڸ� ��
    
*/

CREATE TABLE student_score
(
    ID      char(4),
    name    varchar2(20),
    kor     number(3),
    eng     number(3),
    total   number,
    avg     number(5,2)
       
);

-- ���̺� ���� Ȯ��
DESC student_score;

-- ������ Ȯ��
Select * FROM student_score;

-- ���̺� ����
--DROP TABLE student_score;

-- ���� �÷� �߰�
-- ALTER TABLE table_name ADD ( [ column_name data_type ] );
ALTER TABLE student_score 
    ADD ( math  number(3));

-- ���� �÷� �� �߸� ���� �÷� ����
ALTER TABLE student_score
    DROP(total);
    
-- ��� �÷����� �Ҽ��� 1�ڷ� ����
ALTER TABLE student_score
    MODIFY (avg number (4,1));
    
DESC student_score;

-- ������ �Է�
-- ���� : '' // ����
INSERT INTO student_score (id,name,kor,eng)
    VALUES ('0001','ȫ�浿',80,80);
-- ������ Ȯ��
SELECT * FROM student_score;

-- 2000�� �й��� ȫ������ ����� ���������� ���� 60,90 ������ ����
INSERT INTO student_score (id,name,kor,eng)
    VALUES ('2000','ȫ����',60,90);
     
-- ������ Ȯ��
SELECT * FROM student_score;
    
commit;

-- rollback ; ���� �������� �ǵ���.

-- 1000�� �л� ȫ��� ������ ����
INSERT INTO student_score (id,name)
    VALUES ('1000','ȫ���');

-- �̸��� ȫ����� �л��� ���ڵ带 ����
DELETE FROM student_score where name='ȫ���';

-- 0001�� �л��� ���������� 100������ ����
UPDATE student_score SET kor=100 WHERE ID='0001';

-- ȫ������ ���������� 90������ �Է� // �̹� �Է¹��� �����̹Ƿ� ������Ʈ�� ���ָ� ��
UPDATE student_score SET math=90 WHERE name='ȫ����';

-- �л����� ��� ���ϱ�
UPDATE student_score 
    SET avg= (kor+eng+nvl(math,0))/3;
    --WHERE : ��� �л����� ���� ���ϹǷ� ��� ��, ���� ��� ��� �߰���;


--- emp_copy table ����    
CREATE TABLE emp_copy
    AS SELECT * FROM emp;

-- 1. �����ȣ�� 7788�� ����� �μ��� 10������ ����
UPDATE emp_copy 
    SET DEPTNO = 10
    WHERE EMPNO = 7788;
    
-- 2.�����ȣ�� 7782�� ����� �̸��� ȫ������� �����ϰ� �޿��� 3500���� ����
UPDATE emp_copy 
    SET ENAME = 'ȫ���', SAL =3500
    WHERE EMPNO = 7782;
    
-- 3. ��� �μ����� ���ʽ��� 300�� �λ� ����
UPDATE emp_copy 
    SET COMM = nvl(COMM,0)+300;
-- 4. �����ȣ�� 7499�� ����� ������ ����
DELETE FROM emp_copy WHERE empno=7499;

-- 5. �Ի����ڰ� 81�� 6�� 1�� ������ ����� ������ ����
DELETE FROM emp_copy WHERE HIREDATE < '1981-06-01';

DESC emp_copy;

SELECT * FROM emp_copy;
    
ROLLBACK;
COMMIT;

-- emp_copy ���� ����
DELETE FROM emp_copy;

TRUNCATE TABLE emp_copy;
