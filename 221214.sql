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




