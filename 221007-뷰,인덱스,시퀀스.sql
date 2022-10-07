CREATE OR REPLACE VIEW v_emp AS
				SELECT empno,ename,deptno FROM emp;
				
SELECT * FROM v_emp;
desc v_emp;

INSERT INTO v_emp values(1000,'홍길동',20);
SELECT * FROM v_emp;
SELECT * FROM emp;

INSERT INTO v_emp values(1000,'홍홍이',20); -- pk KEY 중복

INSERT INTO v_emp values(2000,'홍홍이',90);  -- fk KEY 걸림

-- READ ONLY 뷰

CREATE OR REPLACE VIEW EMP_30 AS
SELECT empno AS EMP_NO , ename AS NAME , SAL AS SALARY FROM EMP WHERE DEPTNO=30
WITH READ only;

SELECT*FROM EMP_30;

-- 복합 뷰 (가급적 view를 만들 땐 Read only 를 붙여서 만들 것)
Create or replace view v_emp_info as
select e.empno empno, e.ename ename, d.dname dname 
from emp e, dept d
where e.deptno=d.deptno;

SELECT*FROM V_EMP_INFO;
SELECT*FROM emp;


INSERT INTO V_EMP_INFO (empno, ename, dname) values(3333,'맹꽁이',30);

INSERT INTO V_EMP_INFO (empno, ename) values(3333,'맹꽁이');

DELETE FROM v_emp_info WHERE empno=7788;

-- [ 연습 ] 부서별로 부서명, 최소급여, 최대 급여, 부서의 평균 급여를 포함하는 V_DEPT_SUM 뷰를 생성하여라.
CREATE OR REPLACE
VIEW v_dept_sum AS
						SELECT
	D.DNAME AS 부서명 ,
	MIN(E.SAL) AS 최소급여,
	MAX(E.SAL) AS 최대급여,
	TRUNC(AVG(E.SAL)) AS 평균급여
FROM
	emp E
FULL OUTER JOIN dept D
									ON
	E.DEPTNO = D.DEPTNO
GROUP BY
	D.DNAME			
WITH READ ONLY;

SELECT*FROM V_DEPT_SUM;

INSERT INTO emp(empno,ename,sal,deptno)
	   values(4444,'호이',9900,20);

-- 시퀀스 제작
CREATE SEQUENCE seq_temp;
SELECT seq_temp.nextval FROM dual;
SELECT seq_temp.currval FROM dual;

-- 5000번 부터 10씩 증가하는 자동증가수 (시퀀스)
CREATE SEQUENCE seq_temp2
		START WITH 5000
		INCREMENT BY 10;
	
SELECT seq_temp2.nextval FROM dual;	

INSERT INTO emp(empno,ename) VALUES (seq_temp2.nextval,'박씨');
SELECT*FROM emp;


-- 인덱스 (빠른 검색을 위해 사용)
/*
 	  별도로 인덱스 컬럼과 ROWID 정보를 관리하고 이 정보를 먼저 찾아 실제 테이블에 있는 데이터를 검색
	` 테이블에 새로운 행이 입력되거나 변경 제거되면 인덱스 정보도 갱신된다.
	` 너무 많은 인덱스나 테이블의 데이터가 적은 경우는 성능을 저하
	` PRIMARY KEY와 UNIQUE KEY는 자동으로 UNIQUE INDEX로 자동 생성
*/	
SELECT empno, ename, job, rowid FROM emp;







	  
