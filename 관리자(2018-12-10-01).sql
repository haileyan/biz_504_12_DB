--여기는 관리자 화면입니다.
--새로운 사용자 등록
--일단 기존 사용자 user2를 삭제
DROP USER user22 CASCADE; --user22가 활동했던 모든 정보를 삭제

--다시 user2를 생성
CREATE USER user22 IDENTIFIED BY 1234
DEFAULT TABLESPACE myTs;

--TABLESPACE 사용권한 부여
GRANT RESOURCE TO user22;

-- 기존사용자의 TABLESPACE를 다시 지정:
-- 기본사용자 생성을 실행하면 
-- 사용자는 dafault tablespace를 SYSTEM(오라클 기본) tablespace로 설정한다.
-- 이 SYSTEM ts는 DBA 권한을 가진 사용자만 접근이 가능해서 
-- 기본적으로 CREATE TABLE등의 권한 만으로는 TABLE을 생성하기가 어렵다.
-- 그래서 별도로 사용자용 TABLESAPCE를 생성하고 이미 생성된 사용자를 
-- 새로 만든 TABLESPACE에 연결해 주는 것이 좋다.
-- 원칙은 TS를 먼저 생성하고, 사용자를 생성해서 DEFAULT TABLESPACE로 설정하는 것이 좋으나
-- 사용자를 먼저 등록하게 되면 나중에 다시 변경을 해서 사용자 TS를 지정할 수 있다.

-- DCL 명령어에서 CREATE DROP과 함께 사용할 수 있는 
-- ALTER 명령을 이용해서 변경을 수행한다.
ALTER USER22 DEFAULT TABLESPACE myts;

-- 비번 변경
ALTER USER user22 IDENFITIED BY 1111;


--user22에게 CRUD 권한을 부여
--CRUD권한을 부여하려면 먼저 table이 생성되어 있어야 한다.

--1. 개별적 권한 부여
GRANT SELECT ON tbl_test TO user22;
GRANT INSERT ON tbl_test TO user22;

--2. CRUD 일괄 권한 부여
GRANT SELECT, INSERT, UPDATE, DELETE ON tbl_test TO user22;

--현재 여기까지 user2를 생성하고, CRUD 권한을 부여했지만 아직 접속 권한을 부여하지 않았다.
--CONNECT 접속권한은 DB버전에 따라 권한 정도가 매우 다르다.
--11gEx에서는 상당히 높은 권한이 된다.
--따라서 CONNECT 권한은 일반적인 경우 사용하지 않고

GRANT CREATE SESSION TO user22;
--REVOKE CREATE TABLE FROM user22;
GRANT CREATE TABLE TO user22;

--USER2가 사용할 TABLE SPACE를 하나 생성
CREATE TABLESPACE myTs  --myTs라는 이름으로 DB 저장 공간 설정
DATAFILE 'D:/bizwork/Ordata/myts.dbf'  --실제 저장위치와 파일
SIZE 100M  --최초 확보할 용량
AUTOEXTEND ON NEXT 1M  --용량이 부족하면 1M씩 자동 확장
MAXSIZE UNLIMITED; --최대 용량 제한 없음

--TABLESPACE를 삭제하고, 모든 정보를 제거하라
DROP TABLESPACE myTs
INCLUDING CONTENTS AND DATAFILES 
CASCADE CONSTRAINTS;

DEFAULT TABLESPACE
