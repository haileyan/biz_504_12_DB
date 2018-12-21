--여기는 user1으로 접속한 화면입니다.
--user1은 dba 권한을 갖고 있다.

--table 생성
--TABLE이름 : tbl_std
--st_num, st_name, st_tel, st_addr, int_age, int_grade 칼럼을 가지고 있고,
--st_num는 PK로 설정 되어 있고, st_name은 빈칸이 없는 제약사항이 설정되어 있다.
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


--홍길동, 이몽룡, 성춘향, 임꺽정, 장길산 이름을 기준으로
--나머지 항목을 자유롭게 설정하여 데이터를 추가하시오
INSERT INTO tbl_std
VALUES ('001', '홍길동', '010-111-1111', '서울시', 017, 01);

INSERT INTO tbl_std
VALUES('002', '이몽룡', '010-222-1111', '광주시', 020, 02);

INSERT INTO tbl_std
VALUES ('003', '성춘향', '010-333-1111', '부산시', 018, 03);

INSERT INTO tbl_std
VALUES ('004', '임꺽정', '010-444-1111', '남원시', 021, 02);

INSERT INTO tbl_std
VALUES ('005', '장길산', '010-555-1111', '대전시', 019, 04);