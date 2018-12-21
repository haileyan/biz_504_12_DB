--여기는 user22접속 화면입니다.
CREATE TABLE tbl_test1(
    str_num CHAR(3) PRIMARY KEY,
    intKor NUMBER(3),
    intEng NUMBER(3),
    intMath NUMBER(3)
);

DROP TABLE tbl_test1;

--표준형식의 PK 설정 : 기본적으로 테이블 내에 PK는 하나만 설정할 수 있음
CREATE TABLE tbl_users(
    str_num CHAR(3),
    str_name nVARCHAR2(20),
    str_tel CHAR(15),
    PRIMARY KEY(str_num)
);

INSERT INTO tbl_users
VALUES('001', '홍길동', '010-111-1111'); 

INSERT INTO tbl_users
VALUES('002', '성춘향', '010-222-1111');

INSERT INTO tbl_users
VALUES('003', '이몽룡', '010-333-1111');

INSERT INTO tbl_users
VALUES('004', '장길산', '010-444-1111');

INSERT INTO tbl_users
VALUES('005', '임꺽정', '010-555-1111');

SELECT *
FROM tbl_users;

INSERT INTO tbl_test1
VALUES('001', ROUND(DBMS_RANDOM.VALUE(100,50),0),
              ROUND(DBMS_RANDOM.VALUE(100,50),0),
              ROUND(DBMS_RANDOM.VALUE(100,50),0));

INSERT INTO tbl_test1
VALUES('002', ROUND(DBMS_RANDOM.VALUE(100,50),0),
              ROUND(DBMS_RANDOM.VALUE(100,50),0),
              ROUND(DBMS_RANDOM.VALUE(100,50),0));
              
INSERT INTO tbl_test1
VALUES('003', ROUND(DBMS_RANDOM.VALUE(100,50),0),
              ROUND(DBMS_RANDOM.VALUE(100,50),0),
              ROUND(DBMS_RANDOM.VALUE(100,50),0));
              
INSERT INTO tbl_test1
VALUES('004', ROUND(DBMS_RANDOM.VALUE(100,50),0),
              ROUND(DBMS_RANDOM.VALUE(100,50),0),
              ROUND(DBMS_RANDOM.VALUE(100,50),0));
              
INSERT INTO tbl_test1
VALUES('005', ROUND(DBMS_RANDOM.VALUE(100,50),0),
              ROUND(DBMS_RANDOM.VALUE(100,50),0),
              ROUND(DBMS_RANDOM.VALUE(100,50),0));

SELECT *
FROM tbl_test1;

SELECT *
FROM tbl_users
ORDER BY str_num;

--학생의 점수를 관리하는 table을 설계하는데 가장 일반적인 방법은
--학번, 이름, 국어, 영어, 수학, 총점, 평균
--필요한 칼럼을 모두 포함하는 테이블을 생성할 수 있다.
--학번, 이름, 전화번호, 주소, 국어, 영어, 수학, 총점, 평균

--필요한 칼럼을 모두 포함하는 테이블을 생성 할 수 있다.

--하지만 DB적인 관점에서는 한 개의 테이블에 필요한 칼럼을
--모두 나열하는 것은 매우 바람직 하지 않다.
--DB관점에서는 필요한 정보들끼리 table을 별도로 생성해서 DATA를 관리한다.

--학생정보는 : tbl_users 테이블에 있고
--점수정보는 : tbl_test1 테이블에 있게 하는 것이 좋다.

--하지만, 이렇게 테이블을 분리하면 점수정보를 보면서 학생정보를 같이 조회하고 싶을 때 어려움 발생
--그래서 표준 SQL에는 두개의 table.을 연결(JOIN)해서
--마치 1개의 테이블처럼 데이터를 볼 수 있는 기능을 제공한다.

--두개의 테이블 정보를 모두 보고 싶다. "그냥...?"
SELECT * FROM tbl_test1, tbl_users;

--두개의 table을 조회(read, select)할 때
--나누어진 다수의 table을 묶어서(JOIN) 보여주는 기법 -->> JOIN(EQUAL JOIN)이라고 한다~가장 단순하고, 보편적 

SELECT * FROM tbl_test1, tbl_users
WHERE tbl_test1.str_num = tbl_users.str_num;           

--테이블에 별명 붙이기
--복잡한 SQL문(SELECT)의 설정사항을 table처럼 등록하고, table을 select하는 방법으로 사용할 수 있다.
-- >> VIEW라고 한다.
CREATE VIEW myJoin
AS
SELECT t.str_num AS TNum,
       u.str_num AS UNum,
       u.str_name,
       t.intKor,
       t.intEng,
       t.intMath
FROM tbl_test1 T, tbl_users U       
WHERE t.str_num = u.str_num(+)
ORDER BY t.str_num;       

SELECT * FROM myJoin;
DROP VIEW myJoin;

SELECT * FROM myJoin
WHERE TNum = '002';

SELECT T.str_num,
       U.str_num,
       T.intKor,
       T.intEng,
       T.intMath
FROM tbl_test1 T LEFT JOIN tbl_users U  --변경이 자주 되는 테이블을 왼쪽에 
     ON t.str_num = u.str_num;


--test1 테이블에 점수만 하나 추가한다.
INSERT INTO tbl_test1
VALUES ('006', 90, 90,100);

ROLLBACK; --커밋 실행하면 소용없음


--DCL명령
--지금 현재 tbl_users, tbl_test1 테이블에 데이터를 추가했다.
--하지만, 아직 물리적 저장 공간에는 적용이 안된 상태이다.
--현재 데이터는 오라클의 임시저장 영역에 저장이 되어있다.
--임시저장 영역에 저장된 데이터를 물리적 저장 공간에 저장하는 키워드를 학습
COMMIT; --모든 저장내용을 물리적 저장 공간에 반영하라
SELECT * FROM tbl_test1;












