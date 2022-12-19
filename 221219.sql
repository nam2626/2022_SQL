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
