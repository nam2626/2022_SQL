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







