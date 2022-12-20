--DRUG_SELL ���̺� DRUG_NAME�� DRUG_COMPANY �� �ε����� �ۼ�
--DRUG_SELL_IDX
CREATE INDEX DRUG_SELL_IDX ON DRUG_SELL(DRUG_NAME,DRUG_COMPANY);
ALTER INDEX DRUG_SELL_IDX REBUILD;

--������
create sequence car_sell_seq;
drop SEQUENCE car_sell_seq;

create sequence car_sell_seq
start with 100
maxvalue 120
minvalue 100
increment by 1
cycle;
--���� ������ ������
SELECT CAR_SELL_SEQ.NEXTVAL FROM DUAL;
--���� ���� ������
SELECT CAR_SELL_SEQ.CURRVAL FROM DUAL;
--���۰��� 20���� ������ ���� 35�̸�, 1�� ����, ��ȯ X
CREATE SEQUENCE START_SEQ
START WITH 20
MAXVALUE 35
NOCYCLE;

SELECT START_SEQ.NEXTVAL FROM DUAL;
--������ �����ϴ� �κ� START WITH�� ���� �Ұ�
ALTER SEQUENCE START_SEQ
MAXVALUE 35
MINVALUE 20
NOCYCLE
NOCACHE;

--DRUG_SELL ���̺� �� �������� �ۼ�
--���۰��� 1001, �ִ밪 X, 1�� ����, ��ȯ X
CREATE SEQUENCE DRUG_SELL_SEQ
START WITH 1001
NOMAXVALUE
INCREMENT BY 1
NOCYCLE;

INSERT INTO DRUG_SELL 
VALUES(DRUG_SELL_SEQ.NEXTVAL,'��ǰ��','������',22,TO_DATE('2022-11-15','YYYY-MM-DD'));

--�л����� ��ȸ - ������ ��� �̻��� �л��� ��ȸ
--�й� �̸� �а��� ����
select s.student_no, s.student_name, m.major_name, s.score from student s, major m
where s.major_no = m.major_no and s.score >= (select avg(score) from student);

create or replace view student_view
as 
select s.student_no, s.student_name, m.major_name, s.score from student s, major m
where s.major_no = m.major_no;

select * from student_view where score >= (select avg(score) from student);

--�ִ� �ǸŰ��� �ּ� �ǸŰ��� ���� ������ ������ ��ȸ �� �� �ش� ������ ��� ����
--car_id, car_name, maker_name, price
create or replace view car_mxmn_price_view
as
select c.car_id, c.car_name, cm.maker_name, c.price from car c, car_maker cm
where c.maker_no = cm.maker_no and c.price 
in((select max(price) from car),(select min(price) from car));

select * from car_mxmn_price_view;

--���̺� ����
create table book(
    isbn varchar2(12) primary key,
    title varchar2(50),
    writer_no varchar2(10) not null,
    publisher_no varchar2(10) not null,
    money number(7));

create table publisher(
    publisher_no varchar2(10) primary KEY,
    publisher_name varchar2(30)
);
create table writer(
    writer_no varchar2(10) primary KEY,
    writer_name varchar2(30)
);

insert into writer values('W0001', 'ȫ�浿');
insert into writer values('W0002', '������');
insert into writer values('W0003', '������');
insert into writer values('W0004', '���μ�');
insert into writer values('W0005', '��ü�');

insert into publisher values('P0001','â�ۻ�');
insert into publisher values('P0002','��ǻ�� �̵��');
insert into publisher values('P0003','��Ʈ�� ����');
insert into publisher values('P0004','�ڸ�');
insert into publisher values('P0005','������');

insert into book values('1111111111', '�̰��� ��������', 'W0001', 'P0001', 36000);
insert into book values('2222222222', '�ڷᱸ��', 'W0001', 'P0002', 18900);
insert into book values('3333333333', '������ ����', 'W0002', 'P0003', 23000);
insert into book values('4444444444', '�ڹ��� ����', 'W0003', 'P0003', 45800);
insert into book values('5555555555', '�ȵ���̵� ������ ����', 'W0003', 'P0003', 26700);

SAVEPOINT DATA_FIN;

insert into book values('666666', '�ȵ���̵� ������ ����', 'W0003', 'P0003', 26700);

ROLLBACK TO DATA_FIN;
--�ε��� ����
CREATE INDEX BOOK_INDEX ON BOOK(TITLE,WRITER_NO);
--������ �������� ���� ���ڵ��� ��� ��ȸ
SELECT W.* FROM WRITER W, BOOK B WHERE W.WRITER_NO = B.WRITER_NO(+) AND B.ISBN IS NULL;
SELECT W.* FROM WRITER W WHERE W.WRITER_NO NOT IN (SELECT B.WRITER_NO FROM BOOK B);
--�������� ��ȸ�� ISBN, TITLE, WRITER_NAME, PUBLISHER_NAME, MONEY
SELECT B.ISBN, B.TITLE, W.WRITER_NAME, P.PUBLISHER_NAME, B.MONEY FROM WRITER W, BOOK B, PUBLISHER P 
WHERE W.WRITER_NO = B.WRITER_NO AND P.PUBLISHER_NO = B.PUBLISHER_NO;
--��� �ۼ�
CREATE OR REPLACE VIEW BOOK_VIEW
AS 
SELECT B.ISBN, B.TITLE, W.WRITER_NAME, P.PUBLISHER_NAME, B.MONEY FROM WRITER W, BOOK B, PUBLISHER P 
WHERE W.WRITER_NO = B.WRITER_NO AND P.PUBLISHER_NO = B.PUBLISHER_NO;

