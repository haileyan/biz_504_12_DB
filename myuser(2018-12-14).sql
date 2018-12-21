--����� myuser�� ������ ȭ���Դϴ�.
--���Ը������(����)���Ͽ��� DataBase�� �ű�� DB ��Ģ�� �µ��� �����ϴ� ����

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

--��¥ ������ �����ϱ�
SELECT *
FROM tbl_iolist
WHERE io_date BETWEEN '2018-02-01' AND '2018-02-28'
AND io_inout = '����'
ORDER BY io_date;

SELECT *
FROM tbl_iolist
WHERE io_date >= '2018-02-01' AND io_date <='2018-02-28'
AND io_inout = '����'
ORDER BY io_date;

SELECT *
FROM tbl_iolist
WHERE io_date BETWEEN '2018-02-01' AND '2018-02-28'
AND io_inout = '����';



SELECT COUNT(io_total) AS ����, SUM(io_total) AS ���� FROM tbl_iolist;

--����Լ��� �̿��ؼ� ������ �հ踦 ���ϴµ�
--�����հ�� �����հ踦 ���� ����ϰ��� �Ѵ�.
--1.���԰� ������ �����ϴ� Į��: io_inout
SELECT io_inout, COUNT(io_total) AS ����, SUM(io_total) AS �հ�
FROM tbl_iolist
GROUP BY io_inout;

--������ �հ���
--����: ��¥���� ������ �ο��ؼ� ������ �հ� ���
--1. ��¥�� �����ϴ� Į��
SELECT io_date, COUNT(io_total) AS ����, SUM(io_total) AS �հ�
FROM tbl_iolist
GROUP BY io_date
ORDER BY io_date;

--����: ��¥���� ����, �ٽ� ���� ����� �����Ͽ� ������ �հ踦 ����϶�
--1. ��¥�� �����ϴ� Į��: io_date
--2. ���԰� ������ �����ϴ� Į��: io_inout
SELECT io_date, io_inout, COUNT(*) AS ����, SUM(io_total) AS �հ�
FROM tbl_iolist
GROUP BY io_date, io_inout
ORDER BY io_date;

SELECT io_inout, io_date, COUNT(*) AS ����, SUM(io_total) AS �հ�
FROM tbl_iolist
GROUP BY io_inout, io_date 
ORDER BY io_inout;

--�հ�ݾ��� 100���� �̻��� �׸� ������
SELECT io_inout, io_date, COUNT(*) AS ����, SUM(io_total) AS �հ�
FROM tbl_iolist
WHERE io_date BETWEEN '2018-03-01' AND '2018-03-31'
GROUP BY io_inout, io_date 
HAVING SUM(io_total) >= 100000 
ORDER BY io_inout;
--����Լ��� ����ϴ� ���
--����Լ� ����� ���� �����ϴ� LIST�� �����ϰ� ���� ��
--(�ʿ��� ������ ���� ���� ������)
--WHERE�� ������ �ο��ϸ� �ȵȴ�.
--�� ���� HAVING �̶�� ���� ����Ѵ�.

--HAVING���� ��� ��踦 ��� �� �� �������� ������ �ϱ� ������
--��� �������� COUNT�� SUM�� ����ϰ� ��μ� ��¥ ������ �����Ѵ�.
--���� DB SELECT�� �־��� �ð� �ҿ䰡 �ȴ�.










