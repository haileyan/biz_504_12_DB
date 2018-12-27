--myMem

SELECT io_inout, COUNT(io_total), SUM(io_total)
FROM tbl_iolist
WHERE io_date BETWEEN '2018-03-01' and '2018-03-31'
     AND io_inout = '매입'  --날짜를 먼저 지정하는게 훨씬 효율적. (날짜범위지정 ->매입 >> 전체에서 '매입'찾기 ->날짜지정)
GROUP BY io_inout;    