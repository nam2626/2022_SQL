--STUDENT ���̺� ������  5�� �����ϴ� INSERT���� �ۼ� �� ����
insert into student(student_no,student_name,major_name,score)
values('20221111','��ö��','��ǻ�Ͱ��а�',3.45);
insert into student(student_no,student_name,major_name,score)
values('20221112','�̿���','�����а�',1.45);
insert into student(student_no,student_name,major_name,score)
values('20221113','�ڿ���','�濵�а�',4.11);
insert into student(student_no,student_name,major_name,score)
values('20221114','���̼�','������а�',2.33);
insert into student(student_no,student_name,major_name,score)
values('20221115','�����','��Ȱü���а�',3.11);


--ȸ�� ���̺� ������ 5�� �ִ� INSERT���� �ۼ� �� ����
insert into member(member_id,member_passwd,member_name,member_gender,member_age)
values('user1','1234','��ö��','1',20);
insert into member(member_id,member_passwd,member_name,member_gender)
values('user2','1234','�̿���','0');
insert into member(member_id,member_passwd,member_name,member_gender,member_age)
values('user3','1234','�ڿ���','1',30);
insert into member(member_id,member_passwd,member_name,member_gender,member_age)
values('user4','1234','���̼�','0',40);
insert into member(member_id,member_passwd,member_name,member_gender,member_age)
values('user5','1234','�����','1',50);

alter table member modify member_age number(3) default 0;

commit;

select sysdate from dual;
--Employee ���̺� ������ 5�� �����ϴ� INSERT���� �ۼ� �� ����
insert into employee values('11111111','��ö��','ȸ���',3000000,'2021-01-01');
insert into employee values('11111112','�̿���','�渮��',2500000,'2022/01/05');
insert into employee values('11111113','�ڿ���','�ѹ���',3600000,'2022/09/15');
insert into employee values('11111114','���̼�','������',2200000,'2022/03/25');
insert into employee values('11111115','�����','���ߺ�',4500000,'2022/11/25');

--������ ��ȸ
-- * --> ��ü �÷�
select * from student;
--�л� ���̺� �̸�, �й� �� ��ȸ
select student_name, student_no from student;
--������ 2.0 �ʰ��� �л� ����� ��ȸ
select * from student where score > 2.0;
--������ 3.0 ������ �л� ����� ��ȸ
select * from student where score <= 3.0;
--������ 2.0�̻� 3.0������ �л� ����� ��ȸ
select * from student where score >= 2.0 and score <= 3.0;
--���ǽĿ��� ���� ������ ���� �� : �÷��� between A and B --> A���� B����
select * from student where score between 2.0 and 3.0;
--������ 3.0�� �л��� ��ȸ
select * from student where score = 3.0;
--������ 3.0�� �ƴ� �л��鸸 ��ȸ






