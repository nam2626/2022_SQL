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
select * from student where score != 3.0;
select * from student where score <> 3.0;
select * from student where NOT score = 3.0;
--학과명이 경제학과인 학생만 조회
select * from student where major_name = '경제학과';
--문자열 비교
select * from student where major_name like '경제학과';
--학생 이름이 김씨인 학생만 조회
select * from student where student_name like '김%';
--학생 이름이 수로 끝나는 학생만 조회
select * from student where student_name like '%수';
--학과명에 경이 들어가는 학생만 조회
select * from student where major_name like '%경%';
-- _ 도 와일드 카드 문자, 한글자만 나타냄
select * from student where student_name like '김__';

--다중 INSERT문
--학생 테이블에 데이터 3건을 추가
insert all
    into student(student_no,student_name,major_name,score) 
    values('20221116','홍길동','정치외교학과',3.31)
    into student(student_no,student_name,major_name,score)
    values('20221117','김길동','경제학과',3.21)
    into student(student_no,student_name,major_name,score)
    values('20221118','박길동','경영학과',3.11)
select * from dual;

--제품 테이블에서 제조사가 BMW인 제품을 조회
select * from product where product_maker like 'BMW';
--제품 테이블에서 제조사가 BMW이거나 제조사가 Mercedes인 제품을 조회
select * from product where product_maker like 'BMW' or product_maker like 'Mercedes-Benz';
--제품 테이블에서 제조사가 BMW이거나 Mercedes, Audi인 제품을 조회
select * from product where product_maker like 'BMW' or product_maker like 'Mercedes-Benz'
or product_maker like 'Audi';
select * from product where product_maker in('BMW','Mercedes-Benz','Audi');
--제품테이블에서 제품금액이 70000이상 90000이하인 제품을 조회
select * from product where product_price between 70000 and 90000;

--제품 테이블에서 제조사가 Kia이면서 제품금액이 70000이상 90000이하인 제품을 조회
select * from product 
where product_price between 70000 and 90000 and product_maker like 'Kia';

--제품 테이블에서 제품번호가 3번째 자리가 8, 4번째 자리가 9인 제품을 조회
select * from product where product_no like '__89____';
select * from product where product_no like '__89%';

--사원 테이블에서 부서명이 입력 안된 데이터를 조회
--null을 체크할때는 is
select * from employee where department_name is null;
--사원 테이블에서 부서명이 입력된 데이터만 조회
select * from employee where department_name is null;


