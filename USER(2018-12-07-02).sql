--����� user1���� ������ ȭ��
--�̸�(o_name), ��ȭ��ȣ(o_tel), �ּ�(o_addr), ȸ��(o_comp), �μ�(o_dept)
--Į���� ���� tbl_office ���̺��� �����Ͻÿ�.
--��, id�� PK�� �����ϰ�
--�̸��� NOT NULL�� �����Ͻÿ�

CREATE TABLE tbl_office(
    id NUMBER PRIMARY KEY,
    o_name CHAR(30) NOT NULL,
    o_tel VARCHAR2(20),
    o_addr nVARCHAR2(125),
    o_comp VARCHAR2(20),
    o_dept VARCHAR2(20)
);

SELECT *
FROM tbl_office;

