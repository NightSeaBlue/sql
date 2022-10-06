-- 회원 테이블
create table ex_member(
id varchar2(10), -- 아이디
pass varchar2(10), -- 패스워드
name varchar2(20), -- 이름
tel varchar2(20), -- 전화번호
addr varchar2(100), -- 주소
CONSTRAINTS pk_ex_member_id PRIMARY KEY (id)
);

-- 상품 테이블
create table ex_good(
gno varchar2(10), -- 상품번호
gname varchar(30), -- 상품명
gdetail varchar2(300), -- 상세설명
price number,    -- 가격
CONSTRAINTS pk_ex_good_gno PRIMARY KEY (gno)
); 

-- 주문 테이블
create table ex_order (
    ono number, -- 번호
    orderno varchar2(20), -- 주문번호
    gno varchar2(10), -- 상품번호
    id varchar2(10), -- 회원 아이디
    count number, -- 갯수
    status varchar2(10), -- 배송상태
    Constraints pk_ex_order_ono PRIMARY KEY (ono),
    CONSTRAINTS fk_ex_order_gno FOREIGN KEY (gno) REFERENCES ex_good(gno),
    CONSTRAINTS fk_ex_order_id  FOREIGN KEY (id) REFERENCES ex_member(id)
);


desc ex_good;
desc ex_member;
desc ex_order;

--------------------------------------------------------------------------------

-- 회원 테이블 데이타 입력
insert into ex_member(id, pass, name, tel, addr )
values('kim', '1111', '김길동', '02-222-2222','서울 멋지구 이쁜동');

insert into ex_member(id, pass, name, tel, addr )
values('park', '1111', '박길동', '03-333-3333','인천 멋지구 이쁜동');

insert into ex_member(id, pass, name, tel, addr )
values('meng', '1111', '맹길동', '04-444-4444','경기 멋지구 이쁜동');

commit;

-- 상품 테이블 데이타 입력

insert into ex_good( gno, gname, gdetail, price )
values('1001', '머리끈', '아주 비싼 머리끈', 200 );

insert into ex_good( gno, gname, gdetail, price )
values('2002', '자전거-A', '비싸지만 빠르게 달리는 자전거', 10000 );

insert into ex_good( gno, gname, gdetail, price )
values('2010', '자전거-B', '아주 비싸지만 느리고 안전하게 달린다는 자전거', 20000 );

insert into ex_good( gno, gname, gdetail, price )
values('3333', '핸드폰케이스', '싸고 유행하는 핸드폰 케이스', 1500 );

commit;

-- 주문 테이블 데이타 검색
insert into ex_order( ono, orderno, gno, id, count, status )
values( 1, '20161212', '1001', 'park', 1, '배송완료'); -- 한글 크기가 3바이트여서 배송완료 입력 불가

insert into ex_order( ono, orderno, gno, id, count, status )
values( 2, '20161212', '2010', 'park', 1, '배송중');

insert into ex_order( ono, orderno, gno, id, count, status )
values( 3, '20161111', '1001', 'kim', 2, '주문');

insert into ex_order( ono, orderno, gno, id, count, status )
values( 4, '20161111', '3333', 'kim', 3, '주문'); -- orderno 중복

insert into ex_order( ono, orderno, gno, id, count, status )
values( 5, '20163333', '1001', 'park', 3, '주문');

insert into ex_order( ono, orderno, gno, id, count, status )
values( 6, '20163333', '2010', 'park', 1, '배송중');   -- orderno 중복

insert into ex_order( ono, orderno, gno, id, count, status )
values( 7, '20163333', '2002', 'park', 2, '주문');        -- orderno 중복

insert into ex_order( ono, orderno, gno, id, count, status )
values( 8, '20165050', '1001', 'meng', 1, '배송중');

commit;

--1. 배송중인 상품에 대한 내용을 출력
select *
from ex_good
where gno in (select gno from ex_order where status like '배송중');

-- 2. 주문 들어온 상품 내역과 고객 정보 출력
select *
from ex_order o left outer join ex_member e
                on o.id = e.id
                left outer join ex_good g
                on o.gno = g.gno
where status like '주문';


-- 3. 주문 별로 고객 정보(아이디) 와 주문한 상품의 총금액을 출력
select e.id, sum(g.price*e.count) as 총금액
from ex_order e left outer join ex_good g
                on e.gno = g.gno
group by e.id,e.orderno;                
                
-- 4. 3번에 주문 내역을 첫번째 상품명 외 몇 개로 출력 (나중에 풀기)
select e.orderno, g.gname||' 외 '||(e.count -1)||'개' as 주문내역
   

select orderno, count(orderno),min(gno) from ex_order group by orderno;

select e.orderno, g.gname||' 외 '||(e.count -1)||'개' as 주문내역
from ex_order e left outer join ex_good g
                on e.gno = g.gno

select e.orderno, g.gname||' 외 '||(e.count -1)||'개' as 주문내역
from (select orderno, count(orderno),min(gno) from ex_order group by orderno) e
        ,ex_good g
where e.gno = g.gno;

-- 4번 정답
SELECT E.ORDERNO, G.GNAME ||' 외'||(E.COUNT-1)||'개' GOOD
FROM (SELECT ORDERNO, MIN(GNO) GNO, COUNT(ORDERNO) COUNT
FROM EX_ORDER GROUP BY ORDERNO) E, EX_GOOD G
WHERE E.GNO=G.GNO;

                
