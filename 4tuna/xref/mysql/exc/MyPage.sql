select mmName as name,
mmId as id,mmPassword as password,
(select ifcdName from infrCode where mmGenderCd = ifcdSeq) as gender,
mmteacherNy 'teacherNy',
(select ifcdName from infrCode where mmGradeCd = ifcdSeq) as grade,
mmDob as birthday ,
mmSchoolCd as school ,
(select ifcdName from infrCode where mmtypeOfloginCd = ifcdSeq) as 'logintype',
mmTermsOfServiceNy serviceNy,
mmEventNotificationNy as eventNotiNy,
mmPersonalInfoNy as personalInfoNy
 from Member;