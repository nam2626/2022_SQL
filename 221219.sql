--학생정보 출력시 학번, 이름, 학과명, 평점
select s.student_no, s.student_name, 
(select m.major_name from major m where s.major_no = m.major_no),
s.score
from student s;

select s.student_no, s.student_name, m.major_name, s.score 
from student s ,major m WHERE s.major_no = m.major_no;

--학생정보 출력시 학과 번호가 학과테이블에 없는 학생을 조회
select * from student s
where s.major_no not in(select m.major_no from major m);

--학생정보 출력시 학번, 이름, 학과명, 평점, 학과명이 공학이 포함된 정보만 조회
select * from
(select s.student_no, s.student_name, m.major_name, s.score 
from student s ,major m WHERE s.major_no = m.major_no)
where major_name like '%공학%';

--select 문을 이용해서 테이블을 작성
--학생 정보 출력, 학번 이름, 학과명, 평점
--평점이 전체 평균 이하인 학생들만 조회
select s.student_no, s.student_name, nvl(m.major_name,'학과번호오류'), score 
from student s, major m
where s.major_no = m.major_no(+) and s.score <= (select avg(score) from student);
--서브쿼리
select s.student_no, s.student_name, 
nvl((select major_name from major m where s.major_no = m.major_no),'학과번호오류') as major_name, s.score 
from student s
where s.score <= (select avg(score) from student);
--테이블 작성시 select문으로 이용하는 방법
create table low_student
as 
select s.student_no, s.student_name, nvl(m.major_name,'학과번호오류') as major_name, s.score 
from student s, major m
where s.major_no = m.major_no(+) and s.score <= (select avg(score) from student);

--장학금을 받는 학생들을 조회 (서브쿼리 이용해서 조회)
select * from student where student_no in(select student_no from student_scholarship);

--학생들중 장학금을 못받는 학생들의 정보를 조회
--학번 이름 학과명 평점 조회
select s.student_no, s.student_name, nvl(m.major_name,'학과코드오류'), s.score from student s, major m
where s.major_no = m.major_no(+) and s.student_no not in(select student_no from student_scholarship);

--학생들중 장학금을 못받는 학생들의 정보를 조회
--학과별 인원수를 출력 --> 학과명, 인원수
select major_name, count(*) from
(select s.student_no, s.student_name, nvl(m.major_name,'학과코드오류') as major_name,
s.score from student s, major m
where s.major_no = m.major_no(+) and
s.student_no not in(select student_no from student_scholarship))
group by major_name;

--자동차 정보를 조회 (car, car_maker)
--car_id, car_name, maker_name, price
select c.car_id, c.car_name, cm.maker_name, c.price
from car c, car_maker cm
where c.maker_no = cm.maker_no;

--제조사별, 차량 종류 개수, 평균 판매가를 조회
--maker_name, 개수, 판매가 평균
select cm.maker_name, count(*) as car_count, ceil(avg(c.price)) as car_avg_price
from car c, car_maker cm
where c.maker_no = cm.maker_no group by cm.maker_name;

select (select maker_name from car_maker cm where cm.maker_no = c.maker_no) as maker_name,
c.car_count, c.car_avg_price
from (select maker_no, count(*) as car_count,
 ceil(avg(price)) as car_avg_price from car group by maker_no) c;

--최대 판매가를 가진 차량의 정보를 조회
--car_id, car_name, maker_name, price
select max(price) from car;

select c.car_id, c.car_name, cm.maker_name, c.price
from car c, car_maker cm
where c.maker_no = cm.maker_no;

select c.car_id, c.car_name, cm.maker_name, c.price
from car c, car_maker cm
where c.maker_no = cm.maker_no and c.price = (select max(price) from car);

--최대 판매가와 최소 판매가를 가진 차량의 정보를 조회
--car_id, car_name, maker_name, price
select c.car_id, c.car_name, cm.maker_name, c.price
from car c, car_maker cm
where c.maker_no = cm.maker_no and c.price in((select max(price) from car)
,(select min(price) from car));

select c.car_id, c.car_name, cm.maker_name, c.price
from car c, car_maker cm
where c.maker_no = cm.maker_no and (c.price = (select max(price) from car) or
c.price = (select min(price) from car));
--차량 판매 정보 중 평균 판매대수 이상인 차량 정보를 출력
--car_id, car_name, maker_name, sale_count(판매대수)
--1. 차량별 총 판매 대수 조회
select car_no, sum(ea) as sum_ea from car_sell group by car_no;
--2. 1번 데이터를 전체 평균 판매 대수 조회
select avg(sum_ea) from 
(select car_no, floor(sum(ea)) as sum_ea from car_sell group by car_no);
--3. 1번 데이터와 2번 데이터를 비교해서 평균 이상인 데이터를 조회
select car_no, sum_ea from 
(select car_no, floor(sum(ea)) as sum_ea from car_sell group by car_no)
where sum_ea >= 
(select avg(sum_ea) from (select car_no, floor(sum(ea)) as sum_ea 
from car_sell group by car_no));
--월별 최다 판매 차량 대수를 조회
--1. 차량별 총 판매 대수 조회 (month, car_no, sum_ea)
select to_char(sell_date,'MM') as month, car_no, sum(ea) as sum_ea
from car_sell group by to_char(sell_date,'MM'), car_no;
--2. 1번 데이터를 기준으로 월별 최다 판매대수를 구하면
select month, max(sum_ea) as max_ea from(
select to_char(sell_date,'MM') as month, car_no, sum(ea) as sum_ea
from car_sell group by to_char(sell_date,'MM'), car_no)
group by month;
--3. 1번 데이터와 2번 데이터를 기준으로 월별 최다 판매 차량 대수를 조회
--   (month, car_no, sum_ea)
select sc.car_no, sc.month, sc.sum_ea from
(select to_char(sell_date,'MM') as month, car_no, sum(ea) as sum_ea
from car_sell group by to_char(sell_date,'MM'), car_no) sc
where (sc.month, sc.sum_ea) in(select month, max(sum_ea) as max_ea from(
select to_char(sell_date,'MM') as month, car_no, sum(ea) as sum_ea
from car_sell group by to_char(sell_date,'MM'), car_no)
group by month) ;

--4. 조인이나 서브쿼리를 이용해서 3번 결과를 다시 조회
--   (month, car_name, sum_ea)
select sc.car_no, c.car_name, sc.month, sc.sum_ea from
(select to_char(sell_date,'MM') as month, car_no, sum(ea) as sum_ea
from car_sell group by to_char(sell_date,'MM'), car_no) sc,
car c
where sc.car_no = c.car_id and
 (sc.month, sc.sum_ea) in(select month, max(sum_ea) as max_ea from(
select to_char(sell_date,'MM') as month, car_no, sum(ea) as sum_ea
from car_sell group by to_char(sell_date,'MM'), car_no)
group by month) ;

select * from car where car_id = '262831953';

select distinct length(car_id) from car;

--인덱스 생성
create index car_sell_idx on car_sell(sell_no, car_no);
--인덱스 리빌딩
alter index car_sell_idx rebuild;

--시퀸스
create sequence car_sell_seq;
drop SEQUENCE car_sell_seq;

create sequence car_sell_seq
start with 100
maxvalue 120
minvalue 100
increment by 1
cycle;




