-- ���� ���� ���� �� ������ dept ���̺� ����

Create table dept as select*from scott.dept;

select*from  dept;

-- deptno�� dept ���̺��� PK�� ����
Alter table dept
add Constraint pk_dept_deptno Primary Key (DEPTNO);

-- student ���̺� ����
CREATE TABLE student 
(
    no char(4),
    name varchar2(30) Not null,
    gender varchar2(6),
    addr varchar2(30),
    jumin char(15) Not null,
    deptno number(2),
    -- deptno�� dept�� deptno�� �����ϵ��� ����
    Constraint fk_student_deptno FOREIGN Key (deptno) REFERENCES dept(deptno)  
);

-- no�� student�� PKŰ�� ����
Alter Table student
ADD Constraint pk_student_number Primary Key (no);

-- jumin�� not null ���� ����
Alter Table student
Modify (jumin char(15) null);

-- addr �� �⺻�� ����� ����
Alter Table student
Modify (addr Default('����'));

-- �������� ����,������ �Է¹ޱ�� ��
Alter Table student
Add Constraint ck_student_gender Check (gender in('����','����'));

Drop table student;

-- �Է� ����
INSERT INTO student(no, name, gender, addr, jumin ) 

VALUES('1111', '������', '����', '����� ������', '801212-1234567' );

-- �Է� ����
INSERT INTO student(no, name, jumin ) 

VALUES('2222', '������', '881212-1234567');


INSERT INTO student(no, name, jumin ) -- no �ߺ�

VALUES('1111', '������', '881212-1234567');


INSERT INTO student(no, name, gender, jumin ) -- ���� �ƴ�

VALUES('3333', '������', '����', '830303-1234567');

-- �Է� ����
INSERT INTO student(no, name, addr, jumin ) 

VALUES('4444', '�����', '����� ���ʱ�', '990909-1234567');


INSERT INTO student(no, name, addr, deptno ) -- ���� dept no

VALUES('8888', '�̺���', '����� �Ѱ�', 50);

Create table library
(
  rent_id   number(1),
  book_id   varchar2(10) Not null,
  hakbun    char(4),
  Constraint pk_library_rent_id Primary key (rent_id),
  Constraint fk_library_hakbun FOREIGN Key (hakbun) REferences student(no)
);

INSERT INTO library ( rent_id, book_id, hakbun ) VALUES( 1, 'bk001', '1111' );

INSERT INTO library ( rent_id, book_id, hakbun ) VALUES( 2, 'bk002', '2222' );

INSERT INTO library ( rent_id, book_id, hakbun ) VALUES( 3, 'bk003', '3333' ); -- 3333 ����

INSERT INTO library ( rent_id, book_id, hakbun ) VALUES( 4, 'bk004', '4444' );

INSERT INTO library ( rent_id, book_id, hakbun ) VALUES( 5, 'bk005', '5555' );  -- 5555 ����

Desc student;
desc library;
select * from library;
select * from student;

-- ���� ���� --
drop table library;
drop table student;
drop table dept;



