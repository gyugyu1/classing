select ctptTitle, ctptContent,ctptWriter,regDateTime from ctPost where ctboSeq = 1;

-- 등록  
insert into ctPost (ctptTitle, ctptContent, ctptWriter, regDateTime)
select
	ctptTitle,
	ctptContent,
    ctptWriter,
    regDateTime

    from ctPost
    where ctboSeq = 1;




-- 수정
