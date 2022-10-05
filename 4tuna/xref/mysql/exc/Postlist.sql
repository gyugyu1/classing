select ctptSeq as postNo, 
ctptTitle as title,
ctptContent as content,
(select ctcmName from ctClassMember where ctptWriter = ctcmSeq ) as writer,
(select ifcdName from infrCode where brd.ctbotypecd = infrCode.ifcdSeq) as category,
pbrd.regDateTime as postedDate
from ctPost pbrd left join ctBoard brd on brd.ctboSeq = pbrd.ctboSeq 
where brd.ccseq = 1; -- 클래스 seq을 동적으로 입력받음