--����� ������ȭ��
CREATE USER myuser1 IDENTIFIED BY 1111;
--TABLESPACE�� SYSTEM ���̺� �����̽��� �ڵ� ����
--���� ȯ�濡���� �ſ� ������ ���

GRANT CREATE TABLE TO myuser1;
GRANT SELECT, UPDATE, INSERT ON [table] TO myuser1;

CREATE TABLESPACE mytsA
DATAFILE 'd:/bizwork/Ordata/mytsA.dbf'
SIZE 100M
AUTOEXTEND ON NEXT 100K;

--����ڵ���� ������ �� ���̺� �����̽��� ������ �ʰ� ���̺� ���� �����ϸ� 
--������ TABLE���� SYSTEM TS�� �����Ǿ� ���߿� TS�� ���� �� �ű���� ���� ������ �߻��Ѵ�.
--����, ����ڸ� �����ϰ� ���̺��� ����� ���� TS�� �ݵ�� �����ϰ�
--������� DEFAULT TS�� �������־�� �Ѵ�.
ALTER USER myuser1 DEFAULT TABLESPACE mytsA;

CREATE TABLE EMP_TABLE(
    EMPNO CHAR(6) PRIMARY KEY,
    EMPNAME nVARCHAR2(20) NOT NULL,
    EMPBIRTH CHAR(8),
    DEPTNO CHAR(3) NOT NULL,
    HREDATE CHAR(10) NOT NULL
);

DROP TABLE EMP_TABLE;

INSERT INTO EMP_TABLE
VALUES('170001', 'ȫ�浿', '880212', '001', '20181219');

INSERT INTO EMP_TABLE
VALUES('170002', '�̸���', '770215', '003', '20181218');

INSERT INTO EMP_TABLE
VALUES('170003', '������', '820513', '003', '20181217');

INSERT INTO EMP_TABLE
VALUES('170004', '�庸��', '941102', '004', '20181220');

INSERT INTO EMP_TABLE
VALUES('170005', '�Ӳ���', '801212', '001', '20181216');

SELECT *
FROM EMP_TABLE;

UPDATE EMP_TABLE 
SET HREDATE = '2018-03-01'
WHERE EMPNAME = '�庸��';
--UPDATE�� ���� �ݵ�� PK���� �̿��ؼ�!!!!!!!�϶�!!!!!!!!
--���� ��쿡�� �̸����� WHERE�� �����ϸ� ���������� ������ �����͹��Ἲ�� ��ġ�� ��.

--1.UPDATE�� �ϱ� ���� �����ϰ��� �ϴ� ������ ���� ��ȸ �ؾ� �Ѵ�.
SELECT * FROM EMP_TABLE WHERE EMPNAME = '�庸��';

--2.��ȸ�� ������ �߿��� �����ϰ��� �ϴ� �������� PK���� �Լ��Ѵ�.
--  �� ����� PK:170004
UPDATE EMP_TABLE 
SET HREDATE = '2018-03-01'
WHERE EMPNO = '170004';
