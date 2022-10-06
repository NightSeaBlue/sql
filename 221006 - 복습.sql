--1. 사원명에 ‘L’자가 있는 사원에 대해 이름, 업무, 부서명, 위치를 출력
select e.ename,e.job,d.dname,d.loc
from emp e left outer join dept d
            on e.deptno = d.deptno
where e.ename like '%L%';

select e.ename as ename, e.job as job, d.dname as dname, d.loc as loc
from emp e, dept d
where e.deptno = d.deptno and e.ename like '%L%';

-- 2. 관리자보다 먼저 입사한 사원에 대해 이름, 입사일, 관리자 이름, 관리자 입사일을 출력
select e1.ename as 사원명,e1.hiredate as 사원입사일
        ,e2.ename as 관리자명, e2.hiredate as 관리자입사일
from emp e1 inner join emp e2
            on e1.mgr = e2.empno
where e1.hiredate < e2.hiredate;

select e1.ename as 사원명,e1.hiredate as 사원입사일
        ,e2.ename as 관리자명, e2.hiredate as 관리자입사일
from emp e1, emp e2
where e1.mgr = e2.empno and e1.hiredate < e2.hiredate;

-- 3. 아래의 결과를 출력 ( 관리자가 없는 KING을 포함하여 모든 사원을 출력 )
select e1.empno as 사번 , e1.ename as 사원명, e1.mgr as 매니저사번, e2.ename as 매니저명
from emp e1 left outer join emp e2
            on e1.mgr = e2.empno
order by e1.empno asc;

select e1.empno as 사번 , e1.ename as 사원명, e1.mgr as 매니저사번, e2.ename as 매니저명
from emp e1 , emp e2
where e1.mgr = e2.empno(+)
order by e1.empno asc;

-- nvl은 숫자만 입력가능
