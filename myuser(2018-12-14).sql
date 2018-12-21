--여기는 myuser로 접속한 화면입니다.
--매입매출샘플(엑셀)파일에서 DataBase에 옮기고 DB 규칙에 맞도록 적용하는 연습

CREATE TABLE tbl_iolist(
    id	NUMBER	PRIMARY KEY,
    io_date	    CHAR(10)	NOT NULL,	
    io_cname	NVARCHAR2(50)	NOT NULL,
    io_dname	NVARCHAR2(30)	NOT NULL,	
    io_dceo	    NVARCHAR2(10),		
    io_inout	NVARCHAR2(5),		
    io_quan	    NUMBER,		
    io_price	NUMBER,		
    io_total	NUMBER	
    );

SELECT *
FROM tbl_iolist;
SELECT COUNT(*) FROM tbl_iolist;

DELETE FROM tbl_iolist;

--날짜 순으로 정렬하기
SELECT *
FROM tbl_iolist
WHERE io_date BETWEEN '2018-02-01' AND '2018-02-28'
AND io_inout = '매입'
ORDER BY io_date;

SELECT *
FROM tbl_iolist
WHERE io_date >= '2018-02-01' AND io_date <='2018-02-28'
AND io_inout = '매입'
ORDER BY io_date;

SELECT *
FROM tbl_iolist
WHERE io_date BETWEEN '2018-02-01' AND '2018-02-28'
AND io_inout = '매출';



SELECT COUNT(io_total) AS 개수, SUM(io_total) AS 총합 FROM tbl_iolist;

--통계함수를 이용해서 개수와 합계를 구하는데
--매입합계와 매출합계를 따로 계산하고자 한다.
--1.매입과 매출을 구분하는 칼럼: io_inout
SELECT io_inout, COUNT(io_total) AS 개수, SUM(io_total) AS 합계
FROM tbl_iolist
GROUP BY io_inout;

--개수와 합계계산
--조건: 날짜별로 조건을 부여해서 개수와 합계 계산
--1. 날짜를 구분하는 칼럼
SELECT io_date, COUNT(io_total) AS 개수, SUM(io_total) AS 합계
FROM tbl_iolist
GROUP BY io_date
ORDER BY io_date;

--조건: 날짜별로 묶고, 다시 매입 매출로 구분하여 개수와 합계를 계산하라
--1. 날짜를 구분하는 칼럼: io_date
--2. 매입과 매출을 구분하는 칼럼: io_inout
SELECT io_date, io_inout, COUNT(*) AS 개수, SUM(io_total) AS 합계
FROM tbl_iolist
GROUP BY io_date, io_inout
ORDER BY io_date;

SELECT io_inout, io_date, COUNT(*) AS 개수, SUM(io_total) AS 합계
FROM tbl_iolist
GROUP BY io_inout, io_date 
ORDER BY io_inout;

--합계금액이 100만원 이상인 항목만 보여라
SELECT io_inout, io_date, COUNT(*) AS 개수, SUM(io_total) AS 합계
FROM tbl_iolist
WHERE io_date BETWEEN '2018-03-01' AND '2018-03-31'
GROUP BY io_inout, io_date 
HAVING SUM(io_total) >= 100000 
ORDER BY io_inout;
--통계함수를 사용하는 경우
--통계함수 결과에 따라 추출하는 LIST를 제한하고 싶을 때
--(필요한 범위의 값만 보고 싶을때)
--WHERE에 조건을 부여하면 안된다.
--이 떄는 HAVING 이라는 절을 사용한다.

--HAVING절은 모든 통계를 계산 한 후 조건으로 제한을 하기 때문에
--모든 데이터의 COUNT와 SUM을 계산하고 비로소 날짜 범위를 제한한다.
--따라서 DB SELECT의 최악의 시간 소요가 된다.










