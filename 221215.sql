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
select substr('�ȳ��ϼ���',2,3) from dual;
--�ֹε�Ϲ�ȣ '841113-1246121' --> '841113-1******' ����ŷ ó��
select substr('841113-1246121',1,8) || '******' from dual;
--����Ʈ ������ ���ڿ� ����
SELECT SUBSTRB('�ȳ��ϼ���',2,3) FROM DUAL;
--���ڿ� �˻� INSTR - �˻������ ������ 0���� ū ��, �˻� ����� ������ 0
select instr('abcdefg','cd') from dual;
select instr('abcdefg','cdf') from dual;
--HELLO WORLD�� ������ �ִ��� üũ
select instr('HELLO WORLD',' ') from dual;
--���̺� NAME �÷��� ������ ���� �ʴ� ����
--check(instr(NAME,' ') = 0) -->�̷� ���·� ���̺��� �������ǿ� ��
--���ڿ� �ٲٱ�
select replace('AAAAAAABBBBBCCCC','B','F') from dual;
--�л����̺��� �����͵� �� �̸� �÷��� ������ �ִ� �л��� �̸��� ������ ������ ������Ʈ �Ͻÿ�.
update student set student_name = replace(student_name, ' ', '') 
where instr(student_name, ' ') <> 0;
--LPAD, RPAD --> ���ϴ� ���ڿ� ������ŭ ���� �κп� ������ ���ڿ��� ä���ִ� �Լ�
SELECT RPAD('871211-1',14,'*') FROM DUAL;
SELECT LPAD('871211-1',14,'*') FROM DUAL;
SELECT LPAD('ABC',10,'1234') FROM DUAL;
SELECT RPAD('ABC',10,'1234') FROM DUAL;
--LTRIM, RTRIM : �¿쿡 ������ ���ڿ��� ����
SELECT LTRIM('AAAABBBBBCCCCCDDDDDDAAAAA','A') FROM DUAL;
SELECT RTRIM('AAAABBBBBCCCCCDDDDDDAAAAA','A') FROM DUAL;
--TRIM : �ʿ���� �¿� ������ ����
SELECT TRIM('    A A B     ') FROM DUAL;
SELECT length(TRIM('    A A B     ')) FROM DUAL;
-----------------------------------------------------------------------------------
--ROUND : ���ϴ� �ڸ������� �ݿø�
select round(123.456,-2) from dual;
select round(123.456,-1) from dual;
select round(123.456,0) from dual;
select round(123.456,1) from dual;
select round(123.456,2) from dual;
--TRUNC : ���ϴ� �ڸ������� �����͸� �ڸ�
select trunc(123.456,-2) from dual;
select trunc(123.456,-1) from dual;
select trunc(123.456,0) from dual;
select trunc(123.456,1) from dual;
select trunc(123.456,2) from dual;
--�ø� : ceil, ���� : floor
select ceil(123.456), floor(123.456) from dual;
--������ ������
select mod(5 , 4) from dual;
--POWER(N,M) : N�� M��
SELECT POWER(2,10) FROM DUAL;
--TO_NUMBER('���ڿ�') : ���ڿ��� ���ڷ� �ٲ��ִ� �Լ�
select '123' + 123,TO_NUMBER('123') + 123 from dual;







