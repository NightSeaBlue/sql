--평균 급여 구하기

SELECT
    round(AVG(sal))
FROM
    emp;

-- 그 평균 급여보다 낮은 사원 정보 조회
SELECT
    ename,
    sal
FROM
    emp
WHERE
    sal < (
        SELECT
            round(AVG(sal))
        FROM
            emp
    );

-- 월급이 가장 많은 사원의 정보 조회
SELECT
    *
FROM
    emp
WHERE
    sal = (
        SELECT
            MAX(sal)
        FROM
            emp
    );

-- 평균 급여보다 높고 최대 급여보다 낮은 월급을 받는 사원의 정보를 조회
SELECT
    *
FROM
    emp
WHERE
        sal > (
            SELECT
                AVG(sal)
            FROM
                emp
        )
    AND sal < (
        SELECT
            MAX(sal)
        FROM
            emp
    );

-- join 형태로도 subquery 활용 가능
SELECT
    *
FROM
    emp e,
    (
        SELECT
            round(AVG(sal)) AS avg,
            MAX(sal)        AS max
        FROM
            emp
    )   ext
WHERE
        e.sal > ext.avg
    AND e.sal < ext.max;    

-- 월급 순으로 상위 10명의 명단 출력 (order by 를 사용한 서브쿼리는 반드시 from에 위치)
SELECT
    *
FROM
    (
        SELECT
            *
        FROM
            emp
        ORDER BY
            nvl(sal, 0) DESC
    ) sort
WHERE
    ROWNUM < 11;

SELECT
    *
FROM
    (
        SELECT
            ename,
            sal
        FROM
            emp
        ORDER BY
            nvl(sal, 0) DESC
    ) e
WHERE
    ROWNUM < 11;

-- 업무별로 최소 급여를 받는 사원의 정보를 사원번호, 이름, 담당업무, 급여를 출력
SELECT
    MIN(sal)
FROM
    emp
GROUP BY
    job;

SELECT
    empno,
    ename,
    job,
    sal
FROM
    emp
WHERE
    ( job, sal ) IN (
        SELECT
            job, MIN(sal)
        FROM
            emp
        GROUP BY
            job
    );

INSERT INTO emp (
    empno,
    ename,
    job,
    sal
) VALUES (
    9999,
    'test',
    'CLERK',
    1250
);

-- 10번 부서 사원들의 업무와 동일한 직원들 검색
SELECT
    job
FROM
    emp
WHERE
    deptno = 10;

SELECT
    ename
FROM
    emp
WHERE
    job IN (
        SELECT
            job
        FROM
            emp
        WHERE
            deptno = 10
    );

SELECT
    ename
FROM
    emp
WHERE
    job = ANY (
        SELECT
            job
        FROM
            emp
        WHERE
            deptno = 10
    );

-- 적어도 한명의 사원으로부터 보고를 받을 수 있는 사원의 정보를 사원번호, 이름, 업무를 출력
SELECT
    empno,
    ename,
    job
FROM
    emp
WHERE
    ename IN (
        SELECT
            e2.ename AS 매니저명
        FROM
            emp e1
            LEFT OUTER JOIN emp e2 ON e1.mgr = e2.empno
    );

SELECT
    empno,
    ename,
    job
FROM
    emp e1
WHERE
    EXISTS (
        SELECT
            *
        FROM
            emp e2
        WHERE
            e1.mgr = e2.empno
    );

-- 매니저가 없는 사원 출력 (출력불가)
/*select empno, ename, job
from emp
where ename not in (select e2.ename as 매니저명 from emp e1 left outer join emp e2 on e1.mgr=e2.empno);*/

SELECT
    empno,
    ename,
    job
FROM
    emp e1
WHERE
    NOT EXISTS (
        SELECT
            *
        FROM
            emp e2
        WHERE
            e1.mgr = e2.empno
    );

-------------------------------------------------------------------------------------

CREATE TABLE stat_salary (
    stat_date  DATE NOT NULL, -- 날짜
    dept_no    NUMBER, -- 부서
    emp_count  NUMBER, -- 사원수
    tot_salary NUMBER, -- 급여총액
    avg_salary NUMBER  -- 급여평균
);

desc stat_salary;
select*from stat_salary;

select sysdate,deptno from emp group by deptno;

insert into stat_salary(stat_date,dept_no) select sysdate,deptno from emp group by deptno;

select count(*),sum(sal),round(avg(sal),2) from emp group by deptno;

update stat_salary ss
set (emp_count,tot_salary,avg_salary) 
    = (select count(*),sum(sal),round(avg(sal),2)
    from emp e
    where ss.dept_no = e.deptno
    group by deptno);
    
CREATE TABLE emp_cp as select*from emp;
select*from emp_cp;

-- 부서명이 'SALES'인 사원의 정보 삭제
delete from emp_cp
where deptno = (select deptno from dept where dname like 'SALES');

-- 사원테이블에 존재하는 사원이면 사원의 급여를 10% 인상하고, 존재하지 않는 사원이면 사원테이블에 정보를 입력한다
merge
into emp_cp ec
using emp e
on (ec.ename = e.ename)
when matched then
    update
        set ec.sal = nvl(ec.sal*1.1,0);
    
