--����纰 �Ǹ� ����(ea) ����� ��ȸ
select drug_company, avg(ea) from drug_sell group by drug_company;
--��ǰ�� �Ǹ� ����(ea) ������ ��ȸ
select drug_name, sum(ea) from drug_sell group by drug_name;