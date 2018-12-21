--여기는 user22입니당
CREATE TABLE tbl_users(
    str_userid CHAR(12) PRIMARY KEY,
    str_name NVARCHAR2(50) NOT NULL,
    str_tel NVARCHAR2(15),
    str_addr NVARCHAR2(50)
);


INSERT INTO tbl_users
VALUES ('001', '홍길동', '010-111-1111', '서울시');

INSERT INTO tbl_users
VALUES ('002', '임꺽정', '010-222-1111', '광주시');

INSERT INTO tbl_users
VALUES ('003', '성춘향', '010-333-1111', '인천시');

INSERT INTO tbl_users
VALUES ('004', '장길산', '010-444-1111', '부산시');

INSERT INTO tbl_users
VALUES ('005', '이몽룡', '010-555-1111', '제주시');

SELECT *
FROM tbl_users;


--현재 작성된 tbl_users테이블에 str_userid를 12자리로 설정을 했는데, 입력을 하다보니
--너무 많은 자리를 차지한다. 그래서 현재 입력 중인 id 개수인 3개로 크기를 바꿔 보려고 한다.
--이미 생성된 테이블의 칼럼 형식을 변경
--DDL 명령중 ALTER 명령을 사용한다.
ALTER TABLE tbl_users MODIFY str_userid NVARCHAR2(8);

ALTER TABLE tbl_users MODIFY str_name NVARCHAR2(5);
--CHAR형 데이터는 보이는 데이터와 달리 실제 크기만큼 공백등으로 이미 채워져있기 때문에 크기를 줄일 수 없음
--(n)VARCHAR2형 데이터는 보이는 데이터 중 가장 길이가 긴 데이터 만큼은 크기를 줄일 수 있다.

--INSERT를 실행할 때 전체칼럼이 아닌 특정 칼럼만 값이 있는 경우
INSERT INTO tbl_users (str_userid, str_name) VALUES('006', '에이');
INSERT INTO tbl_users (str_userid, str_name) VALUES('007', '비이');
INSERT INTO tbl_users (str_userid, str_name) VALUES('008', '씨이');
INSERT INTO tbl_users (str_userid, str_name) VALUES('009', '디이');
INSERT INTO tbl_users (str_userid, str_name) VALUES('010', '이이');

--INSERT를 실행할 때 데이터의 위치(순서)를 바꾸고자 할 때는
--TABLE의 칼럼리스트의 순서를 바꾸면 된다.
INSERT INTO tbl_users(str_name, str_userid) VALUES('에프', '011');

SELECT str_name, str_tel
FROM tbl_users;

SELECT *
FROM tbl_users
WHERE str_userid = '002';

SELECT *
FROM tbl_users
WHERE str_userid >= '003' and str_userid <= '006';

SELECT *
FROM tbl_users
WHERE str_userid BETWEEN '003' AND '006';


--SQL의 통계함수
--현재 tbl_users에 저장된 데이터 개수가 몇개냐?
--SUM, COUNT, AVG, MIN, MAX
--칼럼을 감싸는 함수
SELECT COUNT(*) FROM tbl_users; --현재 저장되어 있는 데이터 개수가 몇 개냐?
SELECT MIN(str_userid) FROM tbl_users;
SELECT MAX(str_userid) FROM tbl_users;

SELECT COUNT(*) AS 개수,
    MIN(str_userid) AS 작은값,
    MAX(str_userid) AS 큰값
FROM tbl_users;  






