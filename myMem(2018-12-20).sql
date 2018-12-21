--myMem

--테이블 삭제
DROP TABLE tbl_iolist;
DROP TABLE tbl_dept;

--엑셀의 매입매출정보를 오라클로 import
--매입매출DB로부터 제2정규화를 실행해서 거래처 정보를 분리

CREATE TABLE tbl_iolist(
    io_id	    NUMBER		PRIMARY KEY,
    io_date	    CHAR(10)	NOT NULL,	
    io_cname	nVARCHAR2(50)	NOT NULL,	
    io_dname	nVARCHAR2(50)	NOT NULL,	
    io_dceo	    nVARCHAR2(50),		
    io_inout	nVARCHAR2(5)	NOT NULL,	
    io_quan	    NUMBER,		
    io_price	NUMBER,	
    io_total	NUMBER		
);

SELECT COUNT(*)
FROM tbl_iolist;

SELECT io_inout,COUNT(*)
FROM tbl_iolist
GROUP BY io_inout;

--매입매출정보에서 거래처정보를 다른 table로 분리해서 제2정규화 과정을 수행
--1.매입매출정보에서 거래처정보를 추출
--가. 거래처명과 대표명을 그룹으로 묶어 리스트를 추출한다.
SELECT io_dname, io_dceo
From tbl_iolist
GROUP BY io_dname, io_dceo
ORDER BY io_dname;

--나.엑셀에서 정리된 거래처정보를 import 하기 위해서 table을 생성
CREATE TABLE tbl_dept(
    d_code	CHAR(6)		PRIMARY KEY,
    d_name	nVARCHAR2(50)	NOT NULL,	
    d_ceo	nVARCHAR2(50)		
);

--다.엑셀로부터 거래처정보를 import
SELECT COUNT(*)
FROM tbl_dept;

--2.tbl_iolist에 tbl_dept와 연결할 칼럼을 추가하고
--tbl_dept로부터 연결작업을 수행

--가.칼럼추가
ALTER TABLE tbl_iolist ADD io_dcode CHAR(6);

--나.추가된 칼럼확인
DESC tbl_iolist;

--SUBQUERY
--DML내부에 다른 SELECT문이 있는 SQL을 지칭.
SELECT io_dname, io_dceo, io_dcode
FROM tbl_iolist;

--위의 SQL에 SUB QUERY를 추가해서
--DEPT 테이블로부터 io_dcode 조회해 해보자
SELECT io_dname, io_dceo,
    (SELECT d_code  FROM tbl_dept D
        WHERE D.d_name = tbl_iolist.io_dname AND
              D.d_ceo = tbl_iolist.io_dceo) AS dcode
FROM tbl_iolist;              

--SUB QUERY를 사용해서 tbl_dept로 부터 tbl_iolist에 거래처코드를 update하는 코드
UPDATE tbl_iolist I
SET io_dcode
    = (SELECT d_code  FROM tbl_dept D
        WHERE D.d_name = I.io_dname AND
              D.d_ceo = I.io_dceo);

SELECT io_dcode, io_dname, io_dceo FROM tbl_iolist;

--tbl_iolist의 io_dname과 io_dceo 칼럼 삭제
ALTER TABLE tbl_iolist DROP COLUMN io_dname;
ALTER TABLE tbl_iolist DROP COLUMN io_dceo;
DESC tbl_iolist;

--iolist와 dept테이블을 join해서 조회하는 SQL
SELECT I.io_date, I.io_cname, I.io_dcode, D.d_name, D.d_ceo
FROM tbl_iolist I, tbl_dept D
WHERE I.io_dcode = D.d_code;
--이 JOIN은 EQ JOIN이라고 하며,
--tbl_iolist테이블에는 tbl_dept테이블에는 없는 io_dcode는
-- 절대 존재하지 않는다는 보장이 있을 때 완전한 결과를 보여준다.
-- 실제 상황에선 tbl_dept에 없는 코드가 tbl_iolist에 존재 할 수 있다.

--테스트 데이터를 만들기 위해서
--임의 데이터의 io_dcode를 변경 할 예저
SELECT * FROM tbl_iolist
WHERE io_dcode = 'D00001';

UPDATE tbl_iolist
SET io_dcode = 'D00500'
WHERE io_id = '306';

SELECT I.io_id, I.io_date, I.io_cname, I.io_dcode, D.d_name, D.d_ceo
FROM tbl_iolist I, tbl_dept D
WHERE I.io_dcode = D.d_code
    AND io_id BETWEEN 300 AND 310
ORDER BY I.io_id;    

--JOIN하지 않은 상태로 매입매출 구분 없이 합계금액을 계산
SELECT COUNT(*), SUM(io_total)
FROM tbl_iolist
WHERE io_id BETWEEN 300 AND 310;

--EQ JOIN으로 매입매출구분 없이 합계금액을 계산
--실제 합계금액과 개수가 차이가 난다
SELECT COUNT(*), SUM(io_total)
FROM tbl_iolist I, tbl_dept D
WHERE I.io_dcode = D.d_code
AND io_id BETWEEN 300 AND 310;

--LEFT JOIN으로 매입매출 구분없이 합계금액을 계산
SELECT COUNT(*), SUM(io_total)
FROM tbl_iolist I
    LEFT JOIN tbl_dept D
        ON i.io_dcode = D.d_code
WHERE io_id BETWEEN 300 AND 310;

--LEFT JOIN은
--왼쪽 TABLE의 데이터는 일단 모두 보여주고
--왼쪽 TABLE의 키(io_dcode)와 일치하는 데이터가
--오른쪽 table에 있으면 보여주고, 없으면 null로 표시하라.
--오른쪽 table에 일치하는 데이터가 없어서 왼쪽 데이터의 일부가 누락되어
--  통계가 잘못되는 이유를 확인하는 방법이며 실제 상황에서 상당히 유용한 JOIN이다.
SELECT I.io_dcode, D.d_name, D.d_ceo
FROM tbl_iolist I
LEFT JOIN tbl_dept D
ON I.io_dcode =  D.d_code
WHERE I.io_id BETWEEN 300 AND 310;

SELECT *
FROM tbl_iolist;

SELECT *
FROM tbl_dept;

--iolist로부터 상품정보를 분리
--1. 거래처정보를 GROUPING하여 묶은 리스트 조회
SELECT io_cname
FROM tbl_iolist;

--2. 엑셀로 복사

--3. CODE값 부여

--4. TABLE 생성
CREATE TABLE tbl_product(
    c_code	CHAR(6)		PRIMARY KEY,
    c_name	nVARCHAR2(50)	NOT NULL	
);

--5. IMPORT
SELECT COUNT(*)
FROM tbl_product;

--6. IOLIST에 DCODE 칼럼 생성
ALTER TABLE tbl_iolist ADD io_ccode CHAR(6);

--7. 거래처정보 테이블에서 IOLIST의 DCODE칼럼에 UPDATE
DESC tbl_iolist

SELECT io_dname, io_dceo,
    (SELECT d_code  FROM tbl_dept D
        WHERE D.d_name = tbl_iolist.io_dname AND
              D.d_ceo = tbl_iolist.io_dceo) AS dcode
FROM tbl_iolist;     

SELECT io_ccode,
    (SELECT c_code FROM tbl_product C
        WHERE C.c_name = tbl_iolist.io_cname) AS ccode
FROM tbl_iolist;


UPDATE tbl_iolist I
SET io_dcode
    = (SELECT d_code  FROM tbl_dept D
        WHERE D.d_name = I.io_dname AND
              D.d_ceo = I.io_dceo);

UPDATE tbl_iolist I
SET io_cname
    = (SELECT c_code FROM tbl_product C
        WHERE C.c_code = I.io_ccode);
    









