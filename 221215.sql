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
select concat('010', concat('1111','1234')) from dual;
--���ڿ� ���̴� ������ ||
select '010' || '1111' || '1234' from dual;
select student_no || student_name || major_name || score from student;
select 'drop table ' || table_name || ';' from user_tables;
--���ڿ� ����
--SUBSTR : ���ڿ� �κ� ����(���� �������� ����)
select substr('1234567890', 5,4) from dual;

