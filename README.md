# 테스트용 DB 테이블

## 유저 테이블
``` sql

-- 임시 테스트용
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

```
<br> <br>

## 게시글 테이블
``` sql
CREATE TABLE community (
  id INT AUTO_INCREMENT PRIMARY KEY, -- 게시글 번호 자동으로 증가
  uid varchar(20), -- 작성자
  title VARCHAR(100), -- 제목
  content TEXT, -- 내용
  insertDate timestamp not null default current_timestamp -- 글 작성 시간
);
```

## 개발 환경
+ IDE : Apache-NetBeans
+ JDK : zulu 11
+ OS : Windows
+ DB : MySQL 8
+ Tomcat version : 9.0.75 

## 주의사항 (★★★)
개발 환경이 다를 시 정상 작동하지 않을 수 있습니다. <br>
jdk 버전과 tomcat 버전은 반드시 동일해야합니다.
