--����� user22�� ȭ���Դϴ�
CREATE TABLE tbl_employee(
    strEmpno CHAR(3) PRIMARY KEY,
    strName nVARCHAR2(20) NOT NULL,
    strJob nVARCHAR2(20),
    intSal NUMBER(5),
    strDeptNo nVARCHAR2(20)
);

ALTER TABLE tbl_employee
MODIFY intSal NUMBER(10);


INSERT INTO tbl_employee
VALUES ('001', 'ȫ�浿', '�λ����', '2500000', '�ѹ���');  

INSERT INTO tbl_employee
VALUES ('002', '�̸���', '�������', '2500000', '������');

INSERT INTO tbl_employee
VALUES ('003', '������', '�޿�����', '2500000', '�ѹ���');

INSERT INTO tbl_employee
VALUES ('004', '����', '�������', '2500000', '�����');

INSERT INTO tbl_employee
VALUES ('005', '�Ӳ���', 'ǰ������', '2500000', '�����');

SELECT *
FROM tbl_employee;