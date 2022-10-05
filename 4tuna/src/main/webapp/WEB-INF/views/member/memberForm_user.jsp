<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="rb" uri="http://www.springframework.org/tags"%>

<jsp:useBean id="CodeServiceImpl" class="com.cacao.classting.code.CodeServiceImpl" />

<!doctype html>
<html lang="ko">
<head>
<!-- Required meta tags -->
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<!-- Bootstrap CSS -->
<link href="/resources/common/bootstrap/bootstrap-5.1.3-dist/css/bootstrap.min.css" rel="stylesheet">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.1.1/css/all.min.css" />
<!-- <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous"> -->

<!-- Custom fonts for this template-->
<link href="/resources/common/vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
<link href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i" rel="stylesheet">

<!-- Custom styles for this template-->
<link href="/resources/common/css/sb-admin-2.min.css" rel="stylesheet">
<link href="/resources/user/css/classCommon.css" rel="stylesheet">
<link href="/resources/user/css/memberForm_user.css" rel="stylesheet" type="text/css">
<link rel="shortcut icon" href="https://ifh.cc/g/nj4CTw.png" type="image/x-icon" />
<title id="ctl00_headerTitle">CLASSING</title>
</head>
<body>
	<div class="container my-wrap">
		<!-- 헤더 s -->
		<div class="container my-wrap">
			<!-- d-none d-sm-block : sm사이즈에서는 보이지 않음 d-block d-sm-none : sm에서만 보임 -->
			<div class="row mt-5 mb-4 ">
				<div class="d-grid gap-2 col-12 mx-auto mt-3">
					<img src="/resources/common/image/header_logo.png" style="width: 240px; margin-left: 30px;" onclick="location.href='/index'">
				</div>
			</div>
		</div>
		<!-- 헤더 e-->
		<c:set var="CodeGender" value="${CodeServiceImpl.selectListCachedCode('2')}" />
		<c:set var="CodeGrade" value="${CodeServiceImpl.selectListCachedCode('3')}" />
		<c:set var="CodeLogin" value="${CodeServiceImpl.selectListCachedCode('7')}" />
		<form action="/memberInst" method="post" id="memberForm" name="memberForm" class="row" enctype="multipart/form-data">
			<input type="hidden" id="mmSeq" name="mmSeq" value="<c:out value="${vo.mmSeq}"/>">
			<input type="hidden" id="mmTypeOfLoginCd" name="mmTypeOfLoginCd" value="23">
			<!-- 정보입력 s -->
			<div class="mt-4 mb-4">
				<h3 class="text-center">회원가입</h3>
			</div>
			<div class="col-12 mx-auto mb-4">
				<label class="form-label">
					<b>이름</b>
				</label>
				<input type="text" class="form-control" id="mmName" name="mmName" placeholder="">
			</div>
			<div class="col-12 mx-auto mb-4">
				<label class="form-label">
					<b>아이디</b>
				</label>
				<input type="text" class="form-control" id="mmId" name="mmId" placeholder="영소문자/숫자 5~20자리">
			</div>
			<div class="col-12 mb-4">
				<label class="form-label">
					<b>비밀번호</b>
				</label>
				<input type="password" class="form-control mb-2" id="mmPassword" name="mmPassword" placeholder="영문/숫자/특수문자 조합 8~20자리(대소문자 포함)">
				<input type="password" class="form-control" id="mmPasswordChk" name="mmPasswordChk" placeholder="비밀번호 확인">
			</div>
			<div class="col-12 mb-4">
				<label class="form-label">
					<b>이메일</b>
				</label>
				<input type="text" class="form-control mb-2" id="mmMemberEmail" name="mmMemberEmail" placeholder="@를 포함한 형태로 입력">
			</div>
			<div class="col-12 mb-4">
				<label class="form-label">
					<b>전화번호</b>
				</label>
				<input type="text" class="form-control mb-2" id="mmPhoneNumber" name="mmPhoneNumber" placeholder="숫자만 입력 (에. 01012345678)">
			</div>
			<div class="col-12 mb-4">
				<label class="form-label">
					<b>생년월일</b>
				</label>
				<input type="text" class="form-control mb-2" id="mmDob" name="mmDob" placeholder="숫자만 입력 (에. 19981123)">
			</div>
			<div class="col-12 mb-4">
				<label class="form-label">
					<b>성별</b>
				</label>
				<select class="form-select" id="mmGenderCd" name="mmGenderCd">
					<option value="">:: 선택 ::</option>
					<c:forEach items="${CodeGender}" var="itemGender" varStatus="statusGender">
						<option value="<c:out value="${itemGender.ifcdOrder}"/>"><c:out value="${itemGender.ifcdName}" /></option>
					</c:forEach>
				</select>
			</div>
			<div class="col-12 mb-4">
				<label class="form-label">
					<b>학년</b>
				</label>
				<select class="form-select" id="mmGradeCd" name="mmGradeCd">
					<option value="">:: 선택 ::</option>
					<c:forEach items="${CodeGrade}" var="itemGrade" varStatus="statusGrade">
						<option value="<c:out value="${itemGrade.ifcdOrder}"/>" <c:if test="${item.mmGradeCd eq itemGrade.ifcdOrder }">selected</c:if>><c:out value="${itemGrade.ifcdName}" /></option>
					</c:forEach>
				</select>
			</div>
			<div class="col-12 mb-4">
				<label class="form-label">
					<b>프로필 사진</b>
				</label>
				<label for="profile-upload" data-bs-toggle="tooltip" data-bs-placement="bottom" class="btn btn-success me-3"> 사진 업로드</label>
				<input type="file" class="d-none w-0 h-0 position-absolute" id="profile-upload" name="ctcmProfile">
			</div>
			<!-- 			<div class="col-12 mb-4">
				<label class="form-label"><b>프로필 사진</b></label>
				<div class="input-group">
					<input type="file" class="form-control mb-2" id="file0" name="file0">
				</div>
				<img style="width: 100px;" id="preview-image0" src="">
			</div> -->

			<div class="col-12 mx-auto mb-4">
				<label class="form-label">
					<b>역할</b>
				</label>
				<div class="form-check">
					<div class="form-check form-check-inline">
						<input class="form-check-input" type="radio" name="mmTeacherNy" id="mmTeacherNy_n" value="0">
						<label class="form-check-label">학생</label>
					</div>
					<div class="form-check form-check-inline">
						<input class="form-check-input" type="radio" name="mmTeacherNy" id="mmTeacherNy_y" value="1">
						<label class="form-check-label">선생님</label>
					</div>
				</div>
			</div>
			<div class="col-12 mx-auto mb-4">
				<label class="form-label">
					<b>클래스 초대 수락 알림</b>
				</label>
				<div class="form-check">
					<div class="form-check form-check-inline">
						<input class="form-check-input" type="radio" name="mmAlarmInvitationNy" id="mmAlarmInvitationNy_y" value="1">
						<label class="form-check-label">동의</label>
					</div>
					<div class="form-check form-check-inline">
						<input class="form-check-input" type="radio" name="mmAlarmInvitationNy" id="mmAlarmInvitationNy_n" value="0">
						<label class="form-check-label">비동의</label>
					</div>
				</div>
			</div>
			<div class="col-12 mx-auto mb-4">
				<label class="form-label">
					<b>답글 알림</b>
				</label>
				<div class="form-check">
					<div class="form-check form-check-inline">
						<input class="form-check-input" type="radio" name="mmAlarmReplyNy" id="mmAlarmReplyNy_y" value="1">
						<label class="form-check-label">동의</label>
					</div>
					<div class="form-check form-check-inline">
						<input class="form-check-input" type="radio" name="mmAlarmReplyNy" id="mmAlarmReplyNy_n" value="0">
						<label class="form-check-label">비동의</label>
					</div>
				</div>
			</div>
			<div class="col-12 mx-auto mb-4">
				<label class="form-label mb-3">
					<b>약관동의</b>
				</label>
				<div class="form-check mb-3">
					<input class="form-check-input" type="checkbox" value="" id="consentAll" name="consentAll">
					<label class="form-check-label">
						<strong>전체동의</strong>
					</label>
					<i class="fa-solid fa-angle-right float-end pt-1" style="color: gray;"></i>
				</div>
				<hr class="w-100" style="color: #A2969C">
				<div class="form-check mb-3">
					<input class="form-check-input" type="checkbox" value="1" name="mmTermsOfserviceNy" id="mmTermsOfserviceNy_y">
					<input class="form-check-input" type="hidden" value="0" name="mmTermsOfserviceNy" id="mmTermsOfserviceNy_n">
					<label class="form-check-label">
						클래씽 이용약관
						<span style="color: red;">(필수)</span>
					</label>
					<i class="fa-solid fa-angle-right float-end pt-1" style="color: gray;"></i>
				</div>
				<div class="form-check mb-3">
					<input class="form-check-input" type="checkbox" value="1" name="mmPersonalInfoNy" id="mmPersonalInfoNy_y">
					<input class="form-check-input" type="hidden" value="0" name="mmPersonalInfoNy" id="mmPersonalInfoNy_n">
					<label class="form-check-label">
						개인정보 수집 및 이용
						<span style="color: red;">(필수)</span>
					</label>
					<i class="fa-solid fa-angle-right float-end pt-1" style="color: gray;"></i>
				</div>
				<hr class="w-100" style="color: #A2969C">
				<div class="form-check mb-3">
					<input class="form-check-input" type="checkbox" value="1" name="mmEventNotificationNy" id="mmEventNotificationNy_y">
					<input class="form-check-input" type="hidden" value="0" name="mmEventNotificationNy" id="mmEventNotificationNy_n">
					<label class="form-check-label">이벤트, 서비스 안내 수신(선택)</label>
					<i class="fa-solid fa-angle-right float-end pt-1" style="color: gray;"></i>
				</div>
			</div>
			<div class="d-grid gap-2 col-12 mx-auto  mb-5">
				<button class="btn btn-submit btn-sm" type="submit" id="btn-submit" name="">가입완료</button>
			</div>
		</form>
	</div>
	<!-- Option 1: Bootstrap Bundle with Popper -->
	<script src="http://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
	<script src="/resources/common/js/validation.js"></script>
	<script src="/resources/common/js/commonXdmin.js"></script>
	<script src="/resources/common/js/validation.js"></script>
	<script>

/* 	let profileInput = document.getElementById("profile-upload");
	let img = document.querySelector('#profilePhoto');
	
	profileInput.onchange = (e) => {
		
		var ext = $("#profile-upload")[0].files[0].name.split('.').pop().toLowerCase();
		if(extArrayImage.indexOf(ext) == -1){
			alert("허용된 확장자가 아닙니다.");
			return false;
		}
		
		img.classList.add('preview');
		img.src = URL.createObjectURL(e.target.files[0]);
	}
	 */
	
 	let profileInput = document.getElementById("profile-upload");
	let img = document.querySelector('#profilePhoto');
	
		
	profileInput.onchange = (e) => {
		
		var ext = $("#profile-upload")[0].files[0].name.split('.').pop().toLowerCase();
		
		img.classList.add('preview');
		img.src = URL.createObjectURL(e.target.files[0]);
	}
	 











 $('#consentAll').click(function(){
	var checked = $('#consentAll').is(':checked');
	if(checked)
		$('input:checkbox').prop('checked',true);
}); 


 
 
 
 
$("#btn-submit").on("click", function(){


	/* mmName */
	if(!checkNull($("#mmName"), $("#mmName").val(), "이름을 입력하세요.")) return false;
		
	/* kbmmId */
  	if(!checkNull($("#mmId"), $("#mmId").val(), "아이디를 입력하세요.")) return false;
 	if(!checkId($("#mmId"), $("#mmId").val(), "아이디를 형식에 맞게 입력하세요. (영문/숫자/특수문자 조합 8~15자리(대소문자 구분))")) return false;

 	/* kbmmPassword */
  	if(!checkNull($("#mmPassword"), $("#mmPassword").val(), "비밀번호를 입력하세요.")) return false;
 	if(!checkPassword($("#mmPassword"), $("#mmPassword").val(), "비밀번호를 형식에 맞게 입력하세요. (영문/숫자/특수문자 조합 8~20자리(대소문자 구분))")) return false; 
 
 	/* mmMemberEmail */
 	if(!checkNull($("#mmMemberEmail"), $("#mmMemberEmail").val(), "이메일을 입력하세요.")) return false;
 	if(!checkEmail($("#mmMemberEmail"), $("#mmMemberEmail").val(), "이메일을 형식에 맞게 입력하세요. (@를 포함한 형태)")) return false; 
 	
 	/* mmPhoneNumber */
 	if(!checkNull($("#mmPhoneNumber"), $("#mmPhoneNumber").val(), "휴대폰번호를 입력하세요.")) return false;
 	if(!checkOnlyNumber($("#mmPhoneNumber"), $("#mmPhoneNumber").val(), "휴대폰번호는 숫자만 입력 가능합니다.")) return false; 
 	
 	/* mmDob */
	if(!checkNull($("#mmDob"), $("#mmDob").val(), "생년월일을 입력하세요")) return false;
 	if(!checkDob($("#mmDob"), $("#mmDob").val(), "생년월일을 8자리 숫자로 입력 가능해주세요.")) return false;	 
	
 	
 	/* mmGenderCd */
	if(!checkNull($("#mmGenderCd"), $("#mmGenderCd").val(), "성별을 선택하세요.")) return false; 
 	
 	/* mmGradeCd */
	if(!checkNull($("#mmGradeCd"), $("#mmGradeCd").val(), "학년을 선택하세요.")) return false;

 	
 	if ($("input:radio[name=mmTeacherNy]").is(":checked") == false) {
		alert("역할을 선택하세요.");
		return false;
	} 
 	if ($("input:radio[name=mmAlarmInvitationNy]").is(":checked") == false) {
		alert("클래스 초대 수락 알림 동의여부를 선택하세요.");
		return false;
	} 
 	if ($("input:radio[name=mmAlarmReplyNy]").is(":checked") == false) {
		alert("댓글알림 동의여부를 선택하세요.");
		return false;
	} 
	 
 	
 	if ($("input:checkbox[name=mmTermsOfserviceNy]").is(":checked") == false) {
		alert("필수항목은 반드시 동의하세요. (클래씽 이용약관)");
		return false;
	} 
	 
	if ($("input:checkbox[name=mmPersonalInfoNy]").is(":checked") == false) {
		alert("필수항목은 반드시 동의하세요. (개인정보 수집 및 이용안내)");
		return false;
	}
	 
	alert("회원가입이 완료되었습니다.");
	
	$("#memberForm").attr("action", "/memberInst");
	$("#memberForm").submit();

	
});
</script>

	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
	<script src="/resources/common/bootstrap/bootstrap-5.1.3-dist/js/bootstrap.bundle.min.js"></script>

	<!-- Option 2: Separate Popper and Bootstrap JS -->
	<!-- 
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.10.2/dist/umd/popper.min.js" integrity="sha384-7+zCNj/IqJ95wo16oMtfsKbZ9ccEh31eOz1HGyDuCQ6wgnyJNSYdrPa03rtR1zdB" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.min.js" integrity="sha384-QJHtvGhmr9XOIpI6YVutG+2QOK9T+ZnN4kzFN1RtK3zEFEIsxhlmWl5/YESvpZ13" crossorigin="anonymous"></script>
 -->
</body>
</html>