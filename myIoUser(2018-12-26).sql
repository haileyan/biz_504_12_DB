--myIoUser

CREATE TABLE tbl_iolist(
    io_id	CHAR(8)		 PRIMARY KEY,
    io_date	CHAR(15)	NOT NULL,	
    io_pname	nVARCHAR2(20)	NOT NULL,
    io_dname	nVARCHAR2(20),		
    io_ceo	    nVARCHAR2(20),		
    io_inout	nVARCHAR2(20),		
    io_quan 	NUMBER,		
    io_price	NUMBER,		
    io_total	NUMBER		
);

SELECT COUNT(*) FROM tbl_iolist;

SELECT io_dname, io_ceo
FROM tbl_iolist
GROUP BY io_dname, io_ceo;

CREATE TABLE tbl_dinfo(
    d_code	CHAR(5)		PRIMARY KEY,
    d_name	nVARCHAR2(50),		
    d_ceo	nVARCHAR2(20)		
);

SELECT COUNT(*) FROM tbl_dinfo; 

--EQ join
SELECT I.io_dname ,D.d_name, I.io_ceo, D.d_ceo
FROM tbl_iolist I, tbl_dinfo D
WHERE I.io_dname = D.d_name AND I.io_ceo = D.d_ceo;

--만약 위의 SQL문을 실행했을 때
--iolist에는 데이터가 있는데, dinfo에는 데이터가 없을 경우에
--d.d_name과 d.d_ceo는 NULL 값으로 나타날 것이다.
--이 성질을 이용해서 d.d_name이나 d.d_ceo가 NULL인 것만
--찾아보면 더 쉽게 확인이 가능하다

--LEFT join
SELECT I.io_dname ,D.d_name, I.io_ceo, D.d_ceo
FROM tbl_iolist I 
    LEFT JOIN tbl_dinfo D
        ON I.io_dname = D.d_name AND I.io_ceo = D.d_ceo;


SELECT I.io_dname ,D.d_name, I.io_ceo, D.d_ceo
FROM tbl_iolist I 
    LEFT JOIN tbl_dinfo D
        ON I.io_dname = D.d_name AND I.io_ceo = D.d_ceo
WHERE D.d_name IS NULL OR D.d_ceo IS NULL;
--위의 SQL을 실행했을때 LIST가 하나도 없어야 정상적으로 거래처정보 TABLE이 완성 된 것이다.

--거래처명이 누락된 항목이 있느냐
SELECT io_price
FROM tbl_iolist
WHERE io_price = 0;

--거래처명이 있는 항목이 있느냐
SELECT io_price
FROM tbl_iolist
WHERE io_price IS NOT NULL;


SELECT I.io_dname, I.io_ceo,
    (SELECT D.d_code FROM tbl_dinfo D
        WHERE D.d_name = I.io_dname AND D.d_ceo = I.io_ceo) AS dcode
FROM tbl_iolist I;

ALTER TABLE tbl_iolist ADD io_dcode CHAR(5);

UPDATE tbl_iolist I
SET io_dcode = 
    (SELECT D.d_code FROM tbl_dinfo D
    WHERE I.io_dname = D.d_name AND I.io_ceo = D.d_ceo);

SELECT io_dcode, io_dname, io_ceo
FROM tbl_iolist;








