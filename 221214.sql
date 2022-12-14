--STUDENT 테이블에 데이터  5건 저장하는 INSERT문을 작성 후 실행
insert into student(student_no,student_name,major_name,score)
values('20221111','김철수','컴퓨터공학과',3.45);
insert into student(student_no,student_name,major_name,score)
values('20221112','이영희','경제학과',1.45);
insert into student(student_no,student_name,major_name,score)
values('20221113','박영수','경영학과',4.11);
insert into student(student_no,student_name,major_name,score)
values('20221114','장이성','국어국문학과',2.33);
insert into student(student_no,student_name,major_name,score)
values('20221115','김우형','생활체육학과',3.11);


--회원 테이블에 데이터 5건 넣는 INSERT문을 작성 후 실행
insert into member(member_id,member_passwd,member_name,member_gender,member_age)
values('user1','1234','김철수','1',20);
insert into member(member_id,member_passwd,member_name,member_gender)
values('user2','1234','이영희','0');
insert into member(member_id,member_passwd,member_name,member_gender,member_age)
values('user3','1234','박영수','1',30);
insert into member(member_id,member_passwd,member_name,member_gender,member_age)
values('user4','1234','장이성','0',40);
insert into member(member_id,member_passwd,member_name,member_gender,member_age)
values('user5','1234','김우형','1',50);

alter table member modify member_age number(3) default 0;

commit;

select sysdate from dual;
--Employee 테이블에 데이터 5건 저장하는 INSERT문을 작성 후 실행
insert into employee values('11111111','김철수','회계부',3000000,'2021-01-01');
insert into employee values('11111112','이영희','경리부',2500000,'2022/01/05');
insert into employee values('11111113','박영수','총무부',3600000,'2022/09/15');
insert into employee values('11111114','장이성','관리부',2200000,'2022/03/25');
insert into employee values('11111115','김우형','개발부',4500000,'2022/11/25');

--데이터 조회
-- * --> 전체 컬럼
select * from student;
--학생 테이블 이름, 학번 만 조회
select student_name, student_no from student;
--학점이 2.0 초과인 학생 목록을 조회
select * from student where score > 2.0;
--학점이 3.0 이하인 학생 목록을 조회
select * from student where score <= 3.0;
--학점이 2.0이상 3.0이하인 학생 목록을 조회
select * from student where score >= 2.0 and score <= 3.0;
--조건식에서 숫자 범위를 잡을 때 : 컬럼명 between A and B --> A부터 B까지
select * from student where score between 2.0 and 3.0;
--학점이 3.0인 학생을 조회
select * from student where score = 3.0;
--학점이 3.0이 아닌 학생들만 조회






