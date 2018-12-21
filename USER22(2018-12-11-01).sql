--여기는 user22의 화면입니다.

CREATE TABLE tbl_grade(
    str_num CHAR(3) PRIMARY KEY,
    intKor NUMBER(3),
    intEng NUMBER(3),
    intMath NUMBER(3)
);

INSERT INTO tbl_grade
VALUES ('001', 85, 100, 90);

INSERT INTO tbl_grade
VALUES ('002', 95, 98, 100);

INSERT INTO tbl_grade
VALUES ('003', 88, 78, 96);

INSERT INTO tbl_grade
VALUES ('004', 100, 95, 100);

INSERT INTO tbl_grade
VALUES ('005', 75, 80, 86);

SELECT *
FROM tbl_grade;

--현재 입력된 데이터가 어쩌다보니 학번순서가 뒤섞여 입력이 되어있다.
--이 데이터를 학번순으로 보고싶다.
SELECT *
FROM tbl_grade
ORDER BY str_num; --정렬하기

SELECT *
FROM tbl_users
ORDER BY str_name;

SELECT *
FROM tbl_users
ORDER BY str_name DESC; --내림차순 정렬(DESCENDING)

--SUM, AVG 함수를 사용하자
SELECT SUM(intKor), SUM(intEng), SUM(intMath)
FROM tbl_grade;

--통계함수는 칼럼별로 묶어서 실행하는 함수들이다.

--각 학생의 총점을 계산하자
SELECT str_num, intKor, intEng, intMath,(intKor+intEng+intMath) AS 총점
FROM tbl_grade;

SELECT str_num, intKor, intEng, intMath,(intKor+intEng+intMath) AS 총점,
       (intKor+intEng+intMath)/3 AS 평균
FROM tbl_grade;

DELETE FROM tbl_grade;

INSERT INTO tbl_grade(str_num, intKor, intEng, intMath)
VALUES ('001',
    ROUND(DBMS_RANDOM.VALUE(50,100),0),
    ROUND(DBMS_RANDOM.VALUE(50,100),0),
    ROUND(DBMS_RANDOM.VALUE(50,100),0)
);

INSERT INTO tbl_grade(str_num, intKor, intEng, intMath)
VALUES ('002',
    ROUND(DBMS_RANDOM.VALUE(50,100),0),
    ROUND(DBMS_RANDOM.VALUE(50,100),0),
    ROUND(DBMS_RANDOM.VALUE(50,100),0)
);

INSERT INTO tbl_grade(str_num, intKor, intEng, intMath)
VALUES ('003',
    ROUND(DBMS_RANDOM.VALUE(50,100),0),
    ROUND(DBMS_RANDOM.VALUE(50,100),0),
    ROUND(DBMS_RANDOM.VALUE(50,100),0)
);

INSERT INTO tbl_grade(str_num, intKor, intEng, intMath)
VALUES ('004',
    ROUND(DBMS_RANDOM.VALUE(50,100),0),
    ROUND(DBMS_RANDOM.VALUE(50,100),0),
    ROUND(DBMS_RANDOM.VALUE(50,100),0)
);

INSERT INTO tbl_grade(str_num, intKor, intEng, intMath)
VALUES ('005',
    ROUND(DBMS_RANDOM.VALUE(50,100),0),
    ROUND(DBMS_RANDOM.VALUE(50,100),0),
    ROUND(DBMS_RANDOM.VALUE(50,100),0)
);

INSERT INTO tbl_grade(str_num, intKor, intEng, intMath)
VALUES ('006',
    ROUND(DBMS_RANDOM.VALUE(50,100),0),
    ROUND(DBMS_RANDOM.VALUE(50,100),0),
    ROUND(DBMS_RANDOM.VALUE(50,100),0)
);

INSERT INTO tbl_grade(str_num, intKor, intEng, intMath)
VALUES ( ROUND(DBMS_RANDOM.VALUE(0,999),0),
    ROUND(DBMS_RANDOM.VALUE(50,100),0),
    ROUND(DBMS_RANDOM.VALUE(50,100),0),
    ROUND(DBMS_RANDOM.VALUE(50,100),0)
);

--각 학생의 총점과 평균 계산
SELECT str_num, intKor, intEng, intMath, 
    (intKor+intEng+intMath) AS 총점,
    ROUND((intKor+intEng+intMath)/3,2) AS 평균
FROM tbl_grade;

--총점순으로 오름차순 정렬
SELECT str_num, intKor, intEng, intMath, 
    (intKor+intEng+intMath) AS 총점,
    ROUND((intKor+intEng+intMath)/3,2) AS 평균
FROM tbl_grade
ORDER BY 총점;

--내림차순 총점순으로 정렬
SELECT str_num, intKor, intEng, intMath, 
    (intKor+intEng+intMath) AS 총점,
    ROUND((intKor+intEng+intMath)/3,2) AS 평균
FROM tbl_grade
ORDER BY 총점 DESC;

--고득점 기준으로 정렬하고 순위까지 표시
SELECT str_num, intKor, intEng, intMath, 
    (intKor+intEng+intMath) AS 총점,
    ROUND((intKor+intEng+intMath)/3,2) AS 평균,
    RANK()
    OVER(ORDER BY (intKor+intEng+intMath) DESC) AS 순위
FROM tbl_grade
ORDER BY str_num;


SELECT str_num, intKor, intEng, intMath, ROUND((intKor+intEng+intMath)/3,2) AS 평균
FROM tbl_grade
WHERE ROUND((intKor+intEng+intMath)/3,2)>=90;

SELECT str_num, intKor, intEng, intMath, ROUND((intKor+intEng+intMath)/3,2) AS 평균
FROM tbl_grade
WHERE ROUND((intKor+intEng+intMath)/3,2)<70;



SELECT * FROM tbl_grade
ORDER BY str_num;









