--myMem

SELECT io_inout, COUNT(io_total), SUM(io_total)
FROM tbl_iolist
WHERE io_date BETWEEN '2018-03-01' and '2018-03-31'
     AND io_inout = '����'  --��¥�� ���� �����ϴ°� �ξ� ȿ����. (��¥�������� ->���� >> ��ü���� '����'ã�� ->��¥����)
GROUP BY io_inout;    