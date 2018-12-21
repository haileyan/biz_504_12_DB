--����� ������ ȭ���Դϴ�.
--���ο� ����� ���
--�ϴ� ���� ����� user2�� ����
DROP USER user22 CASCADE; --user22�� Ȱ���ߴ� ��� ������ ����

--�ٽ� user2�� ����
CREATE USER user22 IDENTIFIED BY 1234
DEFAULT TABLESPACE myTs;

--TABLESPACE ������ �ο�
GRANT RESOURCE TO user22;

-- ����������� TABLESPACE�� �ٽ� ����:
-- �⺻����� ������ �����ϸ� 
-- ����ڴ� dafault tablespace�� SYSTEM(����Ŭ �⺻) tablespace�� �����Ѵ�.
-- �� SYSTEM ts�� DBA ������ ���� ����ڸ� ������ �����ؼ� 
-- �⺻������ CREATE TABLE���� ���� �����δ� TABLE�� �����ϱⰡ ��ƴ�.
-- �׷��� ������ ����ڿ� TABLESAPCE�� �����ϰ� �̹� ������ ����ڸ� 
-- ���� ���� TABLESPACE�� ������ �ִ� ���� ����.
-- ��Ģ�� TS�� ���� �����ϰ�, ����ڸ� �����ؼ� DEFAULT TABLESPACE�� �����ϴ� ���� ������
-- ����ڸ� ���� ����ϰ� �Ǹ� ���߿� �ٽ� ������ �ؼ� ����� TS�� ������ �� �ִ�.

-- DCL ��ɾ�� CREATE DROP�� �Բ� ����� �� �ִ� 
-- ALTER ����� �̿��ؼ� ������ �����Ѵ�.
ALTER USER22 DEFAULT TABLESPACE myts;

-- ��� ����
ALTER USER user22 IDENFITIED BY 1111;


--user22���� CRUD ������ �ο�
--CRUD������ �ο��Ϸ��� ���� table�� �����Ǿ� �־�� �Ѵ�.

--1. ������ ���� �ο�
GRANT SELECT ON tbl_test TO user22;
GRANT INSERT ON tbl_test TO user22;

--2. CRUD �ϰ� ���� �ο�
GRANT SELECT, INSERT, UPDATE, DELETE ON tbl_test TO user22;

--���� ������� user2�� �����ϰ�, CRUD ������ �ο������� ���� ���� ������ �ο����� �ʾҴ�.
--CONNECT ���ӱ����� DB������ ���� ���� ������ �ſ� �ٸ���.
--11gEx������ ����� ���� ������ �ȴ�.
--���� CONNECT ������ �Ϲ����� ��� ������� �ʰ�

GRANT CREATE SESSION TO user22;
--REVOKE CREATE TABLE FROM user22;
GRANT CREATE TABLE TO user22;

--USER2�� ����� TABLE SPACE�� �ϳ� ����
CREATE TABLESPACE myTs  --myTs��� �̸����� DB ���� ���� ����
DATAFILE 'D:/bizwork/Ordata/myts.dbf'  --���� ������ġ�� ����
SIZE 100M  --���� Ȯ���� �뷮
AUTOEXTEND ON NEXT 1M  --�뷮�� �����ϸ� 1M�� �ڵ� Ȯ��
MAXSIZE UNLIMITED; --�ִ� �뷮 ���� ����

--TABLESPACE�� �����ϰ�, ��� ������ �����϶�
DROP TABLESPACE myTs
INCLUDING CONTENTS AND DATAFILES 
CASCADE CONSTRAINTS;

DEFAULT TABLESPACE
