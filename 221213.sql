--테이블 생성
--학생 - 학번, 이름, 학과명, 평점
create table student(
    student_no char(8 byte) primary key,
    student_name varchar2(5 byte),
    major_name varchar2(48 byte),
    score number(3,2)
);

--회원정보를 저장하는 테이블
--아이디, 비밀번호, 이름, 성별, 나이
create table member(
    member_id varchar2(20 byte) primary key,
    member_passwd varchar2(50 byte),
    member_name varchar2(15 byte),
    member_gender char(1 byte),
    member_age number(3)
);
--제품정보
--제품일렬번호, 제품명, 제조사명, 금액
create table product(
    product_no char(8 byte) primary key,
    product_name varchar2(50 byte),
    product_maker varchar2(50 byte),
    product_price number(10)
);

--테이블 삭제
--DROP TABLE 테이블명;
drop table member;
drop table product;
drop table student;

--사원정보
--사원번호, 사원명, 부서명, 연봉
create table employee(
    employee_no char(8 byte) primary key,
    employee_name varchar2(15 byte),
    department_name varchar2(48 byte),
    salary number(10)
);
--사원정보 테이블에 입사일 컬럼을 추가
alter table employee add empl_date date;
alter table employee add empl_date date default sysdate;
--사원정보 테이블에 입사일 컬럼을 기본값으로 현재 날짜 시간이 저장되게끔 수정
alter table employee modify empl_date date default sysdate;

--제품 테이블에 재고를 추가, 재고는 숫자, 최대 재고량은 999로 지정
alter table product add stock number(3) default 0;
--추가한 컬럼 재고를 number 사이즈를 5 변경 > 기존 크기보다 크게 할때만 가능
alter table product modify stock number(5) default 0;

--컬럼 삭제
--제품 테이블에서 재고 컬럼을 삭제
alter table product drop column stock;

--사용자 생성
--create user 아이디 identified by 암호;
create user scott identified by tiger;
--암호 변경
alter user scott identified by 123456;
--접속 권한
grant connect to scott;
--사용자 계정 잠금처리
alter user scott account lock;
--사용자 계정 잠금 해제 처리 
alter user scott account unlock;


--전체 사용자 정보
select * from dba_users;





