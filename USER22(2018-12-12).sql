--����� user22���� ȭ���Դϴ�.
CREATE TABLE tbl_test1(
    str_num CHAR(3) PRIMARY KEY,
    intKor NUMBER(3),
    intEng NUMBER(3),
    intMath NUMBER(3)
);

DROP TABLE tbl_test1;

--ǥ�������� PK ���� : �⺻������ ���̺� ���� PK�� �ϳ��� ������ �� ����
CREATE TABLE tbl_users(
    str_num CHAR(3),
    str_name nVARCHAR2(20),
    str_tel CHAR(15),
    PRIMARY KEY(str_num)
);

INSERT INTO tbl_users
VALUES('001', 'ȫ�浿', '010-111-1111'); 

INSERT INTO tbl_users
VALUES('002', '������', '010-222-1111');

INSERT INTO tbl_users
VALUES('003', '�̸���', '010-333-1111');

INSERT INTO tbl_users
VALUES('004', '����', '010-444-1111');

INSERT INTO tbl_users
VALUES('005', '�Ӳ���', '010-555-1111');

SELECT *
FROM tbl_users;

INSERT INTO tbl_test1
VALUES('001', ROUND(DBMS_RANDOM.VALUE(100,50),0),
              ROUND(DBMS_RANDOM.VALUE(100,50),0),
              ROUND(DBMS_RANDOM.VALUE(100,50),0));

INSERT INTO tbl_test1
VALUES('002', ROUND(DBMS_RANDOM.VALUE(100,50),0),
              ROUND(DBMS_RANDOM.VALUE(100,50),0),
              ROUND(DBMS_RANDOM.VALUE(100,50),0));
              
INSERT INTO tbl_test1
VALUES('003', ROUND(DBMS_RANDOM.VALUE(100,50),0),
              ROUND(DBMS_RANDOM.VALUE(100,50),0),
              ROUND(DBMS_RANDOM.VALUE(100,50),0));
              
INSERT INTO tbl_test1
VALUES('004', ROUND(DBMS_RANDOM.VALUE(100,50),0),
              ROUND(DBMS_RANDOM.VALUE(100,50),0),
              ROUND(DBMS_RANDOM.VALUE(100,50),0));
              
INSERT INTO tbl_test1
VALUES('005', ROUND(DBMS_RANDOM.VALUE(100,50),0),
              ROUND(DBMS_RANDOM.VALUE(100,50),0),
              ROUND(DBMS_RANDOM.VALUE(100,50),0));

SELECT *
FROM tbl_test1;

SELECT *
FROM tbl_users
ORDER BY str_num;

--�л��� ������ �����ϴ� table�� �����ϴµ� ���� �Ϲ����� �����
--�й�, �̸�, ����, ����, ����, ����, ���
--�ʿ��� Į���� ��� �����ϴ� ���̺��� ������ �� �ִ�.
--�й�, �̸�, ��ȭ��ȣ, �ּ�, ����, ����, ����, ����, ���

--�ʿ��� Į���� ��� �����ϴ� ���̺��� ���� �� �� �ִ�.

--������ DB���� ���������� �� ���� ���̺� �ʿ��� Į����
--��� �����ϴ� ���� �ſ� �ٶ��� ���� �ʴ�.
--DB���������� �ʿ��� �����鳢�� table�� ������ �����ؼ� DATA�� �����Ѵ�.

--�л������� : tbl_users ���̺� �ְ�
--���������� : tbl_test1 ���̺� �ְ� �ϴ� ���� ����.

--������, �̷��� ���̺��� �и��ϸ� ���������� ���鼭 �л������� ���� ��ȸ�ϰ� ���� �� ����� �߻�
--�׷��� ǥ�� SQL���� �ΰ��� table.�� ����(JOIN)�ؼ�
--��ġ 1���� ���̺�ó�� �����͸� �� �� �ִ� ����� �����Ѵ�.

--�ΰ��� ���̺� ������ ��� ���� �ʹ�. "�׳�...?"
SELECT * FROM tbl_test1, tbl_users;

--�ΰ��� table�� ��ȸ(read, select)�� ��
--�������� �ټ��� table�� ���(JOIN) �����ִ� ��� -->> JOIN(EQUAL JOIN)�̶�� �Ѵ�~���� �ܼ��ϰ�, ������ 

SELECT * FROM tbl_test1, tbl_users
WHERE tbl_test1.str_num = tbl_users.str_num;           

--���̺� ���� ���̱�
--������ SQL��(SELECT)�� ���������� tableó�� ����ϰ�, table�� select�ϴ� ������� ����� �� �ִ�.
-- >> VIEW��� �Ѵ�.
CREATE VIEW myJoin
AS
SELECT t.str_num AS TNum,
       u.str_num AS UNum,
       u.str_name,
       t.intKor,
       t.intEng,
       t.intMath
FROM tbl_test1 T, tbl_users U       
WHERE t.str_num = u.str_num(+)
ORDER BY t.str_num;       

SELECT * FROM myJoin;
DROP VIEW myJoin;

SELECT * FROM myJoin
WHERE TNum = '002';

SELECT T.str_num,
       U.str_num,
       T.intKor,
       T.intEng,
       T.intMath
FROM tbl_test1 T LEFT JOIN tbl_users U  --������ ���� �Ǵ� ���̺��� ���ʿ� 
     ON t.str_num = u.str_num;


--test1 ���̺� ������ �ϳ� �߰��Ѵ�.
INSERT INTO tbl_test1
VALUES ('006', 90, 90,100);

ROLLBACK; --Ŀ�� �����ϸ� �ҿ����


--DCL���
--���� ���� tbl_users, tbl_test1 ���̺� �����͸� �߰��ߴ�.
--������, ���� ������ ���� �������� ������ �ȵ� �����̴�.
--���� �����ʹ� ����Ŭ�� �ӽ����� ������ ������ �Ǿ��ִ�.
--�ӽ����� ������ ����� �����͸� ������ ���� ������ �����ϴ� Ű���带 �н�
COMMIT; --��� ���峻���� ������ ���� ������ �ݿ��϶�
SELECT * FROM tbl_test1;












