select ctadRegDateTime from ctAttendance where ctcmSeq = 1; -- 출석기록

select count(ctadRegDateTime) from ctAttendance where ctcmseq=1; -- 총 출석일