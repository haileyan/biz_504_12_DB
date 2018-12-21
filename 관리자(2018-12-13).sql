--여기는 관리자 화면입니다
CREATE USER myuser IDENTIFIED BY 1234;
--아직 tablespace를 생성하기 전에 사용자를 먼저 등록하다 보니
--DEFAULT TABLESPACE를 지정하지 않았다
--이럴경운 DEFALUT TABLESPACE는 SYSTEM 설정 값으로 지정되는데,
--이것은 실무에서 매우 위험한 방법
(DEFAULT TABLESPACE...)

GRANT DBA to myuser;
GRANT CREATE SESSION TO myuser;

CREATE TABLESPACE myTBL
DATAFILE 'd:/bizwork/ordata/mytbl.dbf'
SIZE 100M
AUTOEXTEND ON NEXT 1M
MAXSIZE UNLIMITED;
--myuser 사용자에게 TABLESPACE를 생성하지 않았다

--이제 새로운 TABLESPACE를 생성했으므로
--myuser에게 default tablespace를 지정하겠다
ALTER USER myuser DEFAULT TABLESPACE myTBL;