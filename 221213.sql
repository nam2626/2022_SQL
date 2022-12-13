--���̺� ����
--�л� - �й�, �̸�, �а���, ����
create table student(
    student_no char(8 byte) primary key,
    student_name varchar2(5 byte),
    major_name varchar2(48 byte),
    score number(3,2)
);

--ȸ�������� �����ϴ� ���̺�
--���̵�, ��й�ȣ, �̸�, ����, ����
create table member(
    member_id varchar2(20 byte) primary key,
    member_passwd varchar2(50 byte),
    member_name varchar2(15 byte),
    member_gender char(1 byte),
    member_age number(3)
);
--��ǰ����
--��ǰ�ϷĹ�ȣ, ��ǰ��, �������, �ݾ�
create table product(
    product_no char(8 byte) primary key,
    product_name varchar2(50 byte),
    product_maker varchar2(50 byte),
    product_price number(10)
);

--���̺� ����
--DROP TABLE ���̺��;
drop table member;
drop table product;
drop table student;

--�������
--�����ȣ, �����, �μ���, ����
create table employee(
    employee_no char(8 byte) primary key,
    employee_name varchar2(15 byte),
    department_name varchar2(48 byte),
    salary number(10)
);
--������� ���̺� �Ի��� �÷��� �߰�
alter table employee add empl_date date;
alter table employee add empl_date date default sysdate;
--������� ���̺� �Ի��� �÷��� �⺻������ ���� ��¥ �ð��� ����ǰԲ� ����
alter table employee modify empl_date date default sysdate;

--��ǰ ���̺� ��� �߰�, ���� ����, �ִ� ����� 999�� ����
alter table product add stock number(3) default 0;
--�߰��� �÷� ��� number ����� 5 ���� > ���� ũ�⺸�� ũ�� �Ҷ��� ����
alter table product modify stock number(5) default 0;

--�÷� ����
--��ǰ ���̺��� ��� �÷��� ����
alter table product drop column stock;

--����� ����
--create user ���̵� identified by ��ȣ;
create user scott identified by tiger;
--��ȣ ����
alter user scott identified by 123456;
--���� ����
grant connect to scott;
--����� ���� ���ó��
alter user scott account lock;
--����� ���� ��� ���� ó�� 
alter user scott account unlock;


--��ü ����� ����
select * from dba_users;





