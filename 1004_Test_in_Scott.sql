-- 사원명, 급여, 월급(급여/12)를 출력하되 월급은 십단위에서 반올림하여 출력
Select ename,sal,round(sal/12,-2) as weolgub
from emp;

-- 사원명, 급여, 세금(급여의 3.3%)를 원단위 절삭하고 출력
Select ename,sal,trunc(sal*0.033,-1) as TAX
from emp;

-- smith의 정보를 사원번호, 성명, 담당업무(소문자) 출력
Select empno,ename,lower(job) as Job
from emp
where ENAME like 'SMITH';

-- 사원번호, 사원명(첫글자만 대문자), 담당업무(첫글자만 대문자)로 출력
Select empno, initcap (ename) as Name , initcap(job) as Job
from emp;

-- info_tab 에서 이름과 문자 하나 출력
Select name, jumin
from info_tab;

Select name , Substr(jumin,8,1) as Gender
From info_tab;

Select name , substr(jumin,1,2) as Birth
from info_tab;

-- 이름의 첫글자가 ‘K’보다 크고 ‘Y’보다 작은 사원의 정보( 사원번호, 이름, 업무, 급여, 부서번호)를 출력하되 이름순으로 정렬
Select *
from emp
where (substr(ename,1,1) > 'K' and substr(ename,1,1)<'Y')
order by ENAME ASC ;

-- 이름이 5글자 이상인 사원들을 출력
select *
from emp
where length(ename) >= 5;

-- 이름을 15자로 맞추고 글자는 왼쪽에 오른쪽에는 ‘*’로 채운다
Select RPAD(ename,15,'*') as NameStar
from emp;

-- 양쪽 공백을 제거 --
select '-' || trim(' 이순신 ') || '-' as col1, 

'-' || ltrim(' 이순신 ') || '-' as col2, 

'-' || rtrim(' 이순신 ') || '-' as col3 from dual;

-- 시스템상 날짜 출력
Select Sysdate
from dual; -- dual : 가상테이블

-- 급여는 10자로 맞추고 숫자는 오른쪽에 왼쪽엔 ‘-‘로 채운다
Select LPAD(sal,10,'-') as MinusSal
from emp;

-- 급여를 숫자에서 '영일이삼사오육칠팔구' 글자로 대체
Select sal , Translate(sal,'0123456789','영일이삼사오육칠팔구') as SalKOREAN
from emp;

-- 급여의 숫자에서 0을 ‘$’로 바꾸어 출력
Select ename, replace(sal,0,'$') as SalDollar
from emp;

-- ******* 모든 공백 제거 ******--
Select replace('        이       순         신      ',' ','') as Ename
from dual;


-- 현재까지 근무일 수가 많은 사람 순으로 출력
Select ename,hiredate,(sysdate-nvl(hiredate,sysdate)) as 근속일수, ceil(sysdate-nvl(hiredate,sysdate)) as 근속일수치환
from emp
order by Sysdate-hiredate desc nulls last;

-- 현재까지 근무일 수가 몇주 몇일인가를 출력
Select ename,hiredate,trunc((sysdate-nvl(hiredate,sysdate))/7) as 근속주수 ,floor(mod((sysdate-nvl(hiredate,sysdate)),7)) as 근속일수,
trunc(sysdate-add_months(hiredate,months_between(sysdate,hiredate))) as 근속일수VER2
from emp
order by ename asc nulls last;

-- 10번 부서의 사원의 현재까지의 근무 월수를 계산 
Select ename, floor(months_between(sysdate,hiredate)) as 내림근속월수 , ceil(months_between(sysdate,hiredate)) as 올림근속월수
from emp
where deptno = 10
order by ename asc;

-- 현재 날짜에서 3개월 후의 날짜 구하기
select add_months( sysdate, 3 ) as mydate from dual;

-- 현재 날짜에서 돌아오는 '월'요일의 날짜 구하기
select next_day(sysdate,'월') as NextMonday 
from dual;

select next_day(sysdate,2) as NextMonday -- index상 일 부터 카운트 , ex)일 -1,월-2...
from dual;

-- 현재 날짜에서 해당 월의 마지막 날짜 구하기
select last_day(sysdate) as LastDay
from dual;

-- 입사일자에서 입사 년도를 출력
Select ename,hiredate, To_char(hiredate,'YYYY') as 입사년도
from emp;

-- 입사일자를 '1999년 1월 1일' 형식으로 출력
Select ename,hiredate,to_char(hiredate,'YYYY"년" MM"월" DD"일"' ) as 입사일자
from emp;

-- 1981년도에 입사한 사원 검색
Select ename,hiredate,to_char(hiredate,'YYYY') as 입사년도
from emp
where to_char(hiredate,'YYYY') like '1981';

-- 5월에 입사한 사원 검색
Select ename,hiredate,to_char(hiredate,'month') as 입사월
from emp
where to_char(hiredate,'mm') = 05;

-- 81년 2월에 입사한 사원 검색
Select ename, hiredate
from emp
where to_char(hiredate,'YYYYMM')='198102';

--81년에 입사하지 않은 사원 검색
Select ename, hiredate
from emp
where not to_char(hiredate,'yyyy') ='1981';

-- 81년 하반기에 입사한 사원 검색
Select ename, hiredate
from emp
where to_char(hiredate,'yyyymm') >'198106' and to_char(hiredate,'yyyymm') <= '198112';

Select ename, hiredate
from emp
where to_char(hiredate,'yyyymm') between '198107' and '198112'
order by to_char(hiredate,'yyyymm') desc;

-- 급여 앞에 $를 삽입하고 3자리 마다 ,를 출력
Select ename,sal,to_char(sal,'$999,999,999,999,999') as dollar
from emp;

-- 주민번호에서 성별 구하기
Select decode(substr(jumin,8,1),'1','남자','3','남자','여자') as 성별
from info_tab;

Select Case substr(jumin,8,1)
when '1' then '남자'
when '3' then '남자'
else '여자'
end as 성별
from info_tab;

-- 부서 번호가 10이면 영업부, 20이면 관리부, 30이면 IT부 그 외는 기술부로 출력
Select ename, Case substr(to_char(deptno),1,2)
                    when '10' then '영업부'
                    when '20' then '관리부'
                    when '30' then 'IT부'
                    else '기술부'
                    end as 부서명
from emp;

Select ename , 
    decode (deptno,10,'영업부',20,'관리부',30,'IT부','기술부') as 부서명
from emp;


Select ename, Case(deptno)
                when 10 then '영업부'
                when 20 then '관리부'
                when 30 then 'IT부'
                else '기술부'
                end as 부서명
from emp;

Select ename , 
    decode (substr(to_char(deptno),1,2),'10','영업부','20','관리부','30','IT부','기술부') as 부서명
from emp;

-- 업무(job)이 analyst이면 급여 증가가 10%이고 clerk이면 15%, manager이면 20%인 경우 사원번호, 사원명, 업무, 급여, 증가한 급여를 출력
Select empno,ename,job,sal,Case (job)
                            when upper('analyst') then sal*1.1
                            when upper('clerk') then sal*1.15
                            when upper('manager') then sal*1.2
                            ELSE SAL*1.0
                            end as 급여증가
from emp
order by empno asc;

Select empno, ename, job, sal,
    decode(job,'ANALYST',SAL*1.1,'CLERK',SAL*1.15,'MANAGER',SAL*1.2,SAL*1.0) AS 급여증가
FROM EMP
ORDER BY EMPNO ASC;

select all job from emp;

select distinct job from emp;

select empno, ename, job from emp;

select ROWNUM,empno,ename job from emp where rownum<=5;

-- 업무가 ‘SALESMAN’인 사람들의 월급의 평균, 총합, 최소값, 최대값을 구하기
select AVG(sal) as AVG , sum(sal) as Sum, Min(sal) as Min , Max(sal) as Max
from emp
where job like 'SALESMAN';

Insert into emp(empno,ename,job)
values (9001,'홍길동','SALESMAN'); -- NULL값이 있어도 계산 가능

-- 커미션(COMM)을 받는 사람들의 수는
select count(comm) as get_commision
from emp
where comm!=0;
--where comm not 0;

-- 부서별로 인원수, 평균급여, 최저급여, 최고급여, 급여의 합을 구하기
select deptno, count(*) as 인원수, ceil(avg(sal)) as 평균급여 , min(sal) as 최저급여 ,max(sal) as 최고급여 , sum(sal) as 급여합계
from emp 
group by deptno;

-- 부서별로 인원수, 평균급여, 최저급여, 최고급여, 급여의 합을 구하기 ( 부서별 급여의 합이 높은 순으로)
select deptno, count(*) as 인원수, ceil(avg(sal)) as 평균급여 , min(sal) as 최저급여 ,max(sal) as 최고급여 , sum(sal) as 급여합계
from emp 
group by deptno
order by max(sal) desc;

-- 부서별 업무별 그룹하여 부서번호, 업무, 인원수, 급여의 평균, 급여의 합을 구하기
SELECT DEPTNO,JOB,COUNT(ENAME) AS 인원수,AVG(SAL) AS AVG,SUM(SAL) AS SUM
FROM EMP
GROUP BY DEPTNO,JOB;


-- 최대 급여가 2900 이상인 부서에 대해 부서번호, 평균 급여, 급여의 합을 출력
select deptno, ceil(avg(sal)) as 평균급여, sum(sal) as 급여합계
from emp 
group by deptno
having max(sal) >= 2900;

-- 업무별 급여의 평균이 3000이상인 업무에 대해 업무명, 평균 급여, 급여의 합을 출력
SELECT JOB, AVG(SAL) AS 평균급여, SUM(SAL) AS 급여합계
FROM EMP
GROUP BY JOB
HAVING AVG(SAL) >= 3000;


-- 전체 합계 급여가 5000를 초과하는 각 업무에 대해서 업무와 급여 합계를 출력 
-- 단, SALESMAN은 제외하고 급여 합계가 높은 순으로 정렬
Select job, sum(sal) as 급여합계
from emp
WHERE JOB NOT IN 'SALESMAN'
group by job 
having sum(sal) > 5000
order by sum(sal) desc;

-- 업무별 최고 급여와 최소 급여의 차이를 구하라
Select job,(Max(sal) - Min(sal)) as 급여차이
from emp
group by job;

-- 부서 인원이 4명 보다 많은 부서의 부서번호, 인원수, 급여의 합을 출력
Select deptno, count(DEPTNO) as 인원수, sum(sal) as 급여합계
from emp
group by deptno
having count(DEPTNO)>4;


