--게시판 DB
--게시글 테이블
CREATE TABLE BOARD(
	BOARD_NO NUBMER(10) PRIMARY KEY,
	BOARD_TITLE VARCHAR2(150) NOT NULL,
	WRITER VARCHAR2(20) NOT NULL,
	WRITER_DATE DATE DEFAULT SYSDATE,
	BOARD_COUNT NUMBER DEFAULT 0,
	CONTENT VARCHAR2(2000) NOT NULL
);
-- 파일 테이블
CREATE TABLE FILE_TABLE(
	BOARD_NO NUBMER(10) NOT NULL,
	FILE_URL VARCHAR2(50) NOT NULL
);
--게시글 좋아요 테이블
CREATE TABLE BOARD_LIKE(
	BOARD_NO NUBMER(10) NOT NULL,
	MEMBER_ID VARCHAR2(20) NOT NULL
);
--게시글 싫어요 테이블
CREATE TABLE BOARD_HATE(
	BOARD_NO NUBMER(10) NOT NULL,
	MEMBER_ID VARCHAR2(20) NOT NULL
);
--댓글 테이블
CREATE TABLE COMMENT(
	COMMENT_NO NUMBER(30) PRIMARY KEY,
	COMMENT_CONTENT VARCHAR2(150) NOT NULL,
	WRITER VARCHAR2(20) NOT NULL,
	WRITE_DATE DATE DEFAULT SYSDATE,
	BOARD_NO NUMBER(10)
);
--댓글 좋아요
CREATE TABLE COMMENT_LIKE(
	COMMENT_NO NUBMER(30) NOT NULL,
	MEMBER_ID VARCHAR2(20) NOT NULL
);
--댓글 싫어요
CREATE TABLE COMMENT_HATE(
	COMMENT_NO NUBMER(30) NOT NULL,
	MEMBER_ID VARCHAR2(20) NOT NULL
);
--회원 테이블
CREATE TABLE BOARD_MEMBER(
	MEMBER_ID VARCAHR2(20) PRIMARY KEY,
	PASSWD VARCHAR2(50) NOT NULL,
	NAME VARCHAR2(30) NOT NULL,
	EMAIL VARCHAR2(100) NOT NULL,
	TEL VARCHAR2(11) NOT NULL
);









