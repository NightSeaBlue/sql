/* 사원 */
CREATE TABLE EMP_A (
	EMPNO VARCHAR2(2) NOT NULL, /* 사번 */
	ENAME VARCHAR2(12), /* 사원명 */
	JOB VARCHAR2(12), /* 업무 */
	DEPTNO VARCHAR2(2) /* 부서번호 */
);

COMMENT ON TABLE EMP_A IS '사원';

COMMENT ON COLUMN EMP_A.EMPNO IS '사번';

COMMENT ON COLUMN EMP_A.ENAME IS '사원명';

COMMENT ON COLUMN EMP_A.JOB IS '업무';

COMMENT ON COLUMN EMP_A.DEPTNO IS '부서번호';

CREATE UNIQUE INDEX PK_EMP_A
	ON EMP_A (
		EMPNO ASC
	);

ALTER TABLE EMP_A
	ADD
		CONSTRAINT PK_EMP_A
		PRIMARY KEY (
			EMPNO
		);

/* 부서 */
CREATE TABLE DEPT_A (
	DEPTNO VARCHAR2(2) NOT NULL, /* 부서번호 */
	DNAME VARCHAR2(200) /* 부서명 */
);

COMMENT ON TABLE DEPT_A IS '부서';

COMMENT ON COLUMN DEPT_A.DEPTNO IS '부서번호';

COMMENT ON COLUMN DEPT_A.DNAME IS '부서명';

CREATE UNIQUE INDEX PK_DEPT_A
	ON DEPT_A (
		DEPTNO ASC
	);

ALTER TABLE DEPT_A
	ADD
		CONSTRAINT PK_DEPT_A
		PRIMARY KEY (
			DEPTNO
		);

ALTER TABLE EMP_A
	ADD
		CONSTRAINT FK_DEPT_A_TO_EMP_A
		FOREIGN KEY (
			DEPTNO
		)
		REFERENCES DEPT_A (
			DEPTNO
		);