--여기는 myMem 
SELECT * FROM tbl_iolist;

--거래처 (주)동양엔지니어링(광주남구롯데)의 자료만 확인하고 싶을 때
SELECT * FROM tbl_iolist
WHERE io_dname = '(주)동양엔지니어링(광주남구롯데)';

--지금 현재 tbl_iolist는 상품이름과 거래처명, 거래처대표명을 직접 가지고 있기 때문에
--만약 상품이름이나, 거래처명, 거래처대표명을 변경, 삭제하려고 하면
--다수(2개 이상)의 데이터가 변경이 필요한 상황이다.
-- 다수의 데이터를 변경하는 것은 DB 사용환경, 규칙 입장에서는 매우 바람직하지 않다.
--그래서, 현재의 io_list테이블을 분리 작업하여 
--데이터 변경이 다수 발행하지 않도록 조치를 취해야 한다.
--이론적으로 제2정규화(2NF)라고 한다.

--1. 거래처명과 거래처 대표명을 분리한다.
--가. tbl_iolist로 부터 거래처명과 거래대표명을 묶어서 모아보자
-- 거래처명 : io_dname, 거래처대표 : io_ceo

-- 거래처명 대표명 리스트 확인
SELECT io_dname, io_ceo
FROM tbl_iolist
ORDER BY io_dname;

-- 거래처명과 대표명을 묶어서 확인
--tbl_iolist 에서 거래처명과 대표명을 1개씩만 추출한 sQL
SELECT io_dname, io_ceo
FROM tbl_iolist
GROUP BY io_dname, io_ceo
ORDER BY io_dname;
--나. 여기에서 생성된 LIST를 엑셀로 복사하여 데이터작업


--다. 거래처 테이블 생성
CREATE TABLE tbl_dept(
    d_code	CHAR(4)		PRIMARY KEY,
    d_name	nVARCHAR2(50)	NOT NULL,
    d_ceo	nVARCHAR2(20)	NOT NULL,	
    d_tel	nVARCHAR2(20),		
    d_addr	nVARCHAR2(50),		
    d_fax	nVARCHAR2(20),		
    d_sid	CHAR(14)		
);

DROP TABLE tdl_dept;

SELECT COUNT(*) FROM tbl_dept;
SELECT * FROM tbl_dept;

--a. iolist와 dept 테이블을 JOIN해서 혹시 잘못 연결된 데이터가 없는가 확인
SELECT I.io_dname, D.d_name, D.d_code
FROM tbl_iolist I, tbl_dept D
WHERE I.io_dname = D.d_name;

--b. iolist에는 있는데 혹시 dept 테이블에는 없는지 확인
SELECT I.io_dname, D.d_name, D.d_code
FROM tbl_iolist I 
LEFT JOIN tbl_dept D
ON I.io_dname = D.d_name;

--c. iolist에 dept 테이블의 d_code와 연결할 칼럼을 추가
ALTER TABLE tbl_iolist ADD io_dcode CHAR(4);
DESC tbl_iolist;


--SUB QUERY
SELECT I.io_dname,
    (SELECT D.d_name FROM tbl_dept D
        WHERE D.d_name = I.io_dname AND D.d_ceo = I.io_ceo) AS dname
FROM tbl_iolist I
ORDER BY dname;

SELECT * FROM tbl_dept WHERE d_name = '우리냉동';


--d. 이제 SUB Query를 사용해서 dept table에서 d_code를 iolist에 update 실행한다.
UPDATE tbl_iolist I
SET io_dcode = 
(SELECT d_code FROM tbl_dept D
WHERE I.io_dname = D.d_name AND I.io_ceo = D.d_ceo);

SELECT io_dcode, io_dname, io_ceo FROM tbl_iolist;

--e. iolist와 dept 테이블을 JOIN해서 거래처명 대표를 같이 조회하는 SQL
SELECT I.io_dcode, D.d_name, D.d_ceo, I.io_cname
FROM tbl_iolist I  
LEFT JOIN tbl_dept D
    ON I.io_dcode = D.d_code;


--f.iolist에서 io_dname, io_ceo 칼럼을 삭제해도 된다.
ALTER TABLE tbl_iolist DROP COLUMN io_ceo;

DESC tbl_iolist;







