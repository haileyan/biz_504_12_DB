--myMem

--���̺� ����
DROP TABLE tbl_iolist;
DROP TABLE tbl_dept;

--������ ���Ը��������� ����Ŭ�� import
--���Ը���DB�κ��� ��2����ȭ�� �����ؼ� �ŷ�ó ������ �и�

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

--���Ը����������� �ŷ�ó������ �ٸ� table�� �и��ؼ� ��2����ȭ ������ ����
--1.���Ը����������� �ŷ�ó������ ����
--��. �ŷ�ó��� ��ǥ���� �׷����� ���� ����Ʈ�� �����Ѵ�.
SELECT io_dname, io_dceo
From tbl_iolist
GROUP BY io_dname, io_dceo
ORDER BY io_dname;

--��.�������� ������ �ŷ�ó������ import �ϱ� ���ؼ� table�� ����
CREATE TABLE tbl_dept(
    d_code	CHAR(6)		PRIMARY KEY,
    d_name	nVARCHAR2(50)	NOT NULL,	
    d_ceo	nVARCHAR2(50)		
);

--��.�����κ��� �ŷ�ó������ import
SELECT COUNT(*)
FROM tbl_dept;

--2.tbl_iolist�� tbl_dept�� ������ Į���� �߰��ϰ�
--tbl_dept�κ��� �����۾��� ����

--��.Į���߰�
ALTER TABLE tbl_iolist ADD io_dcode CHAR(6);

--��.�߰��� Į��Ȯ��
DESC tbl_iolist;

--SUBQUERY
--DML���ο� �ٸ� SELECT���� �ִ� SQL�� ��Ī.
SELECT io_dname, io_dceo, io_dcode
FROM tbl_iolist;

--���� SQL�� SUB QUERY�� �߰��ؼ�
--DEPT ���̺�κ��� io_dcode ��ȸ�� �غ���
SELECT io_dname, io_dceo,
    (SELECT d_code  FROM tbl_dept D
        WHERE D.d_name = tbl_iolist.io_dname AND
              D.d_ceo = tbl_iolist.io_dceo) AS dcode
FROM tbl_iolist;              

--SUB QUERY�� ����ؼ� tbl_dept�� ���� tbl_iolist�� �ŷ�ó�ڵ带 update�ϴ� �ڵ�
UPDATE tbl_iolist I
SET io_dcode
    = (SELECT d_code  FROM tbl_dept D
        WHERE D.d_name = I.io_dname AND
              D.d_ceo = I.io_dceo);

SELECT io_dcode, io_dname, io_dceo FROM tbl_iolist;

--tbl_iolist�� io_dname�� io_dceo Į�� ����
ALTER TABLE tbl_iolist DROP COLUMN io_dname;
ALTER TABLE tbl_iolist DROP COLUMN io_dceo;
DESC tbl_iolist;

--iolist�� dept���̺��� join�ؼ� ��ȸ�ϴ� SQL
SELECT I.io_date, I.io_cname, I.io_dcode, D.d_name, D.d_ceo
FROM tbl_iolist I, tbl_dept D
WHERE I.io_dcode = D.d_code;
--�� JOIN�� EQ JOIN�̶�� �ϸ�,
--tbl_iolist���̺��� tbl_dept���̺��� ���� io_dcode��
-- ���� �������� �ʴ´ٴ� ������ ���� �� ������ ����� �����ش�.
-- ���� ��Ȳ���� tbl_dept�� ���� �ڵ尡 tbl_iolist�� ���� �� �� �ִ�.

--�׽�Ʈ �����͸� ����� ���ؼ�
--���� �������� io_dcode�� ���� �� ����
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

--JOIN���� ���� ���·� ���Ը��� ���� ���� �հ�ݾ��� ���
SELECT COUNT(*), SUM(io_total)
FROM tbl_iolist
WHERE io_id BETWEEN 300 AND 310;

--EQ JOIN���� ���Ը��ⱸ�� ���� �հ�ݾ��� ���
--���� �հ�ݾװ� ������ ���̰� ����
SELECT COUNT(*), SUM(io_total)
FROM tbl_iolist I, tbl_dept D
WHERE I.io_dcode = D.d_code
AND io_id BETWEEN 300 AND 310;

--LEFT JOIN���� ���Ը��� ���о��� �հ�ݾ��� ���
SELECT COUNT(*), SUM(io_total)
FROM tbl_iolist I
    LEFT JOIN tbl_dept D
        ON i.io_dcode = D.d_code
WHERE io_id BETWEEN 300 AND 310;

--LEFT JOIN��
--���� TABLE�� �����ʹ� �ϴ� ��� �����ְ�
--���� TABLE�� Ű(io_dcode)�� ��ġ�ϴ� �����Ͱ�
--������ table�� ������ �����ְ�, ������ null�� ǥ���϶�.
--������ table�� ��ġ�ϴ� �����Ͱ� ��� ���� �������� �Ϻΰ� �����Ǿ�
--  ��谡 �߸��Ǵ� ������ Ȯ���ϴ� ����̸� ���� ��Ȳ���� ����� ������ JOIN�̴�.
SELECT I.io_dcode, D.d_name, D.d_ceo
FROM tbl_iolist I
LEFT JOIN tbl_dept D
ON I.io_dcode =  D.d_code
WHERE I.io_id BETWEEN 300 AND 310;

SELECT *
FROM tbl_iolist;

SELECT *
FROM tbl_dept;

--iolist�κ��� ��ǰ������ �и�
--1. �ŷ�ó������ GROUPING�Ͽ� ���� ����Ʈ ��ȸ
SELECT io_cname
FROM tbl_iolist;

--2. ������ ����

--3. CODE�� �ο�

--4. TABLE ����
CREATE TABLE tbl_product(
    c_code	CHAR(6)		PRIMARY KEY,
    c_name	nVARCHAR2(50)	NOT NULL	
);

--5. IMPORT
SELECT COUNT(*)
FROM tbl_product;

--6. IOLIST�� DCODE Į�� ����
ALTER TABLE tbl_iolist ADD io_ccode CHAR(6);

--7. �ŷ�ó���� ���̺��� IOLIST�� DCODEĮ���� UPDATE
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
    









