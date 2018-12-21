--여기는 관리자화면
CREATE USER myuser1 IDENTIFIED BY 1111;
--TABLESPACE를 SYSTEM 테이블 스페이스로 자동 지정
--실제 환경에서는 매우 위험한 방법

GRANT CREATE TABLE TO myuser1;
GRANT SELECT, UPDATE, INSERT ON [table] TO myuser1;

CREATE TABLESPACE mytsA
DATAFILE 'd:/bizwork/Ordata/mytsA.dbf'
SIZE 100M
AUTOEXTEND ON NEXT 100K;

--사용자등록을 실행한 후 테이블 스페이스를 만들지 않고 테이블 등을 생성하면 
--생성된 TABLE들은 SYSTEM TS에 생성되어 나중에 TS를 만든 후 옮기려면 많은 문제가 발생한다.
--따라서, 사용자를 생성하고 테이블을 만들기 전에 TS를 반드시 생성하고
--사용자의 DEFAULT TS를 지정해주어야 한다.
ALTER USER myuser1 DEFAULT TABLESPACE mytsA;

CREATE TABLE EMP_TABLE(
    EMPNO CHAR(6) PRIMARY KEY,
    EMPNAME nVARCHAR2(20) NOT NULL,
    EMPBIRTH CHAR(8),
    DEPTNO CHAR(3) NOT NULL,
    HREDATE CHAR(10) NOT NULL
);

DROP TABLE EMP_TABLE;

INSERT INTO EMP_TABLE
VALUES('170001', '홍길동', '880212', '001', '20181219');

INSERT INTO EMP_TABLE
VALUES('170002', '이몽룡', '770215', '003', '20181218');

INSERT INTO EMP_TABLE
VALUES('170003', '성춘향', '820513', '003', '20181217');

INSERT INTO EMP_TABLE
VALUES('170004', '장보고', '941102', '004', '20181220');

INSERT INTO EMP_TABLE
VALUES('170005', '임꺽정', '801212', '001', '20181216');

SELECT *
FROM EMP_TABLE;

UPDATE EMP_TABLE 
SET HREDATE = '2018-03-01'
WHERE EMPNAME = '장보고';
--UPDATE할 때는 반드시 PK값을 이용해서!!!!!!!하라!!!!!!!!
--위의 경우에서 이름으로 WHERE를 지정하면 동명이인이 있으면 데이터무결성을 해치게 됨.

--1.UPDATE를 하기 전에 변경하고자 하는 정보를 먼저 조회 해야 한다.
SELECT * FROM EMP_TABLE WHERE EMPNAME = '장보고';

--2.조회된 데이터 중에서 변경하고자 하는 데이터의 PK값을 입수한다.
--  이 경우의 PK:170004
UPDATE EMP_TABLE 
SET HREDATE = '2018-03-01'
WHERE EMPNO = '170004';
