-- 1. Sawon ���̺� ����
Create table Sawon (
    
    sabun           number(6),
    sawon_name      varchar2(15),
    ubmu            varchar2(30),
    weolgub         NUMBER(10,2),
    buseo           number (3)
    
);

-- 2. Sabun�� �⺻ Ű�� ����
Alter Table Sawon
    Add Constraint pk_sawon_sabun Primary Key (sabun);
-- 3. �ִ� �ѱ� 10�ڸ��� jiyeok �÷��� �߰��ϵ� NULL ���� �Էµ��� �ʵ��� ����
Alter Table Sawon
    ADD (jiyeok     varchar2(30) Not null);
    
-- 4. Weolgub �÷��� ������ 7�ڸ��� ����
Alter Table Sawon
    Modify (weolgub number(7));

-- 5. Ubmu �÷��� '����','��������','����'�� ������ ������ �Էµǵ��� ����
Alter Table Sawon
    Add Constraint ck_sawon_ubmu Check (ubmu in('����','��������','����'));

-- 6. Ubmu �÷��� �����Ͱ� �Է��� �� �� ��� ����Ʈ ������ '����'�� ����
Alter Table Sawon
    Modify (ubmu Default '����');
    
-- 7 . Buseo ���̺� ����
Create Table Buseo (
    buseo_no    number(3),
    buseo_name  varchar2(30),
    Constraint pk_buseo_no  Primary Key (buseo_no)
);

-- 8. Sawon ���̺� Buseo �÷��� Buseo ���̺��� Buseo_no�� �����ϴ� �ܷ�Ű�� ����
Alter Table Sawon
    Add Constraint fk_Sawon_buseo Foreign Key (buseo) References Buseo(Buseo_no);

-- 9. Buseo ���̺� ������ �Է�
Insert into Buseo (buseo_no,buseo_name) Values (101,'����Ʈ���� ������');
Insert into Buseo (buseo_no,buseo_name) Values (202,'������');
Insert into Buseo (buseo_no,buseo_name) Values (303,'�����ڿ���');

Select*from buseo;

-- 10. Sawon ���̺� ������ �Է�
Insert into Sawon (sabun,sawon_name,weolgub,buseo,jiyeok)
    Values (8001,'ȫ�浿�̱�',100000,101,'�λ�');
Insert into Sawon (sabun,sawon_name,ubmu,weolgub,buseo,jiyeok)
    Values (8002,'ȫ����','�繫',200000,202,'��õ'); -- ���� ���� (����, ��������, ����)
Insert into Sawon (sabun,sawon_name,ubmu,buseo,jiyeok)
    Values (8003, 'ȫ���','����',111,'����');     -- �μ� ���� (101,202,303)
Insert into Sawon (sabun,sawon_name,weolgub,jiyeok)
    Values(8004,'ȫ�漮',12345678,'����'); -- �����߻� (���� ���� �ʰ�)
Insert into Sawon (sabun,sawon_name,ubmu,buseo,jiyeok)
    Values(8005,'ȫ��ö','��������',303,'����');    



-- 11. Sawon ���̺��� jiyeok �÷� ����
Alter Table Sawon
        Drop(jiyeok);
        
-- 12 . Buseo ���̺��� buseo���� '�����ڿ���'�� ���� ����
--Delete From Buseo Where buseo_no = 303;
Delete From Buseo Where buseo_name='�����ڿ���';     -- ���� �����ڿ��θ� �������� ����, ������ �ɷ�����.

-- 13. Sawon ���̺��� ��� ������ �����ϰ� ��������� ����.
Drop Table Sawon;
TRUNCATE TABLE Sawon;
Commit;

-- 14. 1~8 �ܰ� ������ ������ ���̺� ���� �ϳ��� Create ������ �ۼ�
Create Table Sawon (
    sabun           number(6),
    sawon_name      varchar2(15),
    ubmu            varchar2(30) Default '����',
    weolgub         NUMBER(7),
    buseo           number (3),
    jiyeok          varchar2(30) not null,
    Constraint pk_sawon_sabun Primary Key (sabun),
    Constraint ck_sawon_ubmu Check (ubmu in('����','��������','����')),
    Constraint fk_Sawon_buseo Foreign Key (buseo) References Buseo(Buseo_no)
);

Select*From Sawon;



