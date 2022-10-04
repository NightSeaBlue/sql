-- 1. Sawon 테이블 생성
Create table Sawon (
    
    sabun           number(6),
    sawon_name      varchar2(15),
    ubmu            varchar2(30),
    weolgub         NUMBER(10,2),
    buseo           number (3)
    
);

-- 2. Sabun을 기본 키로 설정
Alter Table Sawon
    Add Constraint pk_sawon_sabun Primary Key (sabun);
-- 3. 최대 한글 10자리의 jiyeok 컬럼을 추가하되 NULL 값이 입력되지 않도록 지정
Alter Table Sawon
    ADD (jiyeok     varchar2(30) Not null);
    
-- 4. Weolgub 컬럼을 정수형 7자리로 변경
Alter Table Sawon
    Modify (weolgub number(7));

-- 5. Ubmu 컬럼은 '개발','유지보수','관리'만 데이터 값으로 입력되도록 지정
Alter Table Sawon
    Add Constraint ck_sawon_ubmu Check (ubmu in('개발','유지보수','관리'));

-- 6. Ubmu 컬럼에 데이터가 입력이 안 될 경우 디폴트 값으로 '개발'을 설정
Alter Table Sawon
    Modify (ubmu Default '개발');
    
-- 7 . Buseo 테이블 생성
Create Table Buseo (
    buseo_no    number(3),
    buseo_name  varchar2(30),
    Constraint pk_buseo_no  Primary Key (buseo_no)
);

-- 8. Sawon 테이블 Buseo 컬럼을 Buseo 테이블의 Buseo_no를 참조하는 외래키로 설정
Alter Table Sawon
    Add Constraint fk_Sawon_buseo Foreign Key (buseo) References Buseo(Buseo_no);

-- 9. Buseo 테이블 데이터 입력
Insert into Buseo (buseo_no,buseo_name) Values (101,'소프트웨어 유지부');
Insert into Buseo (buseo_no,buseo_name) Values (202,'관리부');
Insert into Buseo (buseo_no,buseo_name) Values (303,'인적자원부');

Select*from buseo;

-- 10. Sawon 테이블 데이터 입력
Insert into Sawon (sabun,sawon_name,weolgub,buseo,jiyeok)
    Values (8001,'홍길동이군',100000,101,'부산');
Insert into Sawon (sabun,sawon_name,ubmu,weolgub,buseo,jiyeok)
    Values (8002,'홍길자','사무',200000,202,'인천'); -- 업무 없음 (개발, 유지보수, 관리)
Insert into Sawon (sabun,sawon_name,ubmu,buseo,jiyeok)
    Values (8003, '홍길순','개발',111,'대전');     -- 부서 없음 (101,202,303)
Insert into Sawon (sabun,sawon_name,weolgub,jiyeok)
    Values(8004,'홍길석',12345678,'서울'); -- 오류발생 (월급 범위 초과)
Insert into Sawon (sabun,sawon_name,ubmu,buseo,jiyeok)
    Values(8005,'홍길철','유지보수',303,'서울');    



-- 11. Sawon 테이블에서 jiyeok 컬럼 제거
Alter Table Sawon
        Drop(jiyeok);
        
-- 12 . Buseo 테이블에서 buseo명이 '인적자원부'인 행을 삭제
--Delete From Buseo Where buseo_no = 303;
Delete From Buseo Where buseo_name='인적자원부';     -- 원래 인적자원부만 지워지지 않음, 참조에 걸려있음.

-- 13. Sawon 테이블의 모든 내용을 삭제하고 저장공간을 해제.
Drop Table Sawon;
TRUNCATE TABLE Sawon;
Commit;

-- 14. 1~8 단계 까지를 각각의 테이블에 각각 하나의 Create 문으로 작성
Create Table Sawon (
    sabun           number(6),
    sawon_name      varchar2(15),
    ubmu            varchar2(30) Default '개발',
    weolgub         NUMBER(7),
    buseo           number (3),
    jiyeok          varchar2(30) not null,
    Constraint pk_sawon_sabun Primary Key (sabun),
    Constraint ck_sawon_ubmu Check (ubmu in('개발','유지보수','관리')),
    Constraint fk_Sawon_buseo Foreign Key (buseo) References Buseo(Buseo_no)
);

Select*From Sawon;



