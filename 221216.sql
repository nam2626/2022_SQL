--제약사별 판매 개수(ea) 평균을 조회
select drug_company, avg(ea) from drug_sell group by drug_company;
--약품별 판매 개수(ea) 총합을 조회
select drug_name, sum(ea) from drug_sell group by drug_name;