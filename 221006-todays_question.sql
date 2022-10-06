-- ȸ�� ���̺�
create table ex_member(
id varchar2(10), -- ���̵�
pass varchar2(10), -- �н�����
name varchar2(20), -- �̸�
tel varchar2(20), -- ��ȭ��ȣ
addr varchar2(100), -- �ּ�
CONSTRAINTS pk_ex_member_id PRIMARY KEY (id)
);

-- ��ǰ ���̺�
create table ex_good(
gno varchar2(10), -- ��ǰ��ȣ
gname varchar(30), -- ��ǰ��
gdetail varchar2(300), -- �󼼼���
price number,    -- ����
CONSTRAINTS pk_ex_good_gno PRIMARY KEY (gno)
); 

-- �ֹ� ���̺�
create table ex_order (
    ono number, -- ��ȣ
    orderno varchar2(20), -- �ֹ���ȣ
    gno varchar2(10), -- ��ǰ��ȣ
    id varchar2(10), -- ȸ�� ���̵�
    count number, -- ����
    status varchar2(10), -- ��ۻ���
    Constraints pk_ex_order_ono PRIMARY KEY (ono),
    CONSTRAINTS fk_ex_order_gno FOREIGN KEY (gno) REFERENCES ex_good(gno),
    CONSTRAINTS fk_ex_order_id  FOREIGN KEY (id) REFERENCES ex_member(id)
);


desc ex_good;
desc ex_member;
desc ex_order;

--------------------------------------------------------------------------------

-- ȸ�� ���̺� ����Ÿ �Է�
insert into ex_member(id, pass, name, tel, addr )
values('kim', '1111', '��浿', '02-222-2222','���� ������ �̻۵�');

insert into ex_member(id, pass, name, tel, addr )
values('park', '1111', '�ڱ浿', '03-333-3333','��õ ������ �̻۵�');

insert into ex_member(id, pass, name, tel, addr )
values('meng', '1111', '�ͱ浿', '04-444-4444','��� ������ �̻۵�');

commit;

-- ��ǰ ���̺� ����Ÿ �Է�

insert into ex_good( gno, gname, gdetail, price )
values('1001', '�Ӹ���', '���� ��� �Ӹ���', 200 );

insert into ex_good( gno, gname, gdetail, price )
values('2002', '������-A', '������� ������ �޸��� ������', 10000 );

insert into ex_good( gno, gname, gdetail, price )
values('2010', '������-B', '���� ������� ������ �����ϰ� �޸��ٴ� ������', 20000 );

insert into ex_good( gno, gname, gdetail, price )
values('3333', '�ڵ������̽�', '�ΰ� �����ϴ� �ڵ��� ���̽�', 1500 );

commit;

-- �ֹ� ���̺� ����Ÿ �˻�
insert into ex_order( ono, orderno, gno, id, count, status )
values( 1, '20161212', '1001', 'park', 1, '��ۿϷ�'); -- �ѱ� ũ�Ⱑ 3����Ʈ���� ��ۿϷ� �Է� �Ұ�

insert into ex_order( ono, orderno, gno, id, count, status )
values( 2, '20161212', '2010', 'park', 1, '�����');

insert into ex_order( ono, orderno, gno, id, count, status )
values( 3, '20161111', '1001', 'kim', 2, '�ֹ�');

insert into ex_order( ono, orderno, gno, id, count, status )
values( 4, '20161111', '3333', 'kim', 3, '�ֹ�'); -- orderno �ߺ�

insert into ex_order( ono, orderno, gno, id, count, status )
values( 5, '20163333', '1001', 'park', 3, '�ֹ�');

insert into ex_order( ono, orderno, gno, id, count, status )
values( 6, '20163333', '2010', 'park', 1, '�����');   -- orderno �ߺ�

insert into ex_order( ono, orderno, gno, id, count, status )
values( 7, '20163333', '2002', 'park', 2, '�ֹ�');        -- orderno �ߺ�

insert into ex_order( ono, orderno, gno, id, count, status )
values( 8, '20165050', '1001', 'meng', 1, '�����');

commit;

--1. ������� ��ǰ�� ���� ������ ���
select *
from ex_good
where gno in (select gno from ex_order where status like '�����');

-- 2. �ֹ� ���� ��ǰ ������ �� ���� ���
select *
from ex_order o left outer join ex_member e
                on o.id = e.id
                left outer join ex_good g
                on o.gno = g.gno
where status like '�ֹ�';


-- 3. �ֹ� ���� �� ����(���̵�) �� �ֹ��� ��ǰ�� �ѱݾ��� ���
select e.id, sum(g.price*e.count) as �ѱݾ�
from ex_order e left outer join ex_good g
                on e.gno = g.gno
group by e.id,e.orderno;                
                
-- 4. 3���� �ֹ� ������ ù��° ��ǰ�� �� �� ���� ��� (���߿� Ǯ��)
select e.orderno, g.gname||' �� '||(e.count -1)||'��' as �ֹ�����
   

select orderno, count(orderno),min(gno) from ex_order group by orderno;

select e.orderno, g.gname||' �� '||(e.count -1)||'��' as �ֹ�����
from ex_order e left outer join ex_good g
                on e.gno = g.gno

select e.orderno, g.gname||' �� '||(e.count -1)||'��' as �ֹ�����
from (select orderno, count(orderno),min(gno) from ex_order group by orderno) e
        ,ex_good g
where e.gno = g.gno;

-- 4�� ����
SELECT E.ORDERNO, G.GNAME ||' ��'||(E.COUNT-1)||'��' GOOD
FROM (SELECT ORDERNO, MIN(GNO) GNO, COUNT(ORDERNO) COUNT
FROM EX_ORDER GROUP BY ORDERNO) E, EX_GOOD G
WHERE E.GNO=G.GNO;

                
