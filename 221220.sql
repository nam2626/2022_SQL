--DRUG_SELL 테이블에 DRUG_NAME과 DRUG_COMPANY 를 인덱스로 작성
--DRUG_SELL_IDX
CREATE INDEX DRUG_SELL_IDX ON DRUG_SELL(DRUG_NAME,DRUG_COMPANY);
ALTER INDEX DRUG_SELL_IDX REBUILD;

--시퀸스
create sequence car_sell_seq;
drop SEQUENCE car_sell_seq;

create sequence car_sell_seq
start with 100
maxvalue 120
minvalue 100
increment by 1
cycle;
--다음 순번을 가져옴
SELECT CAR_SELL_SEQ.NEXTVAL FROM DUAL;
--현재 값을 가져옴
SELECT CAR_SELL_SEQ.CURRVAL FROM DUAL;
--시작값이 20부터 마지막 값은 35이며, 1씩 증가, 순환 X
CREATE SEQUENCE START_SEQ
START WITH 20
MAXVALUE 35
NOCYCLE;

SELECT START_SEQ.NEXTVAL FROM DUAL;
--시퀸스 수정하는 부분 START WITH는 변경 불가
ALTER SEQUENCE START_SEQ
MAXVALUE 35
MINVALUE 20
NOCYCLE
NOCACHE;

--DRUG_SELL 테이블에 들어갈 시퀸스를 작성
--시작값이 1001, 최대값 X, 1씩 증가, 순환 X
CREATE SEQUENCE DRUG_SELL_SEQ
START WITH 1001
NOMAXVALUE
INCREMENT BY 1
NOCYCLE;

INSERT INTO DRUG_SELL 
VALUES(DRUG_SELL_SEQ.NEXTVAL,'약품명','제약사명',22,TO_DATE('2022-11-15','YYYY-MM-DD'));

--학생정보 조회 - 평점이 평균 이상인 학생만 조회
--학번 이름 학과명 평점
select s.student_no, s.student_name, m.major_name, s.score from student s, major m
where s.major_no = m.major_no and s.score >= (select avg(score) from student);

create or replace view student_view
as 
select s.student_no, s.student_name, m.major_name, s.score from student s, major m
where s.major_no = m.major_no;

select * from student_view where score >= (select avg(score) from student);

--최대 판매가와 최소 판매가를 가진 차량의 정보를 조회 한 후 해당 내용을 뷰로 저장
--car_id, car_name, maker_name, price
create or replace view car_mxmn_price_view
as
select c.car_id, c.car_name, cm.maker_name, c.price from car c, car_maker cm
where c.maker_no = cm.maker_no and c.price 
in((select max(price) from car),(select min(price) from car));

select * from car_mxmn_price_view;

--테이블 생성
create table book(
    isbn varchar2(12) primary key,
    title varchar2(50),
    writer_no varchar2(10) not null,
    publisher_no varchar2(10) not null,
    money number(7));

create table publisher(
    publisher_no varchar2(10) primary KEY,
    publisher_name varchar2(30)
);
create table writer(
    writer_no varchar2(10) primary KEY,
    writer_name varchar2(30)
);

insert into writer values('W0001', '홍길동');
insert into writer values('W0002', '강병우');
insert into writer values('W0003', '박정후');
insert into writer values('W0004', '조민성');
insert into writer values('W0005', '김시수');

insert into publisher values('P0001','창작사');
insert into publisher values('P0002','컴퓨터 미디어');
insert into publisher values('P0003','아트와 컬쳐');
insert into publisher values('P0004','코멧');
insert into publisher values('P0005','인터즈');

insert into book values('1111111111', '이것이 리눅스다', 'W0001', 'P0001', 36000);
insert into book values('2222222222', '자료구조', 'W0001', 'P0002', 18900);
insert into book values('3333333333', '디자인 패턴', 'W0002', 'P0003', 23000);
insert into book values('4444444444', '자바의 정석', 'W0003', 'P0003', 45800);
insert into book values('5555555555', '안드로이드 개발의 정석', 'W0003', 'P0003', 26700);

SAVEPOINT DATA_FIN;

insert into book values('666666', '안드로이드 개발의 정석', 'W0003', 'P0003', 26700);

ROLLBACK TO DATA_FIN;
--인덱스 생성
CREATE INDEX BOOK_INDEX ON BOOK(TITLE,WRITER_NO);
--도서를 출판하지 않은 저자들의 목록 조회
SELECT W.* FROM WRITER W, BOOK B WHERE W.WRITER_NO = B.WRITER_NO(+) AND B.ISBN IS NULL;
SELECT W.* FROM WRITER W WHERE W.WRITER_NO NOT IN (SELECT B.WRITER_NO FROM BOOK B);
--도서정보 조회시 ISBN, TITLE, WRITER_NAME, PUBLISHER_NAME, MONEY
SELECT B.ISBN, B.TITLE, W.WRITER_NAME, P.PUBLISHER_NAME, B.MONEY FROM WRITER W, BOOK B, PUBLISHER P 
WHERE W.WRITER_NO = B.WRITER_NO AND P.PUBLISHER_NO = B.PUBLISHER_NO;
--뷰로 작성
CREATE OR REPLACE VIEW BOOK_VIEW
AS 
SELECT B.ISBN, B.TITLE, W.WRITER_NAME, P.PUBLISHER_NAME, B.MONEY FROM WRITER W, BOOK B, PUBLISHER P 
WHERE W.WRITER_NO = B.WRITER_NO AND P.PUBLISHER_NO = B.PUBLISHER_NO;

-- 제약 조건 넣는 방법
CREATE TABLE PERSON(
    NAME VARCHAR2(50),
    AGE NUMBER,
    CONSTRAINT PERSON_PK PRIMARY KEY(NAME),
    CONSTRAINT CHECK_AGE CHECK(AGE > 0)
);
INSERT INTO PERSON VALUES('테스트', -10);
DROP TABLE PERSON;
--테이블 작성 후에 넣는 방법
CREATE TABLE PERSON(
    NAME VARCHAR2(50),
    AGE NUMBER
);
ALTER TABLE PERSON ADD CONSTRAINT PERSON_PK PRIMARY KEY(NAME);
ALTER TABLE PERSON ADD CONSTRAINT CHECK_AGE CHECK(AGE > 0);

ALTER TABLE PERSON DISABLE CONSTRAINT CHECK_AGE; --해당 제약조건 비활성화
ALTER TABLE PERSON ENABLE CONSTRAINT CHECK_AGE; --해당 제약조건 활성화

SELECT * FROM USER_CONSTRAINTS; --사용자가 만든 제약조건을 조회
SELECT * FROM USER_SEQUENCES; --사용자가 만든 시퀸스를 조회
SELECT * FROM USER_TABLES; --사용자가 만든 테이블을 조회
SELECT * FROM USER_VIEWS; --사용자가 만든 뷰 조회

--외래키
--학생 테이블과 장학금 테이블을 학번을 이용해서 외래키 지정
ALTER TABLE STUDENT_SCHOLARSHIP ADD CONSTRAINT STUDENT_NO_FK
FOREIGN KEY(STUDENT_NO) REFERENCES STUDENT(STUDENT_NO);

--외래키 지정 후 대상 테이블에 데이터가 없으면 데이터를 넣을 수 없다.
INSERT INTO STUDENT_SCHOLARSHIP VALUES('1111','324234',214124);
INSERT INTO STUDENT_SCHOLARSHIP VALUES('1111','20221684',214124);
--외래키 지정 되어있으면 해당 데이터 삭제시 참조되는 데이터가 있으면 삭제를 막음(기본설정)
DELETE FROM STUDENT WHERE STUDENT_NO = '20221684';
--학생 테이블, 학과 테이블을 학과 번호에 외래키 지정
ALTER TABLE STUDENT ADD CONSTRAINT MAJOR_NO_FK
FOREIGN KEY(MAJOR_NO) REFERENCES MAJOR(MAJOR_NO) ON DELETE CASCADE ;

ALTER TABLE STUDENT ADD CONSTRAINT MAJOR_NO_FK
FOREIGN KEY(MAJOR_NO) REFERENCES MAJOR(MAJOR_NO) ON DELETE SET NULL ;

ALTER TABLE STUDENT DROP CONSTRAINT MAJOR_NO_FK;

DELETE FROM MAJOR WHERE MAJOR_NO = 7;
------------------------------------------------------------------------------
CREATE TABLESPACE AAA
DATAFILE 'C:\DATAFILE\AAA.dbf' SIZE 1M
AUTOEXTEND ON
NEXT 4M
MAXSIZE UNLIMITED;

DROP TABLESPACE AAA;
--용량 확장 부분을 넣지 않으면 확장 되지 않음
CREATE TABLESPACE BBB
DATAFILE 
'C:\DATAFILE\B1.dbf' SIZE 1M,
'C:\DATAFILE\B2.dbf' SIZE 1M,
'C:\DATAFILE\B3.dbf' SIZE 1M;
--테이블 스페이스 목록 조회
SELECT * FROM DBA_TABLESPACES;
--데이터 파일 목록 조회
SELECT * FROM DBA_DATA_FILES;
--사용자 생성 및 테이블 스페이스 지정(선택)
--          아이디                 비밀번호
CREATE USER STUDENT IDENTIFIED BY 123456
DEFAULT TABLESPACE BBB;

--생성된 사용자 목록
SELECT * FROM DBA_USERS;

--권한부여
GRANT RESOURCE, CONNECT TO STUDENT;
GRANT DBA TO STUDENT; --DB 관리자 권한 지정
GRANT CREATE VIEW TO STUDENT; -- VIEW 생성 권한

--사용자에게 부여된 시스템에 대한 권한 확인
SELECT * FROM DBA_SYS_PRIVS WHERE GRANTEE = 'STUDENT';
--사용자에게 부여된 롤에 대한 권한 확인
SELECT * FROM DBA_ROLE_PRIVS WHERE GRANTEE = 'STUDENT';

--권한 회수
REVOKE DBA FROM STUDENT;
REVOKE RESOURCE, CONNECT FROM STUDENT; 



