--����� ������ ȭ���Դϴ�
CREATE USER myuser IDENTIFIED BY 1234;
--���� tablespace�� �����ϱ� ���� ����ڸ� ���� ����ϴ� ����
--DEFAULT TABLESPACE�� �������� �ʾҴ�
--�̷���� DEFALUT TABLESPACE�� SYSTEM ���� ������ �����Ǵµ�,
--�̰��� �ǹ����� �ſ� ������ ���
(DEFAULT TABLESPACE...)

GRANT DBA to myuser;
GRANT CREATE SESSION TO myuser;

CREATE TABLESPACE myTBL
DATAFILE 'd:/bizwork/ordata/mytbl.dbf'
SIZE 100M
AUTOEXTEND ON NEXT 1M
MAXSIZE UNLIMITED;
--myuser ����ڿ��� TABLESPACE�� �������� �ʾҴ�

--���� ���ο� TABLESPACE�� ���������Ƿ�
--myuser���� default tablespace�� �����ϰڴ�
ALTER USER myuser DEFAULT TABLESPACE myTBL;