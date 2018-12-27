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

--���� ���� SQL���� �������� ��
--iolist���� �����Ͱ� �ִµ�, dinfo���� �����Ͱ� ���� ��쿡
--d.d_name�� d.d_ceo�� NULL ������ ��Ÿ�� ���̴�.
--�� ������ �̿��ؼ� d.d_name�̳� d.d_ceo�� NULL�� �͸�
--ã�ƺ��� �� ���� Ȯ���� �����ϴ�

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
--���� SQL�� ���������� LIST�� �ϳ��� ����� ���������� �ŷ�ó���� TABLE�� �ϼ� �� ���̴�.

--�ŷ�ó���� ������ �׸��� �ִ���
SELECT io_price
FROM tbl_iolist
WHERE io_price = 0;

--�ŷ�ó���� �ִ� �׸��� �ִ���
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








