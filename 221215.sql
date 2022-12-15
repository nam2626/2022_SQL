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
--------------------------------------------------------------------------------
--��¥ �ð�
--���� ��¥ �ð� ��ȸ
select sysdate from dual;
--����Ŭ���� ������ ���� ��¥ �ð��� ��� ������ ����
ALTER SESSION SET NLS_DATE_FORMAT = 'YYYY-MM-DD HH24:MI:SS';
ALTER SESSION SET NLS_DATE_FORMAT = 'YY/MM/DD';

--���� ��¥���� ������¥���� ���� ���� ��
select abs(months_between(sysdate,'22/12/31')) from dual;
--���� ��¥�κ��� �� ���� �� ��¥
select add_months(sysdate,2) from dual;
--�־��� ��¥ �������� ���ƿ��� ��¥(���ϴ� ����)
select next_day(sysdate,'ȭ') from dual;
--�־��� ��¥ �������� ��¥�� ���� ���� ������ ��
select last_day(sysdate) from dual;

--���� ��¥ ���
select sysdate + 1 from dual;
--���ڿ��� ��¥�� ����
select to_date('2022-12-31','YYYY-MM-DD') from dual;
--�������� D-DAY ���
select ceil(to_date('22/12/31') - sysdate) from dual;
select ceil(to_date('2022-12-31','YYYY-MM-DD') - sysdate) from dual;

--TO_CHAR(������, '����') ���ڿ��� ��ȯ
SELECT TO_CHAR(SYSDATE,'YYYY-MM-DD') FROM DUAL;
SELECT TO_CHAR(SYSDATE,'MON MONTH DY DAY') FROM DUAL;

-------------------------------------------------------
---�׷��Լ� : SUM, AVG, MAX, MIN, COUNT, STDDEV, VARIANCE
-- SUM(�÷���) : �׷��� ���� �������� �ش� �÷��� ������ ���� ����
-- �а��� ���� ������ ��ȸ - SUM
SELECT major_name, SUM(score) FROM STUDENT GROUP BY major_name;
-- �а��� ���� ����� ��ȸ, ��հ��� �Ҽ� ��°¥�������� ǥ�� - AVG
SELECT major_name, TRUNC(AVG(score),2) AS AVG_SCORE FROM STUDENT GROUP BY major_name;
-- �а��� ������ �ִ밪, �ּҰ� ��ȸ
SELECT major_name, MAX(SCORE), MIN(SCORE) FROM STUDENT GROUP BY major_name;
-- ��ü ������ �ִ밪/�ּҰ�/����
SELECT MAX(SCORE), MIN(SCORE),SUM(SCORE), AVG(SCORE) FROM STUDENT;
-- �а��� �ο��� ��ȸ
SELECT major_name, COUNT(*) FROM STUDENT GROUP BY major_name;
-- �а��� ������ ǥ�������� �л��� ����� ��ȸ
SELECT major_name, STDDEV(SCORE), VARIANCE(SCORE) FROM STUDENT GROUP BY major_name;
--�а��� �ο����� ��ȸ, �� ������ 3.0 �̻��� �л��鸸 ������� �ο����� ��ȸ
SELECT major_name, count(score) FROM STUDENT
WHERE score >= 3 GROUP BY major_name;
--�а��� ������ ����� ��ȸ, �� �а��� �ο����� 3�� �̻��� �а��鸸 ������� ��ȸ
select major_name, TRUNC(AVG(score),2) AS AVG_SCORE FROM STUDENT
GROUP BY major_name having count(*) >= 3;
--������ �л��� �ο����� ������ ���
select substr(student_name,1,1), count(*), avg(score) from student
group by substr(student_name,1,1);
--�а��� ������ ����, �а��� ������ = �а��� �ο��� * 25000
--�а���, �ο���, ������



