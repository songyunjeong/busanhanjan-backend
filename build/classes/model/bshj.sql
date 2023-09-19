--
-- Copyright (c) Status Code 200 Corporation 2023.  All Rights Reserved.
--
--  NAME
--    busanhanjan
--    bshj.sql
--
--  USAGE
--       SQL> START bshj.sql
--
--  @c:\oraclexe\bshj

SET TERMOUT ON
PROMPT 부산한잔의 테이블을 생성합니다. Please wait.
SET TERMOUT OFF

DROP TABLE PUB;
DROP TABLE ALCOHOL;
DROP TABLE USER_INFO;

ALTER SESSION SET NLS_DATE_FORMAT = 'DD-MON-YYYY';
ALTER SESSION SET NLS_LANGUAGE = 'AMERICAN';

-- PUB 테이블 생성

CREATE TABLE pub (
    pno NUMBER(7) PRIMARY KEY,
    pname VARCHAR2(45) NOT NULL,
    menu VARCHAR2(45) NOT NULL,
    alcohol VARCHAR2(45),
    category VARCHAR2(15),
    place VARCHAR2(120),
    tel VARCHAR2(45) UNIQUE,
    star NUMBER(4,2),
    plike NUMBER(4),
    acheck NUMBER(1),
    homepage VARCHAR2(255),
    link VARCHAR2(255)
);

-- PUB COLUMN SIZE
set linesize 350
set pagesize 50

col pno format 9999
col pname format a25
col menu format a25
col alcohol format a20
col place format a50
col tel format a16
col plike format 9999
col star format 999.99
col category format a10
col link format a45

-- PUB 샘플 데이터

INSERT INTO pub (pno, pname, menu, alcohol, category, place, tel, star, plike, acheck, homepage, link)
VALUES
(1, '몰틀리', '치킨, 피자', '크림생맥주', '수입맥주', '부산 금정구 금정로219번길 27 1층', '0507-1419-8823', 4.53, 55, 1, NULL, NULL);
INSERT INTO pub (pno, pname, menu, alcohol, category, place, tel, star, plike, acheck, homepage, link)
VALUES
(2, '호맥', '호떡', '생맥주', '수입맥주', '부산 금정구 중앙대로1959번길 55', '051-912-4445', 4.59, 171, 1, 'http://www.ho-mac.com/', NULL);
INSERT INTO pub (pno, pname, menu, alcohol, category, place, tel, star, plike, acheck, homepage, link)
VALUES
(3, '쉼, 어묵 그리고 한잔 술', '어묵탕', '하이볼', '칵테일', '부산 금정구 금정로219번길 16', '051-1899-8148', 4.5, 16, 1, 'https://www.instagram.com/suimeomuk_guseo/', NULL);
INSERT INTO pub (pno, pname, menu, alcohol, category, place, tel, star, plike, acheck, homepage, link)
VALUES
(4, '역전할머니맥주', '치즈라볶이, 옛날통닭', '살얼음 생맥주', '수입맥주', '부산 금정구 금정로231번길 29', '0507-1339-1713', 4.7, 85, 1, 'https://blog.naver.com/bomsworld_/222118580525', NULL);
INSERT INTO pub (pno, pname, menu, alcohol, category, place, tel, star, plike, acheck, homepage, link)
VALUES
(5, '옥수관', '곰탕, 육회비빔밥', '일품진로', '일반소주', '부산 금정구 금강로 380번길 38 1층', '051-513-5999', 4.58, 24, 1, NULL, NULL);
INSERT INTO pub (pno, pname, menu, alcohol, category, place, tel, star, plike, acheck, homepage, link)
VALUES
(6, '해리의 집', '고급생삼겹', '더덕하이볼', '칵테일', '부산 금정구 금정로219번길 14', '051-581-5586', 4.4, 6, 1, NULL, NULL);
INSERT INTO pub (pno, pname, menu, alcohol, category, place, tel, star, plike, acheck, homepage, link)
VALUES
(7, '모티', '위스키', 'glenfiddich', '위스키', '부산 동구 망양로 669', '051-469-8253', 4.5, 58, 1, NULL, NULL);
INSERT INTO pub (pno, pname, menu, alcohol, category, place, tel, star, plike, acheck, homepage, link)
VALUES
(8, '초량불백', '불백정식', '대선, 참이슬', '일반소주', '부산 동구 초량로 36', '051-464-0454', 4.2, 17, 1, NULL, NULL);
INSERT INTO pub (pno, pname, menu, alcohol, category, place, tel, star, plike, acheck, homepage, link)
VALUES
(9, '우리돼지국밥', '돼지국밥', '참이슬', '일반소주', '부산 동구 초량로 27-1', '051-468-5623', 3.8, 46, 1, NULL, NULL);
INSERT INTO pub (pno, pname, menu, alcohol, category, place, tel, star, plike, acheck, homepage, link)
VALUES
(10, '서울깍두기', '곰탕, 갈비탕', '시원', '일반소주', '부산 동구 중앙대로226번길 3-2', '051-465-7187', 3.5, 1, 1, NULL, NULL);
INSERT INTO pub (pno, pname, menu, alcohol, category, place, tel, star, plike, acheck, homepage, link)
VALUES
(11, '양지아구찜', '아구찜', '참이슬', '일반소주', '부산 동구 초량로 5-1', '0507-1406-5459', 4.73, 422, 1, NULL, NULL);
INSERT INTO pub (pno, pname, menu, alcohol, category, place, tel, star, plike, acheck, homepage, link)
VALUES
(12, '몽상가들', '버터문어구이', '와인', '과실주', '부산 중구 광복로18번길 6-1 파란집', '051-243-1011', 3.9, 23, 1, NULL, NULL);


-- ALCOHOL 테이블 생성

CREATE TABLE alcohol (
    ano NUMBER(7) PRIMARY KEY,
    category VARCHAR2(15) NOT NULL,
    aname VARCHAR2(45) NOT NULL,
    degree NUMBER(2) CHECK (degree >= 0 AND degree <= 100),
    maker VARCHAR2(45),
    adate DATE,
    price NUMBER(8) CHECK (price >= 0 AND price <= 99999999),
    homepage VARCHAR2(255),
    link VARCHAR2(255)
);

-- ALCOHOL COLUMN SIZE
set linesize 350
set pagesize 50

col ano format 9999
col category format a10
col aname format a20
col degree format 99
col maker format a17
col rdate format a10
col price format 99999999
col homepage format a60
col link format a45

-- ALCOHOL 샘플 데이터

INSERT INTO alcohol (ano, category, aname, degree, maker, adate, price, homepage, link)
VALUES
(1, '탁주', '삼해주', 15, '선인양조', NULL, 30000, 'https://smartstore.naver.com/suninbrew/', NULL);
INSERT INTO alcohol (ano, category, aname, degree, maker, adate, price, homepage, link)
VALUES
(2, '약주,청주', '소성주', 6, '인천탁주', NULL, 1300, 'https://sosungju.modoo.at/', NULL);
INSERT INTO alcohol (ano, category, aname, degree, maker, adate, price, homepage, link)
VALUES
(3, '과실주', '감귤주', 10, '시트러스', NULL, 8200, 'https://www.ehondiju.com/', NULL);
INSERT INTO alcohol (ano, category, aname, degree, maker, adate, price, homepage, link)
VALUES
(4, '증류주', '양촌 감 보드카', 32, '양촌감', NULL, 17000, NULL, NULL);
INSERT INTO alcohol (ano, category, aname, degree, maker, adate, price, homepage, link)
VALUES
(5, '와인', '복숭아와인', 12, '솔티마을', NULL, 13500, 'https://smartstore.naver.com/solti', NULL);
INSERT INTO alcohol (ano, category, aname, degree, maker, adate, price, homepage, link)
VALUES
(6, '리큐르', '블링블링 바다별', 15, '영덕주조', NULL, 22500, 'https://ydjujo.co.kr/new/index.php', NULL);
INSERT INTO alcohol (ano, category, aname, degree, maker, adate, price, homepage, link)
VALUES
(7, '과실주', '오르또', 13.5, '오르또와이너리', NULL, 36000, 'https://xn--961b87dnxp.kr/', NULL);
INSERT INTO alcohol (ano, category, aname, degree, maker, adate, price, homepage, link)
VALUES
(8, '과실주', '뷰레떼라이트스파클링', 8, '애플린영농조합', NULL, 25000, 'https://xn--sy2bt7s5tm.kr/', NULL);
INSERT INTO alcohol (ano, category, aname, degree, maker, adate, price, homepage, link)
VALUES
(9, '과실주', '머루와인', 12, '덕유양조', NULL, 19800, 'https://www.enuri.com/detail.jsp?modelno=20054191', NULL);
INSERT INTO alcohol (ano, category, aname, degree, maker, adate, price, homepage, link)
VALUES
(10, '과실주', '달1614', 12, '덕유양조', NULL, 30000, NULL, NULL);
INSERT INTO alcohol (ano, category, aname, degree, maker, adate, price, homepage, link)
VALUES
(11, '과실주', '추시감와인', 12.5, '양촌감와이너리', NULL, 15000, 'https://smartstore.naver.com/choosi/products/4433141484', NULL);
INSERT INTO alcohol (ano, category, aname, degree, maker, adate, price, homepage, link)
VALUES
(12, '과실주', '레인보우', 12, '도란원', NULL, 22000, NULL, NULL);
INSERT INTO alcohol (ano, category, aname, degree, maker, adate, price, homepage, link)
VALUES
(13, '과실주', '애플린', 12, '반딧불사과와인', NULL, 25000, 'https://xn--sy2bt7s5tm.kr/', NULL);
INSERT INTO alcohol (ano, category, aname, degree, maker, adate, price, homepage, link)
VALUES
(14, '과실주', '딸기스파클링와인', 12, '해미읍성딸기와인', NULL, 31500, 'https://www.sooldamhwa.com/damhwaMarket/detail/1360', NULL);
INSERT INTO alcohol (ano, category, aname, degree, maker, adate, price, homepage, link)
VALUES
(15, '과실주', '애플블랑', 12, '예산사과와인', NULL, 53900, NULL, NULL);


--USER_INFO 테이블 생성

CREATE TABLE user_info (	
	username	varchar2(15),
	id	varchar2(15),
	pwd	varchar2(20),
	email	varchar2(25)
);

INSERT INTO user_info values ('송윤정', 'songyunjeong', '6789', 'songyunjeong@naver.com');

col username format a15
col id format a20
col pwd format a20
col email format 45

SET TERMOUT ON
PROMPT Status Code 200
PROMPT 부산한잔
PROMPT
PROMPT 테이블 생성이 완료되었습니다.
PROMPT
PROMPT

-- 샘플테이블 출력 및 조건검색

PROMPT [테이블 - PUB]
select pno, pname, menu, alcohol, category from pub;
PROMPT [테이블 - ALCOHOL]
select ano, category, aname, degree, price, maker, homepage from alcohol;

-- 예시1) 금정구에서 별점 4.5점 이상인 가게를 검색함
PROMPT 예시1) 금정구에서 별점 4.5점 이상인 가게를 검색함

col 평점 format 999.99
col 이름 format a25
col 위치 format a35
col 전화번호 format a16

SELECT star as "평점", pname as "이름",place as "위치", tel as "전화번호"
FROM pub
WHERE place LIKE '%금정%' AND star >= 4.5;
PROMPT 
PROMPT 

-- 예시2) 하이볼을 먹을 수 있는 곳을 검색
PROMPT 예시2) 하이볼을 먹을 수 있는 곳을 검색

col 평점 format 999.99
col 이름 format a25
col 주메뉴 format a15
col 알코올 format a15
col 위치 format a30
col 연락처 format a16

SELECT pname as "이름", menu as "주메뉴", alcohol as "알코올", star as "평점", place as "위치", tel as "연락처"
FROM pub
WHERE alcohol LIKE '%하이볼%';
PROMPT 
PROMPT 

-- 예시3) 와인 중에서 도수가 12 이상인 술을 검색
PROMPT 예시3) 와인 중에서 도수가 12 이상인 술을 검색

col 이름 format a20
col 도수 format 99
col 제조사 format a17
col 가격 format 99999999

SELECT aname as "이름", degree as "도수", maker as "제조사", price as "가격"
FROM alcohol
WHERE category = '과실주' AND degree >= 12;