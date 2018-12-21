--여기는 user1으로 접속한 화면
--이름(o_name), 전화번호(o_tel), 주소(o_addr), 회사(o_comp), 부서(o_dept)
--칼럼을 갖는 tbl_office 테이블을 생성하시오.
--단, id는 PK로 선언하고
--이름은 NOT NULL로 선언하시오

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

