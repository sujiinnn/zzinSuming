# 테스트용 DB 테이블

## 유저 테이블
CREATE TABLE USERS_TB(
id VARCHAR(50), -- 필수
PW VARCHAR(50) NOT NULL, -- 필수

nickName VARCHAR(50) NOT NULL,

phone VARCHAR(20) NOT NULL,
gender VARCHAR(2) NOT NULL,
age VARCHAR(5) NOT NULL,
area VARCHAR(20) NOT NULL
);

insert into USERS_TB values('test', '1234', 'sujin' ,'010-1234-1234', '남', '22', '부산');

## 게시글 테이블
CREATE TABLE community (
  id INT AUTO_INCREMENT PRIMARY KEY,
  uid varchar(20),
  title VARCHAR(100),
  content TEXT,
  insertDate timestamp not null default current_timestamp
);
