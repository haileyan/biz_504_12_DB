--myMem

--GROUP BY�� �̿��ؼ� � TABLE �����ͷκ��� �ߺ����� ���� List�� �����ϱ�
--SELECT�� ���� ���� �� ���� ���� ���� ����Ʈ�� �ټ� ��Ÿ������
--�׵��� ��ǥ�� 1������ �����ϰ� ������ GROUP BY ���� ����ؼ� SQL�� �ۼ��Ѵ�.

SELECT io_inont
FROM tbl_iolist;

SELECT io_inout
FROM tbl_iolist
GROUP BY io_inout;

--�ߺ����� �ʴ� ��ǰ ����Ʈ�� �����ϴ� SQL
SELECT io_cname
FROM tbl_iolist
GROUP BY io_cname;

--�ŷ�ó���� �ߺ��� ���� ��� ����Ʈ�� �����޶�
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









