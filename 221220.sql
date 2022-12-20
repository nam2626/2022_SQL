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










