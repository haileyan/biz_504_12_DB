--여기는 관리자 화면입니다.

--1. Tablespace 생성
CREATE TABLESPACE myts1
DATAFILE 'd:/bizwork/Ordata/myts1.dbf'
SIZE 100M
AUTOEXTEND ON NEXT 1M;

--2.새로운 사용자 등록
CREATE USER user3 IDENTIFIED BY 1234
DEFAULT TABLESPACE myts1;

--3. 사용자 접속(login)권한 부여
GRANT CREATE SESSION TO user3;

--4. Tablespace 사용권한 부여
GRANT RESOURCE TO user3;


--5. Create Table 권한 부여
GRANT CREATE TABLE TO user3;

--6. 사용할 Table을 생성하고

--7. CRUD 권한 부여
GRANT SELECT, INSERT, UPDATE, DELETE TO [table] user3;

--4,5,6,7과 기타 권한을 부여하는 방법으로 Test환경에서는 
GRANT DBA TO user3;