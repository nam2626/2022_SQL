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
