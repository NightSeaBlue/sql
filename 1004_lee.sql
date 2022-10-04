-- 본인 계정 생성 후 계정에 dept 테이블 생성

Create table dept as select*from scott.dept;

select*from  dept;

-- deptno를 dept 테이블의 PK로 지정
Alter table dept
add Constraint pk_dept_deptno Primary Key (DEPTNO);

-- student 테이블 생성
CREATE TABLE student 
(
    no char(4),
    name varchar2(30) Not null,
    gender varchar2(6),
    addr varchar2(30),
    jumin char(15) Not null,
    deptno number(2),
    -- deptno가 dept의 deptno를 참조하도록 설정
    Constraint fk_student_deptno FOREIGN Key (deptno) REFERENCES dept(deptno)  
);

-- no를 student의 PK키로 지정
Alter Table student
ADD Constraint pk_student_number Primary Key (no);

-- jumin의 not null 조건 제거
Alter Table student
Modify (jumin char(15) null);

-- addr 의 기본값 서울로 지정
Alter Table student
Modify (addr Default('서울'));

-- 성별에서 남성,여성만 입력받기로 함
Alter Table student
Add Constraint ck_student_gender Check (gender in('남성','여성'));

Drop table student;

-- 입력 가능
INSERT INTO student(no, name, gender, addr, jumin ) 

VALUES('1111', '김태희', '여성', '서울시 강남구', '801212-1234567' );

-- 입력 가능
INSERT INTO student(no, name, jumin ) 

VALUES('2222', '송혜교', '881212-1234567');


INSERT INTO student(no, name, jumin ) -- no 중복

VALUES('1111', '강동원', '881212-1234567');


INSERT INTO student(no, name, gender, jumin ) -- 남성 아님

VALUES('3333', '하정우', '남자', '830303-1234567');

-- 입력 가능
INSERT INTO student(no, name, addr, jumin ) 

VALUES('4444', '김새론', '서울시 서초구', '990909-1234567');


INSERT INTO student(no, name, addr, deptno ) -- 없는 dept no

VALUES('8888', '이병헌', '서울시 한강', 50);

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

INSERT INTO library ( rent_id, book_id, hakbun ) VALUES( 3, 'bk003', '3333' ); -- 3333 없음

INSERT INTO library ( rent_id, book_id, hakbun ) VALUES( 4, 'bk004', '4444' );

INSERT INTO library ( rent_id, book_id, hakbun ) VALUES( 5, 'bk005', '5555' );  -- 5555 없음

Desc student;
desc library;
select * from library;
select * from student;

-- 정보 정리 --
drop table library;
drop table student;
drop table dept;



