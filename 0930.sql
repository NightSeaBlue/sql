-- 8000�� ������� <�����̸�>�� �޿� 10000�� �����Ͻÿ�.

INSERT INTO emp(empno,ename,sal) 
VALUES ( 8000,'����ȿ',10000 );

SELECT*FROM emp;

-- 7788�� ������� <�����̸�>�� �޿� 10000�� �����Ͻÿ�.

--(#) KEY �� �ߺ��Ǿ� �Էµ��� ����
INSERT INTO emp(empno,ename,sal) 
VALUES ( 7788,'����ȿ',10000 );    -- �������� �ߺ��Ǿ� �Է� �Ұ���.

SELECT*FROM emp;

INSERT INTO emp(empno,ename,sal,deptno) 
VALUES ( 8001,'�̼�ȭ',10000,20);

SELECT*FROM emp;

INSERT INTO emp_copy (empno,ename,sal,deptno) 
VALUES ( 8002,'�̼���',10000,50);      -- Ű�� �����Ǿ� ���� �ʾƼ� �Է� ����

SELECT*FROM emp_copy;
-------------------------------------------------------------------------

Insert into info_tab(tel,name,jumin,gender,age,home)
Values ('032','ȫ��','801212','����',33,'����');

Insert into info_tab        -- �÷� �� ������ �������� �� ��.
Values ('032','ȫ��','801212','����',33,'����');

Select*From info_tab;

Insert into info_tab(tel,name) Values('1001','ȫ�浿');
Insert into info_tab(tel,name) Values('1002','��浿');
Insert into info_tab(tel,name) Values('1002','�Ѹ�');
Insert into info_tab(name,jumin) Values('��浿','900708-1347598');
Insert into info_tab(gender,age) Values('����',22);
Insert into info_tab(tel,gender,age) Values('9999','����',22);

Select*From info_tab;

Delete from info_tab;
commit;

Alter Table info_tab
ADD CONSTRAINT pk_info_tel Primary Key (tel);
-- Primary Key �� �߰��� ���, �ݵ�� Key�� �ִ� �����͸� �Է� ����.
-- Key�� �ߺ��� ���, �ļ� ������ �Է� �Ұ�.

DROP table info_tab;

CREATE TABLE info_tab 
(
    name                   varchar2(10),
    jumin                  char(15),
    tel                     varchar2(20),
    gender                  varchar2(10),
    age                     number(3),
    home                     varchar2(20),
    CONSTRAINT pk_info_tel PRIMARY KEY (tel)
);

ALTER Table info_tab 
    MODIFY (name varchar2(10) Not Null);

ALTER Table info_tab 
    Add Constraint uq_info_jumin UNIQUE (jumin); 
    
Insert into info_tab (tel,name,jumin) values ('20001','ȫ����','990101');
-- (#) Unique �� �ߺ��Ǽ� �Էµ��� ���� (�ֹι�ȣ ����)
Insert into info_tab (tel,name,jumin) values ('20002','ȫ����','990101');
-- �ֹι�ȣ��� �������� �Էµ��� �ʾƵ�, ������ ��ǲ�� ������.
Insert into info_tab (tel,name) values ('20003','ȫȫ��');

Alter Table info_tab
    Add Constraint ck_info_gender CHECK (gender in ('����','����'));
    
Insert into info_tab (tel,name,gender) values ('10001','ȫ����','����');
Insert into info_tab (tel,name,gender) values ('20001','ȫ����','����');
Insert into info_tab (tel,name,gender) values ('30001','ȫ����','����');

Select*From info_tab;

Alter table info_tab
-- default Constraint �� ���� �Էµ��� �ʾ��� ��, �������� �Ҵ�
    Modify (gender varchar2(6) default '����' );      

Insert into info_tab (tel,name) values ('7777' , 'ȫ��');    
-------------------------------------------------------------------------------
-- [Ȯ��]
INSERT INTO info_tab( name, tel, jumin ) 
    VALUES('������', '02-777-4444', '990909-1234567'); --(O)

?INSERT INTO info_tab ( name, tel, jumin, gender, age, home )
    VALUES('������','03-555-5555', '880808-1234567', '����', 27,'���');  -- (X)

INSERT INTO info_tab( name, tel, jumin, gender, age, home )
    VALUES('ȫ�浿','03-031-0310', '900909-1234567', '����', 27,'���');   -- (O)

INSERT INTO info_tab( name, jumin) VALUES('ȫ����', '550505-1234567');  -- (X)
INSERT INTO info_tab( tel, jumin ) VALUES('031-777-7777', '700707-1234567'); -- (X)
INSERT INTO info_tab( name, tel, jumin ) VALUES('������', '031-000-0000', '700707-1234567'); -- (O)

-------------------------------------------------------------------------------
CREATE TABLE info_tab 
(
    name                   varchar2(10) Not null,
    jumin                  char(15),
    tel                     varchar2(20),
    gender                  varchar2(10) Default '����',
    age                     number(3),
    home                     varchar2(20),
    deptno                  number(2),
    CONSTRAINT pk_info_tel PRIMARY KEY (tel),
    Constraint uq_info_jumin Unique (jumin),
    Constraint ck_info_gender Check (gender in ('����','����')),
    Constraint fk_info_deptno Foreign key (deptno) References dept(deptno)
);

Insert into info_tab (tel,name,deptno) values ('777','����',20);
Insert into info_tab (tel,name,deptno) values ('8888','����',22);
Insert into info_tab (tel,name) values ('9999','¯��');

Select * From info_tab;
    

