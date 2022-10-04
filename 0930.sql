-- 8000번 사원으로 <본인이름>과 급여 10000을 저장하시오.

INSERT INTO emp(empno,ename,sal) 
VALUES ( 8000,'이지효',10000 );

SELECT*FROM emp;

-- 7788번 사원으로 <본인이름>과 급여 10000을 저장하시오.

--(#) KEY 가 중복되어 입력되지 않음
INSERT INTO emp(empno,ename,sal) 
VALUES ( 7788,'이지효',10000 );    -- 고유값이 중복되어 입력 불가능.

SELECT*FROM emp;

INSERT INTO emp(empno,ename,sal,deptno) 
VALUES ( 8001,'이선화',10000,20);

SELECT*FROM emp;

INSERT INTO emp_copy (empno,ename,sal,deptno) 
VALUES ( 8002,'이선아',10000,50);      -- 키가 지정되어 있지 않아서 입력 가능

SELECT*FROM emp_copy;
-------------------------------------------------------------------------

Insert into info_tab(tel,name,jumin,gender,age,home)
Values ('032','홍자','801212','남자',33,'제주');

Insert into info_tab        -- 컬럼 명 가급적 생략하지 말 것.
Values ('032','홍자','801212','남자',33,'제주');

Select*From info_tab;

Insert into info_tab(tel,name) Values('1001','홍길동');
Insert into info_tab(tel,name) Values('1002','김길동');
Insert into info_tab(tel,name) Values('1002','둘리');
Insert into info_tab(name,jumin) Values('김길동','900708-1347598');
Insert into info_tab(gender,age) Values('남자',22);
Insert into info_tab(tel,gender,age) Values('9999','남자',22);

Select*From info_tab;

Delete from info_tab;
commit;

Alter Table info_tab
ADD CONSTRAINT pk_info_tel Primary Key (tel);
-- Primary Key 가 추가될 경우, 반드시 Key가 있는 데이터만 입력 가능.
-- Key가 중복될 경우, 후술 데이터 입력 불가.

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
    
Insert into info_tab (tel,name,jumin) values ('20001','홍실이','990101');
-- (#) Unique 가 중복되서 입력되지 않음 (주민번호 동일)
Insert into info_tab (tel,name,jumin) values ('20002','홍동이','990101');
-- 주민번호라는 고유값은 입력되지 않아도, 데이터 인풋은 가능함.
Insert into info_tab (tel,name) values ('20003','홍홍이');

Alter Table info_tab
    Add Constraint ck_info_gender CHECK (gender in ('남성','여성'));
    
Insert into info_tab (tel,name,gender) values ('10001','홍돌이','남성');
Insert into info_tab (tel,name,gender) values ('20001','홍숙이','남자');
Insert into info_tab (tel,name,gender) values ('30001','홍숙이','여성');

Select*From info_tab;

Alter table info_tab
-- default Constraint 에 값이 입력되지 않았을 때, 남성으로 할당
    Modify (gender varchar2(6) default '남성' );      

Insert into info_tab (tel,name) values ('7777' , '홍이');    
-------------------------------------------------------------------------------
-- [확인]
INSERT INTO info_tab( name, tel, jumin ) 
    VALUES('갑순이', '02-777-4444', '990909-1234567'); --(O)

?INSERT INTO info_tab ( name, tel, jumin, gender, age, home )
    VALUES('갑갑이','03-555-5555', '880808-1234567', '남자', 27,'경기');  -- (X)

INSERT INTO info_tab( name, tel, jumin, gender, age, home )
    VALUES('홍길동','03-031-0310', '900909-1234567', '남성', 27,'경기');   -- (O)

INSERT INTO info_tab( name, jumin) VALUES('홍길자', '550505-1234567');  -- (X)
INSERT INTO info_tab( tel, jumin ) VALUES('031-777-7777', '700707-1234567'); -- (X)
INSERT INTO info_tab( name, tel, jumin ) VALUES('갑동이', '031-000-0000', '700707-1234567'); -- (O)

-------------------------------------------------------------------------------
CREATE TABLE info_tab 
(
    name                   varchar2(10) Not null,
    jumin                  char(15),
    tel                     varchar2(20),
    gender                  varchar2(10) Default '남성',
    age                     number(3),
    home                     varchar2(20),
    deptno                  number(2),
    CONSTRAINT pk_info_tel PRIMARY KEY (tel),
    Constraint uq_info_jumin Unique (jumin),
    Constraint ck_info_gender Check (gender in ('남성','여성')),
    Constraint fk_info_deptno Foreign key (deptno) References dept(deptno)
);

Insert into info_tab (tel,name,deptno) values ('777','맹이',20);
Insert into info_tab (tel,name,deptno) values ('8888','꽁이',22);
Insert into info_tab (tel,name) values ('9999','짱이');

Select * From info_tab;
    

