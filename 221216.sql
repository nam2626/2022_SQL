--����纰 �Ǹ� ����(ea) ����� ��ȸ
select drug_company, avg(ea) from drug_sell group by drug_company;
--��ǰ�� �Ǹ� ����(ea) ������ ��ȸ
select drug_name, sum(ea) from drug_sell group by drug_name;
--����纰 �Ǹ��ϴ� ��ǰ ������ ��ȸ
select drug_company, count(distinct drug_name) from drug_sell group by drug_company;
select drug_company, drug_name from drug_sell;
--���� ��ǰ �Ǹ� ���� ����, ����� ��ȸ - ����� �ø�ó���ؼ� ��ȸ
select to_char(sell_date,'MM'), sum(ea), ceil(avg(ea)) from drug_sell
group by to_char(sell_date,'MM');
select to_char(sell_date,'MM') from drug_sell;

--���Ϻ�, ��ǰ�� �Ǹ� ���� ������ ��ȸ
select to_char(sell_date,'DY'), drug_name, sum(ea) from drug_sell
group by to_char(sell_date,'DY'), drug_name;

--�����, ���� �Ǹ� ���� Ƚ���� ��ȸ, �� �ǸŰ����� 60�̻��� �����͸� ������� ����
select drug_company, to_char(sell_date,'MM'), count(*) 
from drug_sell
where ea >= 60 group by drug_company, to_char(sell_date,'MM')
order by drug_company, to_char(sell_date,'MM');
--------------------------------------------------------------------------------
--����
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

--���� ����
select ta.code, ta.num, tb.val from table_a ta, table_b tb where tb.code = ta.code;
--�ڿ� ����
select * from table_a natural join table_b;
--���� ����
select * from table_a cross join table_b;
--�ܺ�����
select ta.*, tb.* from table_a ta, table_b tb
where tb.code(+) = ta.code;

select ta.*, tb.* from table_a ta, table_b tb
where tb.code = ta.code(+);
--����ġ ����
select ta.*, tb.* from table_a ta, table_b tb
where tb.code(+) = ta.code and tb.code is null;

select ta.*, tb.* from table_a ta, table_b tb
where tb.code = ta.code(+) and ta.code is null;

--major ���̺� ����� ����
select distinct major_name from student; --�а��� ���� ����
select rownum, major_name from (select distinct major_name from student); --row : ���ȣ

create table major
as
select rownum as major_no, major_name from (select distinct major_name from student);

--�а���ȣ �÷� �߰�
alter table student add major_no number default 0;
--�а���ȣ ������Ʈ
update student s set major_no = (select major_no from major m where s.major_name = m.major_name);
--�а��� �÷� ����
alter table student drop column major_name;

--���б� ���̺�
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

--�л����� ��ȸ�� �й�, �̸�, �а���, ���� ��ȸ
select s.student_no, s.student_name, m.major_name, s.score
from student s, major m
where s.major_no = m.major_no;

--�л����� ��ȸ�� �й�, �̸�, �а���, ���� ��ȸ --> ��ġ�ϴ� �а���ȣ�� ��� ��ȸ
select s.student_no, s.student_name, m.major_name, s.score
from student s, major m
where s.major_no = m.major_no(+);

select null,nvl(null,'���Դϴ�') from dual;
--�л����� ��ȸ�� �й�, �̸�, �а���, ���� ��ȸ --> ��ġ�ϴ� �а���ȣ�� ��� ��ȸ
--��ġ�ϴ� �а����� ������, �а���ȣ ������� ���
select s.student_no, s.student_name, nvl(m.major_name,'�а���ȣ ����'), s.score
from student s, major m
where s.major_no = m.major_no(+);

--�л� ���� �߿��� �а� ��ȣ�� �а� ���̺� ���� �л��鸸 ��ȸ
 select s.* from student s, major m 
 where s.major_no = m.major_no(+) and m.major_no is null;

--�л����� ���б��� �޴� �л����� ������ ��ȸ
--�й� �̸� ���� �а��� ���б� �ݾ�
select s.student_no, s.student_name, s.score, m.major_name, ss.money 
from student s, major m, student_scholarship ss
where s.major_no = m.major_no and ss.student_no = s.student_no; 

--�л����� ���б��� ���޴� �л����� ������ ��ȸ
--�й� �̸� �а� ���� ��ȸ
select s.student_no, s.student_name, s.score, m.major_name, ss.money 
from student s, major m, student_scholarship ss
where s.major_no = m.major_no and ss.student_no(+) = s.student_no and ss.money is null; 

--�а���, ������ ���(�Ҽ� 2�ڸ�), �ο����� ��ȸ
--��, �а���ȣ�� ��ġ���� �ʴ� �а����� �а��ڵ� ������ ��ȸ
-- �а���  �������  �а����ο���
select nvl(m.major_name,'�а��ڵ����'), round(avg(s.score),2), count(*)
from student s, major m
where s.major_no = m.major_no(+)
group by nvl(m.major_name,'�а��ڵ����');

--�а��� ���� ����ڸ� �ο����� ��ȸ
--������ 1.5 �̸��� ����ڵ��� ���� �����
--��, �а���ȣ�� ��ġ���� �ʴ� �а����� �а��ڵ� ������ ��ȸ
--�а���, ��������� �ο���, ������ ��������� �ο����� ���� ������� ��ȸ
select nvl(m.major_name,'�а��ڵ����'), count(*)
from student s, major m
where s.major_no = m.major_no(+) and s.score < 1.5
group by nvl(m.major_name,'�а��ڵ����');