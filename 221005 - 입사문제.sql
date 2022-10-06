-- 1. �Ʒ� ��Ű���� ���� ������ 3.0 �̻��� �л����� �̸��� �����ִ� SQL�ۼ��Ͻÿ�

select s.�̸� as �̸�
from enroll e inner join student s
            on e.�й� = s.�й�
            inner join class c
            on e.���¹�ȣ = c.���¹�ȣ
where avg(e.����) >= 3.0;

select s.�̸� as �̸�
from enroll e , class c, student s
where e.�й� = s.�й� and e.���¹�ȣ = c.���¹�ȣ
where avg(e.����) >= 3.0;

-- 2. full outer join ���
/*
10 research
30 sales 
30 king
40 ward
*/

Create table dept2 (
    DEPTNO  number(2,0),
    DNAME   varchar2(30)
    
);
drop table dept2;

INSERT INTO dept2 (deptno,dname) values (10,'research');
INSERT INTO dept2 (deptno,dname) values (30,'sales');

CREATE TABLE EMP2 (
    DEPTNO NUMBER(2,0),
    DNAME  VARCHAR2(30)
);

drop table emp2;

INSERT INTO emp2 (deptno,dname) values (30,'king');
INSERT INTO emp2 (deptno,dname) values (40,'ward');

select d.deptno as deptno , d.dname as name
from dept2 d full outer join emp2 e
on d.deptno = e.deptno;

