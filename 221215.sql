--DUAL �ӽ����̺�, ���� Ȯ���ϴ� �뵵
select 'HELLO' from dual;
--���ڿ�
--INITCAP : �� �ܾ ù���ڸ� �빮�ڷ� ����
select INITCAP('hello') from dual;
select INITCAP('hello hello') from dual;
--LOWER : ���ĺ� ���� �ҹ��ڷ� ����
--UPPER : ���ĺ� ���� �빮�ڷ� ����
select LOWER('Hello World'), UPPER('Hello World') from dual;
--LENGTH : ���� ������ ���ϴ� �Լ�
select LENGTH('HELLO'), LENGTH('�ȳ��ϼ���') from dual;
--LENGTHB : ���� ����Ʈ�� ���ϴ� �Լ�
select LENGTHB('HELLO'), LENGTHB('�ȳ��ϼ���') from dual;
--���ڿ� ��ġ��
--CONCAT : �� ���ڿ��� �ϳ��� ��ġ��
select CONCAT('Hello','World') from dual;
--��ȭ��ȣ �����Ͱ� '010' '1111' '1234'�� CONCAT �Լ��� �̿��ؼ� �ϳ��� ���ڿ��� ��ġ��




