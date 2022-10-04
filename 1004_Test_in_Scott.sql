-- �����, �޿�, ����(�޿�/12)�� ����ϵ� ������ �ʴ������� �ݿø��Ͽ� ���
Select ename,sal,round(sal/12,-2) as weolgub
from emp;

-- �����, �޿�, ����(�޿��� 3.3%)�� ������ �����ϰ� ���
Select ename,sal,trunc(sal*0.033,-1) as TAX
from emp;

-- smith�� ������ �����ȣ, ����, ������(�ҹ���) ���
Select empno,ename,lower(job) as Job
from emp
where ENAME like 'SMITH';

-- �����ȣ, �����(ù���ڸ� �빮��), ������(ù���ڸ� �빮��)�� ���
Select empno, initcap (ename) as Name , initcap(job) as Job
from emp;

-- info_tab ���� �̸��� ���� �ϳ� ���
Select name, jumin
from info_tab;

Select name , Substr(jumin,8,1) as Gender
From info_tab;

Select name , substr(jumin,1,2) as Birth
from info_tab;

-- �̸��� ù���ڰ� ��K������ ũ�� ��Y������ ���� ����� ����( �����ȣ, �̸�, ����, �޿�, �μ���ȣ)�� ����ϵ� �̸������� ����
Select *
from emp
where (substr(ename,1,1) > 'K' and substr(ename,1,1)<'Y')
order by ENAME ASC ;

-- �̸��� 5���� �̻��� ������� ���
select *
from emp
where length(ename) >= 5;

-- �̸��� 15�ڷ� ���߰� ���ڴ� ���ʿ� �����ʿ��� ��*���� ä���
Select RPAD(ename,15,'*') as NameStar
from emp;

-- ���� ������ ���� --
select '-' || trim(' �̼��� ') || '-' as col1, 

'-' || ltrim(' �̼��� ') || '-' as col2, 

'-' || rtrim(' �̼��� ') || '-' as col3 from dual;

-- �ý��ۻ� ��¥ ���
Select Sysdate
from dual; -- dual : �������̺�

-- �޿��� 10�ڷ� ���߰� ���ڴ� �����ʿ� ���ʿ� ��-���� ä���
Select LPAD(sal,10,'-') as MinusSal
from emp;

-- �޿��� ���ڿ��� '�����̻�����ĥ�ȱ�' ���ڷ� ��ü
Select sal , Translate(sal,'0123456789','�����̻�����ĥ�ȱ�') as SalKOREAN
from emp;

-- �޿��� ���ڿ��� 0�� ��$���� �ٲپ� ���
Select ename, replace(sal,0,'$') as SalDollar
from emp;

-- ******* ��� ���� ���� ******--
Select replace('        ��       ��         ��      ',' ','') as Ename
from dual;


-- ������� �ٹ��� ���� ���� ��� ������ ���
Select ename,hiredate,(sysdate-nvl(hiredate,sysdate)) as �ټ��ϼ�, ceil(sysdate-nvl(hiredate,sysdate)) as �ټ��ϼ�ġȯ
from emp
order by Sysdate-hiredate desc nulls last;

-- ������� �ٹ��� ���� ���� �����ΰ��� ���
Select ename,hiredate,trunc((sysdate-nvl(hiredate,sysdate))/7) as �ټ��ּ� ,floor(mod((sysdate-nvl(hiredate,sysdate)),7)) as �ټ��ϼ�,
trunc(sysdate-add_months(hiredate,months_between(sysdate,hiredate))) as �ټ��ϼ�VER2
from emp
order by ename asc nulls last;

-- 10�� �μ��� ����� ��������� �ٹ� ������ ��� 
Select ename, floor(months_between(sysdate,hiredate)) as �����ټӿ��� , ceil(months_between(sysdate,hiredate)) as �ø��ټӿ���
from emp
where deptno = 10
order by ename asc;

-- ���� ��¥���� 3���� ���� ��¥ ���ϱ�
select add_months( sysdate, 3 ) as mydate from dual;

-- ���� ��¥���� ���ƿ��� '��'������ ��¥ ���ϱ�
select next_day(sysdate,'��') as NextMonday 
from dual;

select next_day(sysdate,2) as NextMonday -- index�� �� ���� ī��Ʈ , ex)�� -1,��-2...
from dual;

-- ���� ��¥���� �ش� ���� ������ ��¥ ���ϱ�
select last_day(sysdate) as LastDay
from dual;

-- �Ի����ڿ��� �Ի� �⵵�� ���
Select ename,hiredate, To_char(hiredate,'YYYY') as �Ի�⵵
from emp;

-- �Ի����ڸ� '1999�� 1�� 1��' �������� ���
Select ename,hiredate,to_char(hiredate,'YYYY"��" MM"��" DD"��"' ) as �Ի�����
from emp;

-- 1981�⵵�� �Ի��� ��� �˻�
Select ename,hiredate,to_char(hiredate,'YYYY') as �Ի�⵵
from emp
where to_char(hiredate,'YYYY') like '1981';

-- 5���� �Ի��� ��� �˻�
Select ename,hiredate,to_char(hiredate,'month') as �Ի��
from emp
where to_char(hiredate,'mm') = 05;

-- 81�� 2���� �Ի��� ��� �˻�
Select ename, hiredate
from emp
where to_char(hiredate,'YYYYMM')='198102';

--81�⿡ �Ի����� ���� ��� �˻�
Select ename, hiredate
from emp
where not to_char(hiredate,'yyyy') ='1981';

-- 81�� �Ϲݱ⿡ �Ի��� ��� �˻�
Select ename, hiredate
from emp
where to_char(hiredate,'yyyymm') >'198106' and to_char(hiredate,'yyyymm') <= '198112';

Select ename, hiredate
from emp
where to_char(hiredate,'yyyymm') between '198107' and '198112'
order by to_char(hiredate,'yyyymm') desc;

-- �޿� �տ� $�� �����ϰ� 3�ڸ� ���� ,�� ���
Select ename,sal,to_char(sal,'$999,999,999,999,999') as dollar
from emp;

-- �ֹι�ȣ���� ���� ���ϱ�
Select decode(substr(jumin,8,1),'1','����','3','����','����') as ����
from info_tab;

Select Case substr(jumin,8,1)
when '1' then '����'
when '3' then '����'
else '����'
end as ����
from info_tab;

-- �μ� ��ȣ�� 10�̸� ������, 20�̸� ������, 30�̸� IT�� �� �ܴ� ����η� ���
Select ename, Case substr(to_char(deptno),1,2)
                    when '10' then '������'
                    when '20' then '������'
                    when '30' then 'IT��'
                    else '�����'
                    end as �μ���
from emp;

Select ename , 
    decode (deptno,10,'������',20,'������',30,'IT��','�����') as �μ���
from emp;


Select ename, Case(deptno)
                when 10 then '������'
                when 20 then '������'
                when 30 then 'IT��'
                else '�����'
                end as �μ���
from emp;

Select ename , 
    decode (substr(to_char(deptno),1,2),'10','������','20','������','30','IT��','�����') as �μ���
from emp;

-- ����(job)�� analyst�̸� �޿� ������ 10%�̰� clerk�̸� 15%, manager�̸� 20%�� ��� �����ȣ, �����, ����, �޿�, ������ �޿��� ���
Select empno,ename,job,sal,Case (job)
                            when upper('analyst') then sal*1.1
                            when upper('clerk') then sal*1.15
                            when upper('manager') then sal*1.2
                            ELSE SAL*1.0
                            end as �޿�����
from emp
order by empno asc;

Select empno, ename, job, sal,
    decode(job,'ANALYST',SAL*1.1,'CLERK',SAL*1.15,'MANAGER',SAL*1.2,SAL*1.0) AS �޿�����
FROM EMP
ORDER BY EMPNO ASC;

select all job from emp;

select distinct job from emp;

select empno, ename, job from emp;

select ROWNUM,empno,ename job from emp where rownum<=5;

-- ������ ��SALESMAN���� ������� ������ ���, ����, �ּҰ�, �ִ밪�� ���ϱ�
select AVG(sal) as AVG , sum(sal) as Sum, Min(sal) as Min , Max(sal) as Max
from emp
where job like 'SALESMAN';

Insert into emp(empno,ename,job)
values (9001,'ȫ�浿','SALESMAN'); -- NULL���� �־ ��� ����

-- Ŀ�̼�(COMM)�� �޴� ������� ����
select count(comm) as get_commision
from emp
where comm!=0;
--where comm not 0;

-- �μ����� �ο���, ��ձ޿�, �����޿�, �ְ�޿�, �޿��� ���� ���ϱ�
select deptno, count(*) as �ο���, ceil(avg(sal)) as ��ձ޿� , min(sal) as �����޿� ,max(sal) as �ְ�޿� , sum(sal) as �޿��հ�
from emp 
group by deptno;

-- �μ����� �ο���, ��ձ޿�, �����޿�, �ְ�޿�, �޿��� ���� ���ϱ� ( �μ��� �޿��� ���� ���� ������)
select deptno, count(*) as �ο���, ceil(avg(sal)) as ��ձ޿� , min(sal) as �����޿� ,max(sal) as �ְ�޿� , sum(sal) as �޿��հ�
from emp 
group by deptno
order by max(sal) desc;

-- �μ��� ������ �׷��Ͽ� �μ���ȣ, ����, �ο���, �޿��� ���, �޿��� ���� ���ϱ�
SELECT DEPTNO,JOB,COUNT(ENAME) AS �ο���,AVG(SAL) AS AVG,SUM(SAL) AS SUM
FROM EMP
GROUP BY DEPTNO,JOB;


-- �ִ� �޿��� 2900 �̻��� �μ��� ���� �μ���ȣ, ��� �޿�, �޿��� ���� ���
select deptno, ceil(avg(sal)) as ��ձ޿�, sum(sal) as �޿��հ�
from emp 
group by deptno
having max(sal) >= 2900;

-- ������ �޿��� ����� 3000�̻��� ������ ���� ������, ��� �޿�, �޿��� ���� ���
SELECT JOB, AVG(SAL) AS ��ձ޿�, SUM(SAL) AS �޿��հ�
FROM EMP
GROUP BY JOB
HAVING AVG(SAL) >= 3000;


-- ��ü �հ� �޿��� 5000�� �ʰ��ϴ� �� ������ ���ؼ� ������ �޿� �հ踦 ��� 
-- ��, SALESMAN�� �����ϰ� �޿� �հ谡 ���� ������ ����
Select job, sum(sal) as �޿��հ�
from emp
WHERE JOB NOT IN 'SALESMAN'
group by job 
having sum(sal) > 5000
order by sum(sal) desc;

-- ������ �ְ� �޿��� �ּ� �޿��� ���̸� ���϶�
Select job,(Max(sal) - Min(sal)) as �޿�����
from emp
group by job;

-- �μ� �ο��� 4�� ���� ���� �μ��� �μ���ȣ, �ο���, �޿��� ���� ���
Select deptno, count(DEPTNO) as �ο���, sum(sal) as �޿��հ�
from emp
group by deptno
having count(DEPTNO)>4;


