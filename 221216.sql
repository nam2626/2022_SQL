--제약사별 판매 개수(ea) 평균을 조회
select drug_company, avg(ea) from drug_sell group by drug_company;
--약품별 판매 개수(ea) 총합을 조회
select drug_name, sum(ea) from drug_sell group by drug_name;
--제약사별 판매하는 약품 개수를 조회
select drug_company, count(distinct drug_name) from drug_sell group by drug_company;
select drug_company, drug_name from drug_sell;
--월별 약품 판매 개수 총합, 평균을 조회 - 평균은 올림처리해서 조회
select to_char(sell_date,'MM'), sum(ea), ceil(avg(ea)) from drug_sell
group by to_char(sell_date,'MM');
select to_char(sell_date,'MM') from drug_sell;

--요일별, 약품별 판매 개수 총합을 조회
select to_char(sell_date,'DY'), drug_name, sum(ea) from drug_sell
group by to_char(sell_date,'DY'), drug_name;

--제약사, 월별 판매 개수 횟수를 조회, 단 판매개수가 60이상인 데이터만 대상으로 잡음
select drug_company, to_char(sell_date,'MM'), count(*) 
from drug_sell
where ea >= 60 group by drug_company, to_char(sell_date,'MM')
order by drug_company, to_char(sell_date,'MM');
--------------------------------------------------------------------------------
--조인
create table table_a(
    code char(1),
    num number(1)
);
create table table_b(
    code char(1),
    val char(1)
);

insert into table_a values('A',1);
insert into table_a values('B',2);
insert into table_a values('C',3);
insert into table_a values('F',5);

insert into table_b values('A','+');
insert into table_b values('B','-');
insert into table_b values('C','*');
insert into table_b values('D','$');
insert into table_b values('E','#');

--동일 조인
select ta.code, ta.num, tb.val from table_a ta, table_b tb where tb.code = ta.code;
--자연 조인
select * from table_a natural join table_b;
--교차 조인
select * from table_a cross join table_b;
--외부조인
select ta.*, tb.* from table_a ta, table_b tb
where tb.code(+) = ta.code;

select ta.*, tb.* from table_a ta, table_b tb
where tb.code = ta.code(+);
--불일치 쿼리
select ta.*, tb.* from table_a ta, table_b tb
where tb.code(+) = ta.code and tb.code is null;

select ta.*, tb.* from table_a ta, table_b tb
where tb.code = ta.code(+) and ta.code is null;

--major 테이블 만드는 과정
select distinct major_name from student; --학과명만 전부 뽑음
select rownum, major_name from (select distinct major_name from student); --row : 행번호

create table major
as
select rownum as major_no, major_name from (select distinct major_name from student);

--학과번호 컬럼 추가
alter table student add major_no number default 0;
--학과번호 업데이트
update student s set major_no = (select major_no from major m where s.major_name = m.major_name);
--학과명 컬럼 삭제
alter table student drop column major_name;

--장학금 테이블
create table STUDENT_SCHOLARSHIP(
    SCHOLARSHIP_NO NUMBER,
    STUDENT_NO CHAR(8 BYTE),
    MONEY NUMBER);
    
INSERT INTO student_scholarship VALUES(1,'20222981',500000);
INSERT INTO student_scholarship VALUES(2,'20227788',1500000);
INSERT INTO student_scholarship VALUES(3,'20224458',2200000);
INSERT INTO student_scholarship VALUES(4,'20228270',540000);
INSERT INTO student_scholarship VALUES(5,'20228664',1100000);
INSERT INTO student_scholarship VALUES(6,'20223753',2300000);
INSERT INTO student_scholarship VALUES(7,'20222235',780000);

--학생정보 조회시 학번, 이름, 학과명, 평점 조회
select s.student_no, s.student_name, m.major_name, s.score
from student s, major m
where s.major_no = m.major_no;

--학생정보 조회시 학번, 이름, 학과명, 평점 조회 --> 일치하는 학과번호가 없어도 조회
select s.student_no, s.student_name, m.major_name, s.score
from student s, major m
where s.major_no = m.major_no(+);

select null,nvl(null,'널입니다') from dual;
--학생정보 조회시 학번, 이름, 학과명, 평점 조회 --> 일치하는 학과번호가 없어도 조회
--일치하는 학과명이 없으면, 학과번호 오류라고 출력
select s.student_no, s.student_name, nvl(m.major_name,'학과번호 오류'), s.score
from student s, major m
where s.major_no = m.major_no(+);

--학생 정보 중에서 학과 번호가 학과 테이블에 없는 학생들만 조회
 select s.* from student s, major m 
 where s.major_no = m.major_no(+) and m.major_no is null;

--학생들중 장학금을 받는 학생들의 정보를 조회
--학번 이름 평점 학과명 장학금 금액
select s.student_no, s.student_name, s.score, m.major_name, ss.money 
from student s, major m, student_scholarship ss
where s.major_no = m.major_no and ss.student_no = s.student_no; 

--학생들중 장학금을 못받는 학생들의 정보를 조회
--학번 이름 학과 평점 조회
select s.student_no, s.student_name, s.score, m.major_name, ss.money 
from student s, major m, student_scholarship ss
where s.major_no = m.major_no and ss.student_no(+) = s.student_no and ss.money is null; 

--학과별, 평점의 평균(소수 2자리), 인원수를 조회
--단, 학과번호가 일치하지 않는 학과명은 학과코드 오류로 조회
-- 학과명  평점평균  학과별인원수
select nvl(m.major_name,'학과코드오류'), round(avg(s.score),2), count(*)
from student s, major m
where s.major_no = m.major_no(+)
group by nvl(m.major_name,'학과코드오류');

--학과별 제적 대상자를 인원수를 조회
--점수가 1.5 미만인 대상자들이 제적 대상자
--단, 학과번호가 일치하지 않는 학과명은 학과코드 오류로 조회
--학과명, 제적대상자 인원수, 정렬은 제적대상자 인원수가 높은 순서대로 조회
select nvl(m.major_name,'학과코드오류'), count(*)
from student s, major m
where s.major_no = m.major_no(+) and s.score < 1.5
group by nvl(m.major_name,'학과코드오류');