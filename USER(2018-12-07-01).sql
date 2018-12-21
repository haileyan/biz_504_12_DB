--여기는 USER1으로 접속한 화면

--DDL CREATE TABLE과
--DML INSERT SELECT UPDATE DELETE를 전반적으로 봤다.
--옵션들을 추가해서 명령들을 학습

CREATE TABLE tbl_student(
    st_num CHAR(7) PRIMARY KEY,
    st_name nVARCHAR2(20)NOT NULL,
    st_tel nVARCHAR2(15),
    st_age NUMBER(3)
);

SELECT *
FROM tbl_student;

INSERT INTO tbl_student
VALUES('001', '이몽룡', '010-111-1234', 19);

--이미 생성하고 데이터가 추가된 tbl_student에 주소 칼럼이 누락된 것이 발견되었다.
--그래서 tbl_student TABLE에 주소 칼럼을 추가하려고 한다.
--기존 테이블을 변경
--DDL 명령 체계
--생성:CREATE-USER, TABLE, INDEX
--제거:DROP-USER, TABLE, INDEX
--변경:ALTER-USER, TABLE...
ALTER TABLE tbl_student ADD st_addr nVARCHAR2(125);

INSERT INTO tbl_student
VALUES('002', '성춘향', '010-222-2222', 16, '익산시');
--현재 테이블 구조상 추가할 때
--학번, 이름, 전화번호, 나이, 주소순으로 데이터를 추가해야한다.
--그런데 원고에는 학번, 이름, 나이, 주소, 전화번호 순으로 작성 되어있다.
--그러다보니 자꾸 입력 실수를 하게 된다.
--그래서, INSERT문의 옵션을 사용해서 순서를 바꾸고자 한다.

INSERT INTO tbl_student(st_num, st_name, st_age, st_addr, st_tel)
VALUES ('003', '홍길동', 12, '서울시', '010-333-3333');
--INSERT를 실행 할 때 TABLE(칼럼 리스트)형식으로 작성을 하면
--원래 TABLE의 칼럼 순서와 무관하게 데이터 추가를 할 수 있다.

UPDATE tbl_student
SET st_addr = '광주시'
WHERE st_num = 1;


CREATE TABLE tbl_score(
    st_num CHAR(7),
    st_kor NUMBER(3),
    st_eng NUMBER(3),
    st_math NUMBER(3)
);

INSERT INTO tbl_score(st_num) VALUES('001');
INSERT INTO tbl_score(st_num) VALUES('002');
INSERT INTO tbl_score(st_num) VALUES('003');
INSERT INTO tbl_score(st_num) VALUES('004');
INSERT INTO tbl_score(st_num) VALUES('005');
INSERT INTO tbl_score(st_num) VALUES('006');
INSERT INTO tbl_score(st_num) VALUES('007');

SELECT *
FROM tbl_score;

UPDATE tbl_score
SET st_kor = 30, st_eng = 80, st_math = 100
WHERE st_num = '001';

UPDATE tbl_score
SET st_kor = 75, st_eng = 88, st_math = 100
WHERE st_num = '002';

UPDATE tbl_score
SET st_kor = 90, st_eng = 95, st_math = 70
WHERE st_num = '003';

UPDATE tbl_score
SET st_kor = 100, st_eng = 85, st_math = 90
WHERE st_num = '004';

UPDATE tbl_score
SET st_kor = 70, st_eng = 100, st_math = 85
WHERE st_num = '005';

UPDATE tbl_score
SET st_kor = 95, st_eng = 95, st_math = 100
WHERE st_num = '006';

UPDATE tbl_score
SET st_kor = 85, st_eng = 90, st_math = 90
WHERE st_num = '007';


SELECT st_kor, st_eng, st_math,
        st_kor + st_eng + st_math AS 총점
FROM tbl_score;

--각 칼럼의 합계,평균를 계산해서 별도 칼럼으로 보여주는 방법
SELECT st_kor AS 국어점수,
       st_eng AS 영어점수,
       st_math AS 수학점수,
       (st_kor + st_eng + st_math) AS 총점,
       (st_kor + st_eng + st_math)/3 AS 평균
FROM tbl_score;    

--각 칼럼의 묶음총점을 계산 할 때는
--SUM(칼럼) 형식의 함수를 사용한다.
SELECT SUM(st_kor)AS 국어총점,
       SUM(st_eng)AS 영어총점,
       SUM(st_math)AS 수학총점
FROM tbl_score;       

SELECT *
FROM tbl_score;

--SQL에서는 문자(열)을 범위 설정하여 검색값을 사용할 수 있다.
--이 때 검색범위로 설정할 칼럼에 저장 문자열은
--문자열의 길이가 모두 동일 해야한다.
--또한, 그러한 칼럼은 CHAR형으로 선언하는 것이 좋다.

SELECT *
FROM tbl_score
WHERE st_num >= '003' AND st_num <= '005';

SELECT st_kor AS 국어점수,
       st_eng AS 영어점수,
       st_math AS 수학점수,
       (st_kor + st_eng + st_math) AS 총점,
       ROUND (st_kor + st_eng + st_math/3,2) AS 평균
       --ROUND함수는 ROUND(값, 소수자릿수)형식이며
       --소수자릿수 +1에서 반올림하여 소수자릿수까지 표현한다.
       --예) ROUND(3.2342342, 2) => 3.23
       --    ROUND(3.2364321, 2) => 3.24
FROM tbl_score;    

--ORACLE 전용함수
--50부터 100까지의 정수값 난수 발생
SELECT ROUND(DBMS_RANDOM.VALUE(50,100),0)FROM DUAL;

--DUAL TABLE
--  간단 계산식을 계산해 보거나
--  내장 함수등을 테스트 해보고자 할때 사용하는 DUMMY TABLE
--  ORACLE 문법 구조상 SELECT 다음에 FROM이 없으면 오류가 발생하므로
--  임시로 사용할 수 있는 DUMMY TABLE을 만들어 두었다.
SELECT * FROM DUAL;
SELECT 30*40 FROM DUAL;

SELECT DBMS_RANDOM.VALUE(50,100) AS 난수 FROM DUAL;
SELECT ROUND(DBMS_RANDOM.VALUE(50,100),0) AS 난수 FROM DUAL;

UPDATE tbl_score
SET st_kor = ROUND(DBMS_RANDOM.VALUE(50,100),0),
    st_eng = ROUND(DBMS_RANDOM.VALUE(50,100),0),
    st_math = ROUND(DBMS_RANDOM.VALUE(50,100),0)
WHERE st_num = '001';

UPDATE tbl_score
SET st_kor = ROUND(DBMS_RANDOM.VALUE(50,100),0),
    st_eng = ROUND(DBMS_RANDOM.VALUE(50,100),0),
    st_math = ROUND(DBMS_RANDOM.VALUE(50,100),0)
WHERE st_num = '002';

UPDATE tbl_score
SET st_kor = ROUND(DBMS_RANDOM.VALUE(50,100),0),
    st_eng = ROUND(DBMS_RANDOM.VALUE(50,100),0),
    st_math = ROUND(DBMS_RANDOM.VALUE(50,100),0)
WHERE st_num = '003';

UPDATE tbl_score
SET st_kor = ROUND(DBMS_RANDOM.VALUE(50,100),0),
    st_eng = ROUND(DBMS_RANDOM.VALUE(50,100),0),
    st_math = ROUND(DBMS_RANDOM.VALUE(50,100),0)
WHERE st_num = '004';

UPDATE tbl_score
SET st_kor = ROUND(DBMS_RANDOM.VALUE(50,100),0),
    st_eng = ROUND(DBMS_RANDOM.VALUE(50,100),0),
    st_math = ROUND(DBMS_RANDOM.VALUE(50,100),0)
WHERE st_num = '005';

UPDATE tbl_score
SET st_kor = ROUND(DBMS_RANDOM.VALUE(50,100),0),
    st_eng = ROUND(DBMS_RANDOM.VALUE(50,100),0),
    st_math = ROUND(DBMS_RANDOM.VALUE(50,100),0)
WHERE st_num = '006';

UPDATE tbl_score
SET st_kor = ROUND(DBMS_RANDOM.VALUE(50,100),0),
    st_eng = ROUND(DBMS_RANDOM.VALUE(50,100),0),
    st_math = ROUND(DBMS_RANDOM.VALUE(50,100),0)
WHERE st_num = '007';







