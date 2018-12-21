--myMem

--GROUP BY를 이용해서 어떤 TABLE 데이터로부터 중복되지 않은 List를 추출하기
--SELECT를 실행 했을 떄 같은 값을 가진 리스트가 다수 나타나느데
--그들의 대표한 1개씩만 추출하고 싶을때 GROUP BY 절을 사용해서 SQL을 작성한다.

SELECT io_inont
FROM tbl_iolist;

SELECT io_inout
FROM tbl_iolist
GROUP BY io_inout;

--중복되지 않는 상품 리스트를 추출하는 SQL
SELECT io_cname
FROM tbl_iolist
GROUP BY io_cname;

--거래처명이 중복된 것을 묶어서 리스트로 보여달라
SELECT d_name
FROM tbl_dept
GROUP BY d_name;

SELECT d_name, d_ceo
FROM tbl_dept
GROUP BY d_name, d_ceo;


SELECT io_cname, count(io_cname)
FROM tbl_iolist
GROUP BY io_cname;


SELECT d_name, d_ceo, count(d_name)
FROM tbl_dept
GROUP BY d_name, d_ceo;









