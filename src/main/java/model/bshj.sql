--
-- Copyright (c) Status Code 200 Corporation 2023.  All Rights Reserved.
--
--  NAME
--    bshj.sql
--
--  USAGE
--       SQL> START bshj.sql
--
--

SET TERMOUT ON
PROMPT 부산한잔의 테이블을 생성합니다. Please wait.
PROMPT .
PROMPT .
PROMPT .
SET TERMOUT OFF

DROP TABLE PUB;
DROP TABLE ALCOHOL;
DROP TABLE BSHJ_USER;
DROP TABLE EVALUATION;
DROP TABLE LIKEY;
DROP SEQUENCE evaluation_seq;

ALTER SESSION SET NLS_DATE_FORMAT = 'DD-MON-YYYY';
ALTER SESSION SET NLS_LANGUAGE = 'AMERICAN';

-- PUB 테이블 생성
CREATE TABLE pub (
    pno NUMBER(7),
    pname VARCHAR2(45) CONSTRAINT pub_pname_nn NOT NULL,
    menu VARCHAR2(45) CONSTRAINT pub_menu_nn NOT NULL,
    alcohol VARCHAR2(45),
    category VARCHAR2(15),
    place VARCHAR2(120),
    tel VARCHAR2(14) CONSTRAINT pub_tel_uq UNIQUE,
		star NUMBER(5, 2) DEFAULT 0 CONSTRAINT pub_star_ck CHECK (star BETWEEN 1.00 AND 5.00),
    plike NUMBER(4) DEFAULT 0 CONSTRAINT pub_plike_ck CHECK (plike BETWEEN 0 AND 9999),
    pcheck NUMBER(1) DEFAULT 0,
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
col category format a10
col place format a50
col tel format a16
col star format 999.99
col plike format 9999
col homepage format a60
col link format a45

-- PUB 샘플 데이터
INSERT INTO pub (pno, pname, menu, alcohol, category, place, tel, star, plike, pcheck, homepage, link)
VALUES (1, '몰틀리', '치킨, 피자', '크림생맥주', '수입맥주', '부산 금정구 금정로219번길 27 1층', '0507-1419-8823', 4.53, 55, 1, NULL, NULL);
INSERT INTO pub (pno, pname, menu, alcohol, category, place, tel, star, plike, pcheck, homepage, link)
VALUES (2, '호맥', '호떡', '생맥주', '수입맥주', '부산 금정구 중앙대로1959번길 55', '051-912-4445', 4.59, 171, 1, 'http://www.ho-mac.com/', NULL);
INSERT INTO pub (pno, pname, menu, alcohol, category, place, tel, star, plike, pcheck, homepage, link)
VALUES (3, '쉼, 어묵 그리고 한잔 술', '어묵탕', '하이볼', '칵테일', '부산 금정구 금정로219번길 16', '051-1899-8148', 4.5, 16, 1, 'https://www.instagram.com/suimeomuk_guseo/', NULL);
INSERT INTO pub (pno, pname, menu, alcohol, category, place, tel, star, plike, pcheck, homepage, link)
VALUES (4, '역전할머니맥주', '치즈라볶이, 옛날통닭', '살얼음 생맥주', '수입맥주', '부산 금정구 금정로231번길 29', '0507-1339-1713', 4.7, 85, 1, 'https://blog.naver.com/bomsworld_/222118580525', NULL);
INSERT INTO pub (pno, pname, menu, alcohol, category, place, tel, star, plike, pcheck, homepage, link)
VALUES (5, '옥수관', '곰탕, 육회비빔밥', '일품진로', '일반소주', '부산 금정구 금강로 380번길 38 1층', '051-513-5999', 4.58, 24, 1, NULL, NULL);
INSERT INTO pub (pno, pname, menu, alcohol, category, place, tel, star, plike, pcheck, homepage, link)
VALUES (6, '해리의 집', '고급생삼겹', '더덕하이볼', '칵테일', '부산 금정구 금정로219번길 14', '051-581-5586', 4.4, 6, 1, NULL, NULL);
INSERT INTO pub (pno, pname, menu, alcohol, category, place, tel, star, plike, pcheck, homepage, link)
VALUES (7, '모티', '위스키', 'glenfiddich', '위스키', '부산 동구 망양로 669', '051-469-8253', 4.5, 58, 1, NULL, NULL);
INSERT INTO pub (pno, pname, menu, alcohol, category, place, tel, star, plike, pcheck, homepage, link)
VALUES (8, '초량불백', '불백정식', '대선, 참이슬', '일반소주', '부산 동구 초량로 36', '051-464-0454', 4.2, 17, 1, NULL, NULL);
INSERT INTO pub (pno, pname, menu, alcohol, category, place, tel, star, plike, pcheck, homepage, link)
VALUES (9, '우리돼지국밥', '돼지국밥', '참이슬', '일반소주', '부산 동구 초량로 27-1', '051-468-5623', 3.8, 46, 1, NULL, NULL);
INSERT INTO pub (pno, pname, menu, alcohol, category, place, tel, star, plike, pcheck, homepage, link)
VALUES (10, '서울깍두기', '곰탕, 갈비탕', '시원', '일반소주', '부산 동구 중앙대로226번길 3-2', '051-465-7187', 3.5, 1, 1, NULL, NULL);
INSERT INTO pub (pno, pname, menu, alcohol, category, place, tel, star, plike, pcheck, homepage, link)
VALUES (11, '양지아구찜', '아구찜', '참이슬', '일반소주', '부산 동구 초량로 5-1', '0507-1406-5459', 4.73, 422, 1, NULL, NULL);
INSERT INTO pub (pno, pname, menu, alcohol, category, place, tel, star, plike, pcheck, homepage, link)
VALUES (12, '몽상가들', '버터문어구이', '와인', '과실주', '부산 중구 광복로18번길 6-1 파란집', '051-243-1011', 3.9, 23, 1, NULL, NULL);

-- ALCOHOL 테이블 생성
CREATE TABLE alcohol (
    ano NUMBER(7) CONSTRAINT alcohol_ano_pk PRIMARY KEY,
    category VARCHAR2(15) CONSTRAINT alcohol_category_nn NOT NULL,
    aname VARCHAR2(45)CONSTRAINT alcohol_aname_nn NOT NULL,
    degree NUMBER(2) DEFAULT 0 CONSTRAINT alcohol_degree_ck CHECK (degree >= 0 AND degree <= 100),
    maker VARCHAR2(45),
    adate DATE,
    price NUMBER(8) DEFAULT 0 CONSTRAINT alcohol_price_ck CHECK (price >= 0 AND price <= 99999999),
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
col adate format a10
col price format 99999999
col homepage format a60
col link format a45

-- ALCOHOL 샘플 데이터
INSERT INTO alcohol (ano, category, aname, degree, maker, adate, price, homepage, link)
VALUES (1, '탁주', '삼해주', 15, '선인양조', NULL, 30000, 'https://smartstore.naver.com/suninbrew/', NULL);
INSERT INTO alcohol (ano, category, aname, degree, maker, adate, price, homepage, link)
VALUES (2, '약주,청주', '소성주', 6, '인천탁주', NULL, 1300, 'https://sosungju.modoo.at/', NULL);
INSERT INTO alcohol (ano, category, aname, degree, maker, adate, price, homepage, link)
VALUES (3, '과실주', '감귤주', 10, '시트러스', NULL, 8200, 'https://www.ehondiju.com/', NULL);
INSERT INTO alcohol (ano, category, aname, degree, maker, adate, price, homepage, link)
VALUES (4, '증류주', '양촌 감 보드카', 32, '양촌감', NULL, 17000, NULL, NULL);
INSERT INTO alcohol (ano, category, aname, degree, maker, adate, price, homepage, link)
VALUES (5, '와인', '복숭아와인', 12, '솔티마을', NULL, 13500, 'https://smartstore.naver.com/solti', NULL);
INSERT INTO alcohol (ano, category, aname, degree, maker, adate, price, homepage, link)
VALUES (6, '리큐르', '블링블링 바다별', 15, '영덕주조', NULL, 22500, 'https://ydjujo.co.kr/new/index.php', NULL);
INSERT INTO alcohol (ano, category, aname, degree, maker, adate, price, homepage, link)
VALUES (7, '과실주', '오르또', 13.5, '오르또와이너리', NULL, 36000, 'https://xn--961b87dnxp.kr/', NULL);
INSERT INTO alcohol (ano, category, aname, degree, maker, adate, price, homepage, link)
VALUES (8, '과실주', '뷰레떼라이트스파클링', 8, '애플린영농조합', NULL, 25000, 'https://xn--sy2bt7s5tm.kr/', NULL);
INSERT INTO alcohol (ano, category, aname, degree, maker, adate, price, homepage, link)
VALUES (9, '과실주', '머루와인', 12, '덕유양조', NULL, 19800, 'https://www.enuri.com/detail.jsp?modelno=20054191', NULL);
INSERT INTO alcohol (ano, category, aname, degree, maker, adate, price, homepage, link)
VALUES (10, '과실주', '달1614', 12, '덕유양조', NULL, 30000, NULL, NULL);
INSERT INTO alcohol (ano, category, aname, degree, maker, adate, price, homepage, link)
VALUES (11, '과실주', '추시감와인', 12.5, '양촌감와이너리', NULL, 15000, 'https://smartstore.naver.com/choosi/products/4433141484', NULL);
INSERT INTO alcohol (ano, category, aname, degree, maker, adate, price, homepage, link)
VALUES (12, '과실주', '레인보우', 12, '도란원', NULL, 22000, NULL, NULL);
INSERT INTO alcohol (ano, category, aname, degree, maker, adate, price, homepage, link)
VALUES (13, '과실주', '애플린', 12, '반딧불사과와인', NULL, 25000, 'https://xn--sy2bt7s5tm.kr/', NULL);
INSERT INTO alcohol (ano, category, aname, degree, maker, adate, price, homepage, link)
VALUES (14, '과실주', '딸기스파클링와인', 12, '해미읍성딸기와인', NULL, 31500, 'https://www.sooldamhwa.com/damhwaMarket/detail/1360', NULL);
INSERT INTO alcohol (ano, category, aname, degree, maker, adate, price, homepage, link)
VALUES (15, '과실주', '애플블랑', 12, '예산사과와인', NULL, 53900, NULL, NULL);


-- BSHJ_USER 테이블 생성
CREATE TABLE bshj_user (	
	username varchar2(15) CONSTRAINT bshj_user_username_nn NOT NULL,
	id varchar2(15) CONSTRAINT bshj_user_id_pk PRIMARY KEY,
	pwd	varchar2(20) CONSTRAINT bshj_user_pwd_nn NOT NULL,
	email varchar2(25) CONSTRAINT bshj_user_email_nn NOT NULL
);

-- BSHJ_USER COLUMN SIZE
col username format a15
col id format a20
col pwd format a20

-- BSHJ_USER 샘플 데이터
INSERT INTO bshj_user (username, id, pwd, email)
VALUES ('송윤정', 'songyj', '1234', 'songyj@gmail.com');
INSERT INTO bshj_user (username, id, pwd, email)
VALUES ('석신성', 'seokss', 'abcd', 'seokss@gmail.com');
INSERT INTO bshj_user (username, id, pwd, email)
VALUES ('최영은', 'choiye', '5678', 'choiye@gmail.com');
INSERT INTO bshj_user (username, id, pwd, email)
VALUES ('조해동', 'johd', 'efgh', 'johd@gmail.com');

-- EVALUATION 테이블 생성
CREATE TABLE EVALUATION (
	evaluationID number(10),
	userID varchar2(20),
	lectureName varchar2(50),
	professorName varchar2(20),
	lectureYear number(10),
	semesterDivide varchar2(20),
	lectureDivide varchar2(10),
	evaluationTitle varchar2(100),
	evaluationContent varchar2(2048),
	totalScore varchar2(5),
	creditScore varchar2(5),
	comfortableScore varchar2(5),
	lectureScore varchar2(5),
	likeCount number(10)
);

CREATE SEQUENCE evaluation_seq START WITH 1 INCREMENT BY 1 MAXVALUE 100 CYCLE NOCACHE;

-- EVALUATION 샘플 데이터
INSERT INTO evaluation (lectureName, professorName, lectureYear, semesterDivide, lectureDivide, evaluationTitle, evaluationContent, totalScore, creditScore, comfortableScore,lectureScore, likeCount)
VALUES ('감귤주', '8,200원', '2019', '여름', '술', '시트러스 계열 좋아하시면 추천', '감귤주 맛있어요<br>평소에도 하이볼 대신 마셔도 좋아요', 'B', 'A', 'C', 'B', 5);
INSERT INTO evaluation (lectureName, professorName, lectureYear, semesterDivide, lectureDivide, evaluationTitle, evaluationContent, totalScore, creditScore, comfortableScore,lectureScore, likeCount)
VALUES ('심해주', '30,000원', '2022', '여름', '술', '전통주 치고 괜찮아요.', '전통주를 별로 안좋아하는 편인데<br>술맛이 깔끔하고 좋습니다.<br>가격도 괜찮은거 같아요.', 'C', 'A', 'C', 'B', 0);
INSERT INTO evaluation (lectureName, professorName, lectureYear, semesterDivide, lectureDivide, evaluationTitle, evaluationContent, totalScore, creditScore, comfortableScore,lectureScore, likeCount)
VALUES ('몰틀리', '구서', '2019', '가을', '식사', '맛있게 먹고 갑니다', '술과 안주 모두 맛있고<br>고급스럽고 깔끔한 인테리어가 참 좋네요<br><br>가볍게 먹기 좋은 스낵메뉴와 다양한 종류의 술이 있어서 간단하게 한잔 할 때도 돚흥ㄹ 것 같아요. 떡볶이, 피자, 파스타, 치킨 등 다양한 메뉴들이 있어서 회식이나 데이트 하기에 좋은 곳이라고 생각이 듭니다', 'B', 'B', 'C', 'B', 2);
INSERT INTO evaluation (lectureName, professorName, lectureYear, semesterDivide, lectureDivide, evaluationTitle, evaluationContent, totalScore, creditScore, comfortableScore,lectureScore, likeCount)
VALUES ('역전 할머니 맥주', '금정구', '2021', '여름', '안주', '가격이 싸요', '새로 나온 신메뉴와 하이볼을 마셨는데<br>2차로 알콜 충전하러 가기 좋습니다.<br><br>다양한 안주와 합리적인 가격 조용한 분위기<br>가성비 좋아요', 'A', 'A', 'A', 'A', 0);
INSERT INTO evaluation (lectureName, professorName, lectureYear, semesterDivide, lectureDivide, evaluationTitle, evaluationContent, totalScore, creditScore, comfortableScore,lectureScore, likeCount)
VALUES ('호맥', '금정구', '2023', '봄', '안주', '맛있어요', '호가든 로제 생맥으로 먹을 수 있는 곳이에요.<br>크림 새우 호떡 넘 맛나요<br>맥주랑 안주랑 딱이에요<br>빔으로 보내는 영상이랑 음악도 분위기 있게 잘 먹고 갑니다', 'B', 'C', 'B', 'A', 1);

-- LIKEY 테이블 생성
CREATE TABLE LIKEY (
	userID varchar2(20),
	evaluationID number(10),
	userIP varchar2(50)
);

COMMIT;

SET TERMOUT ON
PROMPT Status Code 200
PROMPT 부산한잔
PROMPT .
PROMPT .
PROMPT 테이블 생성이 완료되었습니다.