--����� myMem 
SELECT * FROM tbl_iolist;

--�ŷ�ó (��)���翣���Ͼ(���ֳ����Ե�)�� �ڷḸ Ȯ���ϰ� ���� ��
SELECT * FROM tbl_iolist
WHERE io_dname = '(��)���翣���Ͼ(���ֳ����Ե�)';

--���� ���� tbl_iolist�� ��ǰ�̸��� �ŷ�ó��, �ŷ�ó��ǥ���� ���� ������ �ֱ� ������
--���� ��ǰ�̸��̳�, �ŷ�ó��, �ŷ�ó��ǥ���� ����, �����Ϸ��� �ϸ�
--�ټ�(2�� �̻�)�� �����Ͱ� ������ �ʿ��� ��Ȳ�̴�.
-- �ټ��� �����͸� �����ϴ� ���� DB ���ȯ��, ��Ģ ���忡���� �ſ� �ٶ������� �ʴ�.
--�׷���, ������ io_list���̺��� �и� �۾��Ͽ� 
--������ ������ �ټ� �������� �ʵ��� ��ġ�� ���ؾ� �Ѵ�.
--�̷������� ��2����ȭ(2NF)��� �Ѵ�.

--1. �ŷ�ó��� �ŷ�ó ��ǥ���� �и��Ѵ�.
--��. tbl_iolist�� ���� �ŷ�ó��� �ŷ���ǥ���� ��� ��ƺ���
-- �ŷ�ó�� : io_dname, �ŷ�ó��ǥ : io_ceo

-- �ŷ�ó�� ��ǥ�� ����Ʈ Ȯ��
SELECT io_dname, io_ceo
FROM tbl_iolist
ORDER BY io_dname;

-- �ŷ�ó��� ��ǥ���� ��� Ȯ��
--tbl_iolist ���� �ŷ�ó��� ��ǥ���� 1������ ������ sQL
SELECT io_dname, io_ceo
FROM tbl_iolist
GROUP BY io_dname, io_ceo
ORDER BY io_dname;
--��. ���⿡�� ������ LIST�� ������ �����Ͽ� �������۾�


--��. �ŷ�ó ���̺� ����
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

--a. iolist�� dept ���̺��� JOIN�ؼ� Ȥ�� �߸� ����� �����Ͱ� ���°� Ȯ��
SELECT I.io_dname, D.d_name, D.d_code
FROM tbl_iolist I, tbl_dept D
WHERE I.io_dname = D.d_name;

--b. iolist���� �ִµ� Ȥ�� dept ���̺��� ������ Ȯ��
SELECT I.io_dname, D.d_name, D.d_code
FROM tbl_iolist I 
LEFT JOIN tbl_dept D
ON I.io_dname = D.d_name;

--c. iolist�� dept ���̺��� d_code�� ������ Į���� �߰�
ALTER TABLE tbl_iolist ADD io_dcode CHAR(4);
DESC tbl_iolist;


--SUB QUERY
SELECT I.io_dname,
    (SELECT D.d_name FROM tbl_dept D
        WHERE D.d_name = I.io_dname AND D.d_ceo = I.io_ceo) AS dname
FROM tbl_iolist I
ORDER BY dname;

SELECT * FROM tbl_dept WHERE d_name = '�츮�õ�';


--d. ���� SUB Query�� ����ؼ� dept table���� d_code�� iolist�� update �����Ѵ�.
UPDATE tbl_iolist I
SET io_dcode = 
(SELECT d_code FROM tbl_dept D
WHERE I.io_dname = D.d_name AND I.io_ceo = D.d_ceo);

SELECT io_dcode, io_dname, io_ceo FROM tbl_iolist;

--e. iolist�� dept ���̺��� JOIN�ؼ� �ŷ�ó�� ��ǥ�� ���� ��ȸ�ϴ� SQL
SELECT I.io_dcode, D.d_name, D.d_ceo, I.io_cname
FROM tbl_iolist I  
LEFT JOIN tbl_dept D
    ON I.io_dcode = D.d_code;


--f.iolist���� io_dname, io_ceo Į���� �����ص� �ȴ�.
ALTER TABLE tbl_iolist DROP COLUMN io_ceo;

DESC tbl_iolist;







