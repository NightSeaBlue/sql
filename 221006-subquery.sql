--��� �޿� ���ϱ�

SELECT
    round(AVG(sal))
FROM
    emp;

-- �� ��� �޿����� ���� ��� ���� ��ȸ
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

-- ������ ���� ���� ����� ���� ��ȸ
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

-- ��� �޿����� ���� �ִ� �޿����� ���� ������ �޴� ����� ������ ��ȸ
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

-- join ���·ε� subquery Ȱ�� ����
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

-- ���� ������ ���� 10���� ��� ��� (order by �� ����� ���������� �ݵ�� from�� ��ġ)
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

-- �������� �ּ� �޿��� �޴� ����� ������ �����ȣ, �̸�, ������, �޿��� ���
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

-- 10�� �μ� ������� ������ ������ ������ �˻�
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

-- ��� �Ѹ��� ������κ��� ���� ���� �� �ִ� ����� ������ �����ȣ, �̸�, ������ ���
SELECT
    empno,
    ename,
    job
FROM
    emp
WHERE
    ename IN (
        SELECT
            e2.ename AS �Ŵ�����
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

-- �Ŵ����� ���� ��� ��� (��ºҰ�)
/*select empno, ename, job
from emp
where ename not in (select e2.ename as �Ŵ����� from emp e1 left outer join emp e2 on e1.mgr=e2.empno);*/

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
    stat_date  DATE NOT NULL, -- ��¥
    dept_no    NUMBER, -- �μ�
    emp_count  NUMBER, -- �����
    tot_salary NUMBER, -- �޿��Ѿ�
    avg_salary NUMBER  -- �޿����
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

-- �μ����� 'SALES'�� ����� ���� ����
delete from emp_cp
where deptno = (select deptno from dept where dname like 'SALES');

-- ������̺� �����ϴ� ����̸� ����� �޿��� 10% �λ��ϰ�, �������� �ʴ� ����̸� ������̺� ������ �Է��Ѵ�
merge
into emp_cp ec
using emp e
on (ec.ename = e.ename)
when matched then
    update
        set ec.sal = nvl(ec.sal*1.1,0);
    
