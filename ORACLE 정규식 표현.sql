-- ¿À¶óÅ¬ Á¤±Ô½Ä Ç¥Çö
/*
    ¾Æ·¡¿Í °°ÀÌ Å×ÀÌºíÀ» »ı¼ºÇÏ°í ·¹ÄÚµå¸¦ ÀÔ·ÂÇÑ ÈÄ
    REGEXP_LIKE  ¿Ü¿¡ REGEXP_REPALCE, REGEXP_INSTR, REGEXP_SUBSTR, REGEXP_COUNT ÇÔ¼öµµ ÀÖÀ½
    ±×·¯³ª ¾Æ·¡ÀÇ ¿¹¹®Àº regexp_like ÇÔ¼ö¸¦ ÀÌ¿ëÇÏ¿©µµ ¹«¹æÇÔ.
*/

-- Å×ÀÌºí »ı¼º
CREATE TABLE reg_tab( text varchar2(20) );
-- ·¹ÄÚµå ÀÔ·Â
INSERT INTO reg_tab VALUES('TIGER');
INSERT INTO reg_tab VALUES('TIGGER');
INSERT INTO reg_tab VALUES('elephant');
INSERT INTO reg_tab VALUES('tiger');
INSERT INTO reg_tab VALUES('tiger2');
INSERT INTO reg_tab VALUES('tiger3');
INSERT INTO reg_tab VALUES('doggy');
INSERT INTO reg_tab VALUES('5doggy');
INSERT INTO reg_tab VALUES('DOG');
INSERT INTO reg_tab VALUES('DOG2');
INSERT INTO reg_tab VALUES('°³');
INSERT INTO reg_tab VALUES('cat');
INSERT INTO reg_tab VALUES('catty');
INSERT INTO reg_tab VALUES('9catty');
INSERT INTO reg_tab VALUES('catwoman');
INSERT INTO reg_tab VALUES('°í¾çÀÌ');
INSERT INTO reg_tab VALUES('BAT');
INSERT INTO reg_tab VALUES('BATMAN');
INSERT INTO reg_tab VALUES('BATGIRL'); 
INSERT INTO reg_tab VALUES('0BATGIRL'); 
INSERT INTO reg_tab VALUES('¹ÚÁã');
-- Ä¿¹Ô
commit;
-- ¹®Á¦
-- 1.  text ÄÃ·³ÀÇ ¹®ÀÚ¿­¿¡¼­ 't'·Î ½ÃÀÛÇÏ´Â µ¥ÀÌÅÍ °Ë»ö
select *
from reg_tab
where regexp_like(text,'^t');

select *
from reg_tab
where text like 't%';

-- 2.  text ÄÃ·³ÀÇ ¹®ÀÚ¿­¿¡¼­ 't'·Î ³¡³ª´Â µ¥ÀÌÅÍ °Ë»ö
SELECT *
from reg_tab
where regexp_like(text,'$t');

SELECT *
FROM reg_tab
where text like '%t';

-- 3. Ã¹¹øÂ° 't'·Î ½ÃÀÛÇÏ¿© 5¹øÂ° 'r'ÀÌ ÀÖ´Â µ¥ÀÌÅÍ °Ë»ö
select *
from reg_tab
where text like 't%' and text like '____r%';

select *
from reg_tab
where regexp_like(text,'^t...r');

-- 4. ¼ıÀÚ·Î ³¡³ª´Â µ¥ÀÌÅÍ °Ë»ö
select *
from reg_tab
where regexp_like(text,'[0-9]$');

-- 5. ¼ıÀÚ·Î ½ÃÀÛÇÏ´Â µ¥ÀÌÅ¸ °Ë»ö
select *
from reg_tab
where regexp_like(text,'^[0-9]');

-- 6. ¼ıÀÚ°¡ ¾Æ´Ñ ¹®ÀÚ·Î ½ÃÀÛÇÏ´Â µ¥ÀÌÅÍ °Ë»ö
select *
from reg_tab
where not regexp_like(text,'^[0-9]');

select *
from reg_tab
where regexp_like(text,'^[^[0-9]');

-- 7. ´ë¹®ÀÚ·Î ½ÃÀÛÇÏ´Â µ¥ÀÌÅÍ °Ë»ö
select *
from reg_tab
where regexp_like(text,'^[A-Z]');

-- 8. ¼Ò¹®ÀÚ ¿ÜÀÇ ¹®ÀÚ·Î ½ÃÀÛÇÏ´Â µ¥ÀÌÅÍ °Ë»ö
select *
from reg_tab
where not regexp_like(text,'^[a-z]');

select *
from reg_tab
where regexp_like(text,'^[^[a-z]');


-- 9. ÇÑ±Û·Î ½ÃÀÛÇÏ´Â µ¥ÀÌÅÍ °Ë»ö
select *
from reg_tab
where regexp_like(text,'^[°¡-ÆR]');

-- 10. µ¥ÀÌÅÍ Áß 'gg'³ª 'GG'°¡ µé¾îÀÖ´Â µ¥ÀÌÅÍ °Ë»ö
select *
from reg_tab
where regexp_like(text,'gg|GG');