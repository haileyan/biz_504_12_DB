--����� user1���� ������ ȭ���Դϴ�.
--user1�� dba ������ ���� �ִ�.

--table ����
--TABLE�̸� : tbl_std
--st_num, st_name, st_tel, st_addr, int_age, int_grade Į���� ������ �ְ�,
--st_num�� PK�� ���� �Ǿ� �ְ�, st_name�� ��ĭ�� ���� ��������� �����Ǿ� �ִ�.
CREATE TABLE tbl_std(
    st_num CHAR(3) PRIMARY KEY,
    st_name NVARCHAR2(20) NOT NULL,
    st_tel NVARCHAR2(20),
    st_addr nVARCHAR2(125),
    int_age NUMBER(3),
    int_grade NUMBER(3)
);

SELECT *
FROM tbl_std;


--ȫ�浿, �̸���, ������, �Ӳ���, ���� �̸��� ��������
--������ �׸��� �����Ӱ� �����Ͽ� �����͸� �߰��Ͻÿ�
INSERT INTO tbl_std
VALUES ('001', 'ȫ�浿', '010-111-1111', '�����', 017, 01);

INSERT INTO tbl_std
VALUES('002', '�̸���', '010-222-1111', '���ֽ�', 020, 02);

INSERT INTO tbl_std
VALUES ('003', '������', '010-333-1111', '�λ��', 018, 03);

INSERT INTO tbl_std
VALUES ('004', '�Ӳ���', '010-444-1111', '������', 021, 02);

INSERT INTO tbl_std
VALUES ('005', '����', '010-555-1111', '������', 019, 04);