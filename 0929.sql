-- 구조잡기

/*
     이름          name                   varchar2(10)
     주민등록번호   jumin                  char(15)   
     전화번호      tel                     varchar2(20) 
     성별         gender                  varchar2(10)    
     나이         age                     number(3)    
     출신지       home                     varchar2(20)
     
*/

CREATE TABLE info_tab --대소문자를 구분하지 않기 때문에 언더바 표기를 많이 사용
(
    name                   varchar2(10),
    jumin                  char(15),
    tel                     varchar2(20),
    gender                  varchar2(10),
    age                     number(3),
    home                     varchar2(20)
);

-- 테이블 구조 확인
DESC info_tab;

-- 데이터 확인
Select * FROM info_tab;

/*  테이블 명 : student_score
    학번      ID      char(4)
    학생명    name    varchar2(20)      
    국어      kor     number(3)
    영어      eng     number(3)
    총점      total   number
    평균      avg     number(5,2) -- 콤마 앞이 전체 자리수 , 뒤에 오는게 소숫점 자리 수
    
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

-- 테이블 구조 확인
DESC student_score;

-- 데이터 확인
Select * FROM student_score;

-- 테이블 삭제
--DROP TABLE student_score;

-- 수학 컬럼 추가
-- ALTER TABLE table_name ADD ( [ column_name data_type ] );
ALTER TABLE student_score 
    ADD ( math  number(3));

-- 총점 컬럼 및 잘못 만든 컬럼 삭제
ALTER TABLE student_score
    DROP(total);
    
-- 평균 컬럼에서 소수점 1자로 변경
ALTER TABLE student_score
    MODIFY (avg number (4,1));
    
DESC student_score;

-- 데이터 입력
-- 문자 : '' // 숫자
INSERT INTO student_score (id,name,kor,eng)
    VALUES ('0001','홍길동',80,80);
-- 데이터 확인
SELECT * FROM student_score;

-- 2000번 학번인 홍길자의 국어와 영어점수를 각각 60,90 점으로 저장
INSERT INTO student_score (id,name,kor,eng)
    VALUES ('2000','홍길자',60,90);
     
-- 데이터 확인
SELECT * FROM student_score;
    
commit;

-- rollback ; 이전 시점으로 되돌림.

-- 1000번 학생 홍길숙 정보를 저장
INSERT INTO student_score (id,name)
    VALUES ('1000','홍길숙');

-- 이름이 홍길숙인 학생의 레코드를 삭제
DELETE FROM student_score where name='홍길숙';

-- 0001번 학생의 국어점수를 100점으로 수정
UPDATE student_score SET kor=100 WHERE ID='0001';

-- 홍길자의 수학점수를 90점으로 입력 // 이미 입력받은 상태이므로 업데이트만 해주면 됨
UPDATE student_score SET math=90 WHERE name='홍길자';

-- 학생들의 평균 구하기
UPDATE student_score 
    SET avg= (kor+eng+nvl(math,0))/3;
    --WHERE : 모든 학생들의 값을 구하므로 없어도 됨, 없는 경우 모두 추가됨;


--- emp_copy table 생성    
CREATE TABLE emp_copy
    AS SELECT * FROM emp;

-- 1. 사원번호가 7788인 사원의 부서를 10번으로 변경
UPDATE emp_copy 
    SET DEPTNO = 10
    WHERE EMPNO = 7788;
    
-- 2.사원번호가 7782인 사원의 이름을 홍길숙으로 변경하고 급여를 3500으로 변경
UPDATE emp_copy 
    SET ENAME = '홍길숙', SAL =3500
    WHERE EMPNO = 7782;
    
-- 3. 모든 부서원의 보너스를 300씩 인상 변경
UPDATE emp_copy 
    SET COMM = nvl(COMM,0)+300;
-- 4. 사원번호가 7499인 사원의 정보를 삭제
DELETE FROM emp_copy WHERE empno=7499;

-- 5. 입사일자가 81년 6월 1일 이전인 사원의 정보를 삭제
DELETE FROM emp_copy WHERE HIREDATE < '1981-06-01';

DESC emp_copy;

SELECT * FROM emp_copy;
    
ROLLBACK;
COMMIT;

-- emp_copy 정보 삭제
DELETE FROM emp_copy;

TRUNCATE TABLE emp_copy;
