--����� user22�Դϴ�
CREATE TABLE tbl_users(
    str_userid CHAR(12) PRIMARY KEY,
    str_name NVARCHAR2(50) NOT NULL,
    str_tel NVARCHAR2(15),
    str_addr NVARCHAR2(50)
);


INSERT INTO tbl_users
VALUES ('001', 'ȫ�浿', '010-111-1111', '�����');

INSERT INTO tbl_users
VALUES ('002', '�Ӳ���', '010-222-1111', '���ֽ�');

INSERT INTO tbl_users
VALUES ('003', '������', '010-333-1111', '��õ��');

INSERT INTO tbl_users
VALUES ('004', '����', '010-444-1111', '�λ��');

INSERT INTO tbl_users
VALUES ('005', '�̸���', '010-555-1111', '���ֽ�');

SELECT *
FROM tbl_users;


--���� �ۼ��� tbl_users���̺� str_userid�� 12�ڸ��� ������ �ߴµ�, �Է��� �ϴٺ���
--�ʹ� ���� �ڸ��� �����Ѵ�. �׷��� ���� �Է� ���� id ������ 3���� ũ�⸦ �ٲ� ������ �Ѵ�.
--�̹� ������ ���̺��� Į�� ������ ����
--DDL ����� ALTER ����� ����Ѵ�.
ALTER TABLE tbl_users MODIFY str_userid NVARCHAR2(8);

ALTER TABLE tbl_users MODIFY str_name NVARCHAR2(5);
--CHAR�� �����ʹ� ���̴� �����Ϳ� �޸� ���� ũ�⸸ŭ ��������� �̹� ä�����ֱ� ������ ũ�⸦ ���� �� ����
--(n)VARCHAR2�� �����ʹ� ���̴� ������ �� ���� ���̰� �� ������ ��ŭ�� ũ�⸦ ���� �� �ִ�.

--INSERT�� ������ �� ��üĮ���� �ƴ� Ư�� Į���� ���� �ִ� ���
INSERT INTO tbl_users (str_userid, str_name) VALUES('006', '����');
INSERT INTO tbl_users (str_userid, str_name) VALUES('007', '����');
INSERT INTO tbl_users (str_userid, str_name) VALUES('008', '����');
INSERT INTO tbl_users (str_userid, str_name) VALUES('009', '����');
INSERT INTO tbl_users (str_userid, str_name) VALUES('010', '����');

--INSERT�� ������ �� �������� ��ġ(����)�� �ٲٰ��� �� ����
--TABLE�� Į������Ʈ�� ������ �ٲٸ� �ȴ�.
INSERT INTO tbl_users(str_name, str_userid) VALUES('����', '011');

SELECT str_name, str_tel
FROM tbl_users;

SELECT *
FROM tbl_users
WHERE str_userid = '002';

SELECT *
FROM tbl_users
WHERE str_userid >= '003' and str_userid <= '006';

SELECT *
FROM tbl_users
WHERE str_userid BETWEEN '003' AND '006';


--SQL�� ����Լ�
--���� tbl_users�� ����� ������ ������ ���?
--SUM, COUNT, AVG, MIN, MAX
--Į���� ���δ� �Լ�
SELECT COUNT(*) FROM tbl_users; --���� ����Ǿ� �ִ� ������ ������ �� ����?
SELECT MIN(str_userid) FROM tbl_users;
SELECT MAX(str_userid) FROM tbl_users;

SELECT COUNT(*) AS ����,
    MIN(str_userid) AS ������,
    MAX(str_userid) AS ū��
FROM tbl_users;  






