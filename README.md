# 테스트용 DB 테이블

## 유저 테이블
CREATE TABLE USERS_TB( <br>
id VARCHAR(50), -- 필수 <br>
PW VARCHAR(50) NOT NULL, -- 필수 <br>

nickName VARCHAR(50) NOT NULL, <br>

phone VARCHAR(20) NOT NULL, <br>
gender VARCHAR(2) NOT NULL, <br>
age VARCHAR(5) NOT NULL, <br>
area VARCHAR(20) NOT NULL <br>
); <br><br> 

insert into USERS_TB values('test', '1234', 'sujin' ,'010-1234-1234', '남', '22', '부산'); <br> <br>

## 게시글 테이블
CREATE TABLE community ( <br>
  id INT AUTO_INCREMENT PRIMARY KEY, <br>
  uid varchar(20), <br>
  title VARCHAR(100), <br>
  content TEXT, <br>
  insertDate timestamp not null default current_timestamp <br>
); <br>
