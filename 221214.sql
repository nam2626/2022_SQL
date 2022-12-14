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




