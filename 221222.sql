SELECT * FROM STUDENT s ORDER BY MAJOR_NO ASC ; --오름차순 정렬
SELECT * FROM STUDENT s ORDER BY MAJOR_NO DESC  ; --내림차순 정렬

--평점이 높은 순서대로 조회 - 학번 이름 학과명 평점
SELECT s.STUDENT_NO ,s.STUDENT_NAME ,m.MAJOR_NAME ,s.SCORE 
FROM STUDENT s , MAJOR m WHERE s.MAJOR_NO = m.MAJOR_NO 
ORDER BY s.SCORE DESC ;
--학과별 평점의 평균 --> 평균이 높은 순서대로 조회
SELECT s.MAJOR_NO , avg(s.SCORE) FROM STUDENT s 
GROUP BY s.MAJOR_NO  ORDER BY avg(s.score) desc;
--학생정보 전체 조회시 rownum을 이용해서 조회 평점이 높은 순서대로 조회
SELECT rownum, s.* FROM (SELECT * FROM STUDENT s ORDER BY s.SCORE DESC) s ;
--RANK 함수
--평점을 기준으로 순위를 매겨서 조회
SELECT RANK() over(ORDER BY s.score DESC), s.* FROM STUDENT s ;
--평점을 기준으로 탑3 학생들을 조회
SELECT * FROM (SELECT RANK() over(ORDER BY s.score DESC) AS RANK_NO, s.* FROM STUDENT s) 
WHERE RANK_NO <= 3;

SELECT * FROM (SELECT RANK() over(ORDER BY s.score DESC) AS RANK_NO, s.STUDENT_NO ,s.STUDENT_NAME , m.MAJOR_NAME , s.SCORE  FROM STUDENT s, MAJOR m WHERE s.MAJOR_NO = m.MAJOR_NO) WHERE RANK_NO <= 3;




