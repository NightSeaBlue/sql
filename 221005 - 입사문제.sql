-- 1. 아래 스키마를 보고 평점이 3.0 이상인 학생들의 이름을 보여주는 SQL작성하시오

select s.이름 as 이름
from enroll e inner join student s
            on e.학번 = s.학번
            inner join class c
            on e.강좌번호 = c.강좌번호
where avg(e.학점) >= 3.0;

select s.이름 as 이름
from enroll e , class c, student s
where e.학번 = s.학번 and e.강좌번호 = c.강좌번호
where avg(e.학점) >= 3.0;

-- 2. full outer join 결과
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

