--DUAL 임시테이블, 값을 확인하는 용도
select 'HELLO' from dual;
--문자열
--INITCAP : 각 단어별 첫글자만 대문자로 변경
select INITCAP('hello') from dual;
select INITCAP('hello hello') from dual;
--LOWER : 알파벳 전부 소문자로 변경
--UPPER : 알파벳 전부 대문자로 변경
select LOWER('Hello World'), UPPER('Hello World') from dual;
--LENGTH : 글자 개수를 구하는 함수
select LENGTH('HELLO'), LENGTH('안녕하세요') from dual;
--LENGTHB : 글자 바이트수 구하는 함수
select LENGTHB('HELLO'), LENGTHB('안녕하세요') from dual;
--문자열 합치기
--CONCAT : 두 문자열을 하나로 합치기
select CONCAT('Hello','World') from dual;
--전화번호 데이터가 '010' '1111' '1234'를 CONCAT 함수를 이용해서 하나의 문자열로 합치기




