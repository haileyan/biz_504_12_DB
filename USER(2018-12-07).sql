--����� user1���� ������ ȭ���Դϴ�
--tbl_addr�� �ϴ� ����
DROP TABLE tbl_addr;

--tbl_addr ����
CREATE TABLE tbl_addr(
    id NUMBER PRIMARY KEY, --�⺻Ű, PK / ���� ���� �����ʹ� ���� �� �� ����!!!
    st_name CHAR(50) NOT NULL, --�̸��� ���� ��ĭ ����
    st_age NUMBER(3),
    st_addr VARCHAR2(125)
);

INSERT INTO tbl_addr 
VALUES(0, 'ȫ�浿', 12, '�����');

INSERT INTO tbl_addr 
VALUES(1, 'ȫ�浿', 12, '�����');

INSERT INTO tbl_addr 
VALUES(2, '�̸���', 12, '������');

-- �����͸� �߰��ϸ鼭 0�� �׸�� 1�� �׸���
-- �߸� Ȯ���Ͽ� ���� �������� ������ �ν��ϰ� INSERTó���� �ع��ȴ�.

SELECT * FROM tbl_addr;
--SELECT�� �����͸� Ȯ���ߴ��� �� ���� �����Ͱ�
--�� ����� �����ͷ� �ߺ� �� ���� Ȯ�εǾ���.
--�ٽ� ���� ������ �ô��� �ι�° ȫ�浿�� �ּҰ� ������ �ƴ� �λ��� ������ Ȯ��
--�׷���, �ι�° ȫ�浿�� �ּҸ� �λ����� �����Ϸ��� �Ѵ�.
--�ٽ��ѹ� SELECT�ؼ� ȫ�浿�� �����͸� Ȯ������.

SELECT *
FROM tbl_addr
WHERE st_name = 'ȫ�浿'; --st_nameĮ���� ���� ȫ�浿�� ��츸 ������.

--������ ���� ����!!!!
UPDATE tbl_addr
SET st_addr = '�λ��'
WHERE id = 1;

UPDATE tbl_addr
SET st_age = 16
WHERE id = 2;


INSERT INTO tbl_addr
VALUES (3, '������', 16, '�ͻ��');
INSERT INTO tbl_addr
VALUES (4, '������', 16, '�ͻ��');
--�Ǽ��� ������ �����͸� 2�� �ߺ� �Է�
--�׷��� ���߿� �Է��� �����͸� �����Ϸ��� �Ѵ�

SELECT * FROM tbl_addr;
-- ������ ������(��)�� Ȯ�� (FIRST!)
SELECT *
FROM tbl_addr
WHERE st_name = '������';

--�������� 2��° �������� id�� 4�� ������ ����
DELETE FROM tbl_addr
WHERE id =4;

SELECT *
FROM tbl_addr;

--DB�� Table�� ���� �� ��
--����ϰ��� �ϴ� Į���߿� UNIQUE�� �׸��� �ִٸ�
--�� Į���� PRIMARY KEY(PK)�� �����ϴ� ���� ����
--�׷��� ������ ��� Table���� id��� Į���� ���� �߰��ؼ�
--�ش� Į���� PK�� ������ �ִ� ���� ����.

CREATE TABLE tbl_postno(
    postno CHAR(5) PRIMARY KEY, -- ��ü ���Ἲ �����(���� ���� ���� �� �� ����)
    street VARCHAR(125) NOT NULL UNIQUE, --���� ��ĭ�� ����(NOT NULL), �ߺ��Ǵ� ���� ����!(UNIQUE)
                                         --��� ���� ���� ����� ���� ����. �� ��� PRIMARY KEY�� ����� ����(NOT EXACTLLY SAME)
    addr nVARCHAR2(125)
);
