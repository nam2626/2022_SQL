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









