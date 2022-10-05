use classing;

select * from Member;

select 
ctptSeq
,ctptTitle
,ctptContent 
,(select ctcmName from ctClassMember where ctptWriter = ctcmSeq ) as writer
,(select ifcdName from infrCode where b.ctbotypecd = infrCode.ifcdSeq) as category
,b.regDateTime 
from ctPost a 
left join ctBoard b on b.ctboSeq = a.ctboSeq; 

use classing;

		SELECT
			a.cthsSeq
			,a.cthsTitle
			,a.cthsWriter
			,a.cthsDesc
			,a.cthsData 
			,a.cthsScore
			,a.cthsUseNy
			,a.cthsDelNy
			,a.regDateTime
			,b.ctcsSeq
		FROM
			ctHomeworkSubmit a
			LEFT JOIN ctHomeworkPost b on b.cthpSeq = a.cthpSeq
		WHERE 1=1
			AND a.cthpSeq = 1
			AND b.ctcsSeq = 1;