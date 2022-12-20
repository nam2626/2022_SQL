--�л����� ��½� �й�, �̸�, �а���, ����
select s.student_no, s.student_name, 
(select m.major_name from major m where s.major_no = m.major_no),
s.score
from student s;

select s.student_no, s.student_name, m.major_name, s.score 
from student s ,major m WHERE s.major_no = m.major_no;

--�л����� ��½� �а� ��ȣ�� �а����̺� ���� �л��� ��ȸ
select * from student s
where s.major_no not in(select m.major_no from major m);

--�л����� ��½� �й�, �̸�, �а���, ����, �а����� ������ ���Ե� ������ ��ȸ
select * from
(select s.student_no, s.student_name, m.major_name, s.score 
from student s ,major m WHERE s.major_no = m.major_no)
where major_name like '%����%';

--select ���� �̿��ؼ� ���̺��� �ۼ�
--�л� ���� ���, �й� �̸�, �а���, ����
--������ ��ü ��� ������ �л��鸸 ��ȸ
select s.student_no, s.student_name, nvl(m.major_name,'�а���ȣ����'), score 
from student s, major m
where s.major_no = m.major_no(+) and s.score <= (select avg(score) from student);
--��������
select s.student_no, s.student_name, 
nvl((select major_name from major m where s.major_no = m.major_no),'�а���ȣ����') as major_name, s.score 
from student s
where s.score <= (select avg(score) from student);
--���̺� �ۼ��� select������ �̿��ϴ� ���
create table low_student
as 
select s.student_no, s.student_name, nvl(m.major_name,'�а���ȣ����') as major_name, s.score 
from student s, major m
where s.major_no = m.major_no(+) and s.score <= (select avg(score) from student);

--���б��� �޴� �л����� ��ȸ (�������� �̿��ؼ� ��ȸ)
select * from student where student_no in(select student_no from student_scholarship);

--�л����� ���б��� ���޴� �л����� ������ ��ȸ
--�й� �̸� �а��� ���� ��ȸ
select s.student_no, s.student_name, nvl(m.major_name,'�а��ڵ����'), s.score from student s, major m
where s.major_no = m.major_no(+) and s.student_no not in(select student_no from student_scholarship);

--�л����� ���б��� ���޴� �л����� ������ ��ȸ
--�а��� �ο����� ��� --> �а���, �ο���
select major_name, count(*) from
(select s.student_no, s.student_name, nvl(m.major_name,'�а��ڵ����') as major_name,
s.score from student s, major m
where s.major_no = m.major_no(+) and
s.student_no not in(select student_no from student_scholarship))
group by major_name;

--�ڵ��� ������ ��ȸ (car, car_maker)
--car_id, car_name, maker_name, price
select c.car_id, c.car_name, cm.maker_name, c.price
from car c, car_maker cm
where c.maker_no = cm.maker_no;

--�����纰, ���� ���� ����, ��� �ǸŰ��� ��ȸ
--maker_name, ����, �ǸŰ� ���
select cm.maker_name, count(*) as car_count, ceil(avg(c.price)) as car_avg_price
from car c, car_maker cm
where c.maker_no = cm.maker_no group by cm.maker_name;

select (select maker_name from car_maker cm where cm.maker_no = c.maker_no) as maker_name,
c.car_count, c.car_avg_price
from (select maker_no, count(*) as car_count,
 ceil(avg(price)) as car_avg_price from car group by maker_no) c;

--�ִ� �ǸŰ��� ���� ������ ������ ��ȸ
--car_id, car_name, maker_name, price
select max(price) from car;

select c.car_id, c.car_name, cm.maker_name, c.price
from car c, car_maker cm
where c.maker_no = cm.maker_no;

select c.car_id, c.car_name, cm.maker_name, c.price
from car c, car_maker cm
where c.maker_no = cm.maker_no and c.price = (select max(price) from car);

--�ִ� �ǸŰ��� �ּ� �ǸŰ��� ���� ������ ������ ��ȸ
--car_id, car_name, maker_name, price
select c.car_id, c.car_name, cm.maker_name, c.price
from car c, car_maker cm
where c.maker_no = cm.maker_no and c.price in((select max(price) from car)
,(select min(price) from car));

select c.car_id, c.car_name, cm.maker_name, c.price
from car c, car_maker cm
where c.maker_no = cm.maker_no and (c.price = (select max(price) from car) or
c.price = (select min(price) from car));
--���� �Ǹ� ���� �� ��� �ǸŴ�� �̻��� ���� ������ ���
--car_id, car_name, maker_name, sale_count(�ǸŴ��)
--1. ������ �� �Ǹ� ��� ��ȸ
select car_no, sum(ea) as sum_ea from car_sell group by car_no;
--2. 1�� �����͸� ��ü ��� �Ǹ� ��� ��ȸ
select avg(sum_ea) from 
(select car_no, floor(sum(ea)) as sum_ea from car_sell group by car_no);
--3. 1�� �����Ϳ� 2�� �����͸� ���ؼ� ��� �̻��� �����͸� ��ȸ
select car_no, sum_ea from 
(select car_no, floor(sum(ea)) as sum_ea from car_sell group by car_no)
where sum_ea >= 
(select avg(sum_ea) from (select car_no, floor(sum(ea)) as sum_ea 
from car_sell group by car_no));
--���� �ִ� �Ǹ� ���� ����� ��ȸ
--1. ������ �� �Ǹ� ��� ��ȸ (month, car_no, sum_ea)
select to_char(sell_date,'MM') as month, car_no, sum(ea) as sum_ea
from car_sell group by to_char(sell_date,'MM'), car_no;
--2. 1�� �����͸� �������� ���� �ִ� �ǸŴ���� ���ϸ�
select month, max(sum_ea) as max_ea from(
select to_char(sell_date,'MM') as month, car_no, sum(ea) as sum_ea
from car_sell group by to_char(sell_date,'MM'), car_no)
group by month;
--3. 1�� �����Ϳ� 2�� �����͸� �������� ���� �ִ� �Ǹ� ���� ����� ��ȸ
--   (month, car_no, sum_ea)
select sc.car_no, sc.month, sc.sum_ea from
(select to_char(sell_date,'MM') as month, car_no, sum(ea) as sum_ea
from car_sell group by to_char(sell_date,'MM'), car_no) sc
where (sc.month, sc.sum_ea) in(select month, max(sum_ea) as max_ea from(
select to_char(sell_date,'MM') as month, car_no, sum(ea) as sum_ea
from car_sell group by to_char(sell_date,'MM'), car_no)
group by month) ;

--4. �����̳� ���������� �̿��ؼ� 3�� ����� �ٽ� ��ȸ
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

--�ε��� ����
create index car_sell_idx on car_sell(sell_no, car_no);
--�ε��� ������
alter index car_sell_idx rebuild;

--������
create sequence car_sell_seq;
drop SEQUENCE car_sell_seq;

create sequence car_sell_seq
start with 100
maxvalue 120
minvalue 100
increment by 1
cycle;




