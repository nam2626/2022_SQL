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
select concat('010', concat('1111','1234')) from dual;
--문자열 붙이는 연산자 ||
select '010' || '1111' || '1234' from dual;
select student_no || student_name || major_name || score from student;
select 'drop table ' || table_name || ';' from user_tables;
--문자열 추출
--SUBSTR : 문자열 부분 추출(문자 기준으로 추출)
select substr('1234567890', 5,4) from dual;
select substr('안녕하세요',2,3) from dual;
--주민등록번호 '841113-1246121' --> '841113-1******' 마스킹 처리
select substr('841113-1246121',1,8) || '******' from dual;
--바이트 단위로 문자열 추출
SELECT SUBSTRB('안녕하세요',2,3) FROM DUAL;
--문자열 검색 INSTR - 검색결과가 있으면 0보다 큰 값, 검색 결과가 없으면 0
select instr('abcdefg','cd') from dual;
select instr('abcdefg','cdf') from dual;
--HELLO WORLD에 공백이 있는지 체크
select instr('HELLO WORLD',' ') from dual;
--테이블 NAME 컬럼에 공백을 넣지 않는 조건
--check(instr(NAME,' ') = 0) -->이런 형태로 테이블의 제약조건에 들어감
--문자열 바꾸기
select replace('AAAAAAABBBBBCCCC','B','F') from dual;
--학생테이블에서 데이터들 중 이름 컬럼에 공백이 있는 학생의 이름을 공백을 지워서 업데이트 하시오.
update student set student_name = replace(student_name, ' ', '') 
where instr(student_name, ' ') <> 0;
--LPAD, RPAD --> 원하는 문자열 개수만큼 남은 부분에 지정한 문자열로 채워주는 함수
SELECT RPAD('871211-1',14,'*') FROM DUAL;
SELECT LPAD('871211-1',14,'*') FROM DUAL;
SELECT LPAD('ABC',10,'1234') FROM DUAL;
SELECT RPAD('ABC',10,'1234') FROM DUAL;
--LTRIM, RTRIM : 좌우에 지정한 문자열을 제거
SELECT LTRIM('AAAABBBBBCCCCCDDDDDDAAAAA','A') FROM DUAL;
SELECT RTRIM('AAAABBBBBCCCCCDDDDDDAAAAA','A') FROM DUAL;
--TRIM : 필요없는 좌우 공백을 제거
SELECT TRIM('    A A B     ') FROM DUAL;
SELECT length(TRIM('    A A B     ')) FROM DUAL;
-----------------------------------------------------------------------------------
--ROUND : 원하는 자리수에서 반올림
select round(123.456,-2) from dual;
select round(123.456,-1) from dual;
select round(123.456,0) from dual;
select round(123.456,1) from dual;
select round(123.456,2) from dual;
--TRUNC : 원하는 자리수에서 데이터를 자름
select trunc(123.456,-2) from dual;
select trunc(123.456,-1) from dual;
select trunc(123.456,0) from dual;
select trunc(123.456,1) from dual;
select trunc(123.456,2) from dual;
--올림 : ceil, 내림 : floor
select ceil(123.456), floor(123.456) from dual;
--나머지 나누기
select mod(5 , 4) from dual;
--POWER(N,M) : N의 M승
SELECT POWER(2,10) FROM DUAL;
--TO_NUMBER('문자열') : 문자열을 숫자로 바꿔주는 함수
select '123' + 123,TO_NUMBER('123') + 123 from dual;
--------------------------------------------------------------------------------
--날짜 시간
--현재 날짜 시간 조회
select sysdate from dual;
--오라클에서 지정된 현재 날짜 시간의 출력 포멧을 변경
ALTER SESSION SET NLS_DATE_FORMAT = 'YYYY-MM-DD HH24:MI:SS';
ALTER SESSION SET NLS_DATE_FORMAT = 'YY/MM/DD';

--오늘 날짜부터 지정날짜까지 남은 개월 수
select abs(months_between(sysdate,'22/12/31')) from dual;
--지정 날짜로부터 몇 개월 후 날짜
select add_months(sysdate,2) from dual;
--주어진 날짜 기준으로 돌아오는 날짜(원하는 요일)
select next_day(sysdate,'화') from dual;
--주어진 날짜 기준으로 날짜가 속한 달의 마지막 날
select last_day(sysdate) from dual;

--내일 날짜 출력
select sysdate + 1 from dual;
--문자열을 날짜로 변경
select to_date('2022-12-31','YYYY-MM-DD') from dual;
--연말까지 D-DAY 출력
select ceil(to_date('22/12/31') - sysdate) from dual;
select ceil(to_date('2022-12-31','YYYY-MM-DD') - sysdate) from dual;

--TO_CHAR(데이터, '형식') 문자열로 변환
SELECT TO_CHAR(SYSDATE,'YYYY-MM-DD') FROM DUAL;
SELECT TO_CHAR(SYSDATE,'MON MONTH DY DAY') FROM DUAL;

-------------------------------------------------------
---그룹함수 : SUM, AVG, MAX, MIN, COUNT, STDDEV, VARIANCE
-- SUM(컬럼명) : 그룹을 묶은 기준으로 해당 컬럼을 가지고 합을 구함
-- 학과별 평점 총합을 조회 - SUM
SELECT major_name, SUM(score) FROM STUDENT GROUP BY major_name;
-- 학과별 평점 평균을 조회, 평균값은 소수 둘째짜리까지만 표시 - AVG
SELECT major_name, TRUNC(AVG(score),2) AS AVG_SCORE FROM STUDENT GROUP BY major_name;
-- 학과별 평점의 최대값, 최소값 조회
SELECT major_name, MAX(SCORE), MIN(SCORE) FROM STUDENT GROUP BY major_name;
-- 전체 평점의 최대값/최소값/총합
SELECT MAX(SCORE), MIN(SCORE),SUM(SCORE), AVG(SCORE) FROM STUDENT;
-- 학과별 인원수 조회
SELECT major_name, COUNT(*) FROM STUDENT GROUP BY major_name;
-- 학과별 평점의 표준편차와 분산의 결과를 조회
SELECT major_name, STDDEV(SCORE), VARIANCE(SCORE) FROM STUDENT GROUP BY major_name;
--학과별 인원수를 조회, 단 평점이 3.0 이상인 학생들만 대상으로 인원수를 조회
SELECT major_name, count(score) FROM STUDENT
WHERE score >= 3 GROUP BY major_name;
--학과별 평점의 평균을 조회, 단 학과별 인원수가 3명 이상인 학과들만 대상으로 조회
select major_name, TRUNC(AVG(score),2) AS AVG_SCORE FROM STUDENT
GROUP BY major_name having count(*) >= 3;
--성씨별 학생들 인원수와 평점을 출력
select substr(student_name,1,1), count(*), avg(score) from student
group by substr(student_name,1,1);
--학과별 지원금 배정, 학과별 지원금 = 학과별 인원수 * 25000
--학과명, 인원수, 지원금



