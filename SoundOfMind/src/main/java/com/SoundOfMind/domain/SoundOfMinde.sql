## 유저정보
CREATE TABLE MEMBER_INFO(
NAME VARCHAR(30) NOT NULL,
ID VARCHAR(30) PRIMARY KEY,
PW VARCHAR(30) NOT NULL
);

## 게시판
CREATE TABLE STOREGE(
S_INDEX INT AUTO_INCREMENT PRIMARY KEY,
DATE DATE NOT NULL,
TITLE VARCHAR(100) NOT NULL,
CONTENT VARCHAR(3000) NOT NULL,
ID VARCHAR(30) NOT NULL,
CLICK INT DEFAULT 0 NOT NULL,
CONSTRAINT M_F_G01 FOREIGN KEY STOREGE(ID) REFERENCES MEMBER_INFO(ID)
);

## 뉴스
CREATE TABLE NEWS(
N_INDEX INT AUTO_INCREMENT PRIMARY KEY,
DATE VARCHAR(100) NOT NULL,
TITLE VARCHAR(1000) NOT NULL,
URL VARCHAR(3000) NOT NULL,
CONTENT VARCHAR(3000) NOT NULL,
EMOTIONS VARCHAR(10)
);


## 피드백
CREATE TABLE FEEDBACK(
F_INDEXT INT AUTO_INCREMENT PRIMARY KEY,
DATE DATE NOT NULL,
EMAIL VARCHAR(100) NOT NULL,
TITLE VARCHAR(100) NOT NULL,
TEXT VARCHAR(3000) NOT NULL)



DELETE FROM NEWS


SELECT @rownum:=@rownum+1 as rownum, N.*
FROM (SELECT DATE_FORMAT(DATE,'%Y-%m-%d') AS DATE,TITLE,URL FROM NEWS WHERE (@rownum :=0)=0 AND EMOTIONS = '긍정' ORDER BY DATE DESC ) N

SELECT DATE,TITLE,URL FROM NEWS WHERE EMOTIONS='긍정' ORDER BY DATE DESC;
SELECT DATE,TITLE,URL FROM NEWS WHERE EMOTIONS='부정' ORDER BY DATE DESC;
SELECT DATE,TITLE,URL FROM NEWS WHERE EMOTIONS='중립' ORDER BY DATE DESC;

## 게시판 테스트
INSERT INTO STOREGE(DATE,TITLE,CONTENT,ID)
VALUES (now(),'안녕하세요 여기는 백문불여일견 게시판입니다.','우영우','김수민');
INSERT INTO STOREGE(DATE,TITLE,CONTENT,ID)
VALUES (now(),'안녕하세요 여기는 백문불여일견 게시판입니다','스프링 하고싶다','엄태균');
INSERT INTO STOREGE(DATE,TITLE,CONTENT,ID)
VALUES (now(),'안녕하세요 여기는 백문불여일견 게시판입니다','프론트 그만하고싶다','남예림');
INSERT INTO STOREGE(DATE,TITLE,CONTENT,ID)
VALUES (now(),'안녕하세요 여기는 백문불여일견 게시판입니다','프론트 미치겠다','김수지');
INSERT INTO STOREGE(DATE,TITLE,CONTENT,ID)
VALUES ('2024-01-01','안녕하세요 여기는 백문불여일견 게시판입니다','군대가야지..','김성민');





SELECT * FROM STOREGE;
SELECT COUNT(IFNULL(*,0)) FROM MEMBER_INFO WHERE ID = '111';

## 댓글
CREATE TABLE COMENT(
C_INDEX INT AUTO_INCREMENT PRIMARY KEY,
ID VARCHAR(30) NOT NULL,
STOREGE_ID INT NOT NULL,
COMENTS VARCHAR(1000),
CONSTRAINT M_F_G02 FOREIGN KEY COMENT(ID) REFERENCES MEMBER_INFO(ID),
CONSTRAINT M_F_G04 FOREIGN KEY COMENT(STOREGE_ID) REFERENCES STOREGE(S_INDEX)
);

## 감정박스
CREATE TABLE EMOTION(
E_INDEX INT AUTO_INCREMENT PRIMARY KEY,
DATE DATE NOT NULL,
ID VARCHAR(30) NOT NULL,
TEXT VARCHAR(3000) NOT NULL,
EMOTIONS VARCHAR(10) NOT NULL,
CONSTRAINT M_F_G03 FOREIGN KEY EMOTION(ID) REFERENCES MEMBER_INFO(ID)
);

select * from MEMBER_INFO
# 회원가입
INSERT INTO MEMBER_INFO
VALUES ('김성민','김성민','1');

INSERT INTO STOREGE(DATE,TITLE,CONTENT,ID)
VALUE (now(),'안녕하세요','1','1');

INSERT INTO COMENT(ID,COMENTS)
VALUES ('1','1');

INSERT INTO EMOTION(DATE,ID,TEXT,EMOTIONS)
VALUES (now(),'1','안녕하세요','중립');

SELECT * FROM EMOTION
# 내 아이디로 작성한 타이틀
SELECT S.DATE,S.ID, S.TITLE
FROM MEMBER_INFO M, STOREGE S
WHERE M.ID = S.ID;

# 댓글 확인 
SELECT S.TITLE, C.COMENTS
FROM MEMBER_INFO M, COMENT C,STOREGE S
WHERE M.ID = C.ID AND M.ID = S.ID;

-- 채팅 테스트
CREATE TABLE CHATTING(
C_INDEX INT AUTO_INCREMENT PRIMARY KEY,
DATE DATETIME NOT NULL,
TO_ID VARCHAR(30) NOT NULL,
FROM_ID VARCHAR(30) NOT NULL,
CHAT VARCHAR(3000) NOT NULL
)
-- to : 보내는 사람 from : 받는 사람
INSERT INTO CHATTING(DATE,TO_ID,FROM_ID,CHAT)
VALUES (now(),'김수민','김수지','나는 수민');
INSERT INTO CHATTING(DATE,TO_ID,FROM_ID,CHAT)
VALUES (now(),'김수민','김수지','안녕하세요');
INSERT INTO CHATTING(DATE,TO_ID,FROM_ID,CHAT)
VALUES (now(),'1','김수지','안녕하세요');
INSERT INTO CHATTING(DATE,TO_ID,FROM_ID,CHAT)
VALUES (now(),'김수민','1','안녕하세요');
INSERT INTO CHATTING(DATE,TO_ID,FROM_ID,CHAT)
VALUES (now(),'김수지','김수민','안녕하세요');

SELECT * FROM CHATTING 
# 테스트
SELECT TO_ID, DATE_FORMAT(DATE,'%y-%m-%d %H:%i') AS DATE, FROM_ID,CHAT
FROM CHATTING
WHERE FROM_ID ='김수지' AND TO_ID='김수민' OR FROM_ID='김수민' AND TO_ID='김수지'
ORDER BY DATE ASC;

SELECT TO_ID, DATE_FORMAT(DATE,'%y-%m-%d %H:%i') AS DATE, FROM_ID,CHAT
FROM CHATTING
WHERE FROM_ID ='김수민' AND TO_ID='김수지' OR FROM_ID='김수지' AND TO_ID='김수민'
ORDER BY DATE DESC
LIMIT 1;

# TO_ID 중복제거
SELECT DISTINCT TO_ID 
FROM CHATTING
WHERE FROM_ID = '김수지'



## EMOTION 확인
SELECT @rownum:=@rownum+1 as rownum, E.*
FROM (SELECT * FROM STOREGE WHERE (@rownum :=0)=0 ORDER BY DATE DESC) E

## 댓글
CREATE TABLE COMENT(
C_INDEX INT AUTO_INCREMENT PRIMARY KEY,
ID VARCHAR(30) NOT NULL,
STOREGE_ID INT NOT NULL,
COMENTS VARCHAR(1000),
CONSTRAINT M_F_G02 FOREIGN KEY COMENT(ID) REFERENCES MEMBER_INFO(ID),
CONSTRAINT M_F_G04 FOREIGN KEY COMENT(STOREGE_ID) REFERENCES STOREGE(S_INDEX)
);



# 댓글
INSERT INTO COMENT(ID,STOREGE_ID,COMENTS)
VALUES ('엄태균',8,'형은 예비군 5년차란다');
INSERT INTO COMENT(ID,STOREGE_ID,COMENTS)
VALUES ('김수민',8,'요즘 군대가 군대냐');
INSERT INTO COMENT(ID,STOREGE_ID,COMENTS)
VALUES ('김수지',8,'짬지네');
INSERT INTO COMENT(ID,STOREGE_ID,COMENTS)
VALUES ('남예림',8,'괜찮아 군대 EZ해');

# 조회수
UPDATE STOREGE SET CLICK=3 WHERE S_INDEX = 8;

SELECT @rownum:=@rownum+1 as rownum, S.*
FROM (SELECT * FROM STOREGE WHERE (@rownum :=0)=0 ORDER BY CLICK DESC ) S
ALTER TABLE MEMBER_INFO DROP COLUMN PROFILE
ALTER TABLE MEMBER_INFO ADD COLUMN ROOT VARCHAR(20) DEFAULT 'HOME'
ALTER TABLE MEMBER_INFO ADD COLUMN PROFILE VARCHAR(200) DEFAULT '2022/10/12/s_89a8d237-64bc-433b-9afe-fa29594ff5d1_profile.jpg'

SELECT * FROM MEMBER_INFO

SELECT @rownum:=@rownum+1 as rownum, S.*
FROM (SELECT TITLE,DATE,CLICK,ID FROM STOREGE WHERE (@rownum:=0)=0 ORDER BY DATE DESC) S
