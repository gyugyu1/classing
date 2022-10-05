<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="rb" uri="http://www.springframework.org/tags" %>

<jsp:useBean id="CodeServiceImpl" class="com.cacao.classting.code.CodeServiceImpl"/>

<!doctype html>
<html lang="ko">
<head>
<!-- Required meta tags -->
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<!-- Bootstrap CSS -->
<link href="/resources/common/bootstrap/bootstrap-5.1.3-dist/css/bootstrap.min.css"  rel="stylesheet" >
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.1.1/css/all.min.css"/>
<!-- <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous"> -->

<!-- Custom fonts for this template-->
<link href="/resources/common/vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
<link href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i" rel="stylesheet">

<!-- Custom styles for this template-->
<link href="/resources/common/css/sb-admin-2.min.css" rel="stylesheet">
<link href="/resources/user/css/classCommon.css" rel="stylesheet">
<link href="/resources/user/css/memberInfo.css" rel="stylesheet" type="text/css">
<link rel="shortcut icon" href="https://ifh.cc/g/nj4CTw.png" type="image/x-icon" />
<title id="ctl00_headerTitle">CLASSING</title>
</head>
<body>
<%@ include file="/WEB-INF/views/member/include/main_header.jsp" %><!-- header -->

<div class="container" id="main">
<c:set var="CodeGender" value="${CodeServiceImpl.selectListCachedCode('2')}"/>
<c:set var="CodeGrade" value="${CodeServiceImpl.selectListCachedCode('3')}"/>
<c:set var="CodeLogin" value="${CodeServiceImpl.selectListCachedCode('7')}"/>

	<div class="row">
		<div class="col-md-12">
		<form action="" method="post" id="memberInfo" name="memberInfo">
		<%-- <input type="hidden" name="mmSeq" id="mmSeq" value="<c:out value="${vo.mmSeq}"/>"> --%>
			<p id="title">개인정보</p>
			<p id="sub">프로필</p>
			<div class="col-10 mx-auto mb-4">
				<div class="position-relative">
					<div class="avatar size-140">
						<c:choose>
							<c:when test="${empty sessUuidName}">
								<img id="profilePhoto" style="width:; height: 100px;" src="/resources/common/image/profile2.png" class="img-fluid rounded-pill">
							</c:when>
							<c:otherwise>
								<img id="profilePhoto" style="width: 100px; height: 100px;" src="<c:out value="${sessPath}"/><c:out value="${sessUuidName}"/>" class="img-fluid rounded-pill">
							</c:otherwise>
						</c:choose>
					</div>
				</div>
			</div>
			<div class="col-10 mx-auto mb-4">
				<label class="form-label">이름</label>
				<input type="text" class="form-control" id="mmName" name="mmName" value="<c:out value="${item.mmName}"/>" > 
			</div>
<%-- 			<div class="col-10 mx-auto mb-4">
				<label class="form-label">프로필 사진</label>
					<c:forEach items="${uploadList}" var="itemUploaded" varStatus="statusUploaded">
					<c:choose>
						<c:when test="${itemUploaded.size ne 0}"><img id="mainimage" src="<c:out value="${itemUploaded.path}"/><c:out value="${itemUploaded.uuidName}"/>" style="width: 100px;"></c:when>
						<c:when test="${itemUploaded.size eq 0}"><p style="font-size: 13px; font-style: italic;">선택된 파일이 없습니다!</p></c:when>
						<c:otherwise></c:otherwise>
					</c:choose>
				</c:forEach>
			</div> --%>
			<div class="col-10 mx-auto mb-4">
				<label class="form-label">학교</label>
				<input type="text" class="form-control" id="" name="" value=""> 
			</div>
			<div class="col-10 mx-auto mb-4">
				<label class="form-label">학년</label>
				<select class="form-select" id="mmGradeCd" name="mmGradeCd" >
				<c:forEach items="${CodeGrade}" var="itemGrade" varStatus="statusGrade">
					<option value="<c:out value="${itemGrade.ifcdOrder}"/>" <c:if test="${item.mmGradeCd eq itemGrade.ifcdOrder }">selected</c:if> ><c:out value="${itemGrade.ifcdName}"/></option>	
				</c:forEach>
				</select>
			</div>
			<div class="col-10 mx-auto mb-4">
				<label class="form-label">프로필</label>
				<textarea class="form-control" id="mmDesc" name="mmDesc" rows="3"><c:out value="${item.mmDesc}" escapeXml="false"/></textarea>
			</div>
			<div class="col-10 mx-auto mb-4">
				<label class="form-label">성별</label>
				<select class="form-select" id="" name="" >
				<c:forEach items="${CodeGender}" var="itemGender" varStatus="statusGender">
					<option value="<c:out value="${itemGender.ifcdOrder}"/>" <c:if test="${item.mmGenderCd eq itemGender.ifcdOrder }">selected</c:if> ><c:out value="${itemGender.ifcdName}"/></option>	
				</c:forEach>
					
				</select>
			</div>
			<div class="col-10 mx-auto mb-4">
				<label class="form-label">생년월일</label>
				<input type="text" class="form-control" id="mmDob" name="mmDob" value="<c:out value="${item.mmDob}"/>" > 
			</div>
		<hr>
			<p id="sub">계정</p>
			<div class="col-10 mx-auto mb-4">
				<label class="form-label">아이디</label>
				<input type="text" class="form-control" id="mmId" name="mmId" value="<c:out value="${item.mmId}"/>"> 
			</div>
			<div class="col-10 mx-auto mb-4">
				<label class="form-label">이메일 주소</label>
				<input type="text" class="form-control" id="mmMemberEmail" name="mmMemberEmail" value="<c:out value="${item.mmMemberEmail}"/>" > 
			</div>
			<div class="col-10 mx-auto mb-4">
				<label class="form-label">휴대폰 번호</label>
				<input type="text" class="form-control" id="mmPhoneNumber" name="mmPhoneNumber" value="<c:out value="${item.mmPhoneNumber}"/>" > 
			</div>
			<div class="col-10 mx-auto mb-4">
				<label class="form-label">역할</label>
				<select class="form-select" id="mmTeacherNy" name="mmTeacherNy" >
					<option disabled>:: 역할 ::</option>
					<option value="0"<c:if test="${item.mmTeacherNy eq 0}">selected</c:if>>학생</option>	
					<option value="1"<c:if test="${item.mmTeacherNy eq 1}">selected</c:if>>선생님</option>	
				</select>
			</div>
		<hr>
			<p id="sub">알림설정</p>
			<div class="col-10 mx-auto mb-4">
				<label class="form-label">클래스 초대 수락</label>
				<div class="col-10">
					<div class="form-check form-check-inline">
						<input class="form-check-input" type="radio" name="mmAlarmInvitationNy" id="mmAlarmInvitationNy_y" value="1" <c:if test="${item.mmAlarmInvitationNy eq 1}">checked</c:if>>
						<label class="form-check-label" for="mmAlarmInvitationNy_y">동의</label>
					</div>
					<div class="form-check form-check-inline">
						<input class="form-check-input" type="radio" name="mmAlarmInvitationNy" id="mmAlarmInvitationNy_n" value="0" <c:if test="${item.mmAlarmInvitationNy eq 0}">checked</c:if> >
						<label class="form-check-label" for="mmAlarmInvitationNy_n">비동의</label>
					</div>
	 			</div> 
			</div>
			<div class="col-10 mx-auto mb-4">
				<label class="col-form-label">답글</label>
				<div class="col-10">
					<div class="form-check form-check-inline">
						<input class="form-check-input" type="radio" name="mmAlarmReplyNy" id="mmAlarmReplyNy_y" value="1" <c:if test="${item.mmAlarmReplyNy eq 1}">checked</c:if>>
						<label class="form-check-label" for="mmAlarmReplyNy_y">동의</label>
					</div>
					<div class="form-check form-check-inline">
						<input class="form-check-input" type="radio" name="mmAlarmReplyNy" id="mmAlarmReplyNy_n" value="0" <c:if test="${item.mmAlarmReplyNy eq 0}">checked</c:if>>
						<label class="form-check-label" for="mmAlarmReplyNy_n">비동의</label>
					</div>
	 			</div>
	 		</div>
			<p id="sub">동의설정</p>
			<div class="col-10 mx-auto mb-4">
				<label class="form-label">이벤트, 서비스 안내 수신(선택)</label>
				<div class="col-10">
					<div class="form-check form-check-inline">
						<input class="form-check-input" type="radio" name="mmEventNotificationNy" id="mmEventNotificationNy_y" value="1" <c:if test="${item.mmEventNotificationNy eq 1}">checked</c:if>>
						<label class="form-check-label" for="mmEventNotificationNy_y">동의</label>
					</div>
					<div class="form-check form-check-inline">
						<input class="form-check-input" type="radio" name="mmEventNotificationNy" id="mmEventNotificationNy_n" value="0" <c:if test="${item.mmEventNotificationNy eq 0}">checked</c:if>>
						<label class="form-check-label" for="mmEventNotificationNy_n">비동의</label>
					</div>
	 			</div> 
			</div>

		<hr>
			<div class="col-10 mx-auto mb-4">
			<button type="button" class="btn btn-outline-danger btn-lg mt-1 w-25 p-2" id="btn-nele" data-bs-toggle="modal" data-bs-target="#formModal">회원 탈퇴</button>
			
			<!-- Modal -->
			<div class="modal fade" id="formModal" tabindex="-1" aria-hidden="true">
				<div class="modal-dialog">
					<div class="modal-content">
					<div class="modal-header">
						<h5 class="modal-title" id="editModalLabel">회원탈퇴</h5>
						<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
					</div>
					<div class="modal-body">정말로 탈퇴하시겠습니까?</div>
					<div class="modal-footer">
						<button type="button" class="btn btn-secondary" data-bs-dismiss="modal">취소</button>
						<a class="btn btn-danger" role="button" href="/index">삭제</a>
					</div>
					</div>
				</div>
			</div>
			<button type="button" class="btn btn-outline-primary btn-lg mt-1 w-25 p-2" id="btn-edit" onclick="javascript:goEditForm();">정보 수정</button>
			</div>
		</form>	
	</div>
</div>
</div>
<%@ include file="/WEB-INF/views/member/include/main_footer.jsp" %><!-- footer -->


    <!-- Bootstrap core JavaScript-->
    <script src="/resources/common/vendor/jquery/jquery.min.js"></script>
    <script src="/resources/common/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

    <!-- Core plugin JavaScript-->
    <script src="/resources/common/vendor/jquery-easing/jquery.easing.min.js"></script>

    <!-- Custom scripts for all pages-->
    <script src="/resources/common/js/sb-admin-2.min.js"></script> 


<script type="text/javascript">


goEditForm = function(){
	$("#memberInfo").attr("action", "/memberInfoEdit");
	$("#memberInfo").submit();
};



$("#btnLogout").on("click", function(){
	
	$.ajax({
		async: true 
		,cache: false
		,type: "post"
		,url: "/member/logoutProc"
		/* ,data : { "mvmmId" : $("#mvmmId").val(), "mvmmPassword" : $("#mvmmPassword").val()} */
		,success: function(response) {
			if(response.rt == "success") {
				location.href = "/";
			} else {
				// by pass
			}
		}
		,error : function(jqXHR, textStatus, errorThrown){
			alert("ajaxUpdate " + jqXHR.textStatus + " : " + jqXHR.errorThrown);
		}
	});	
});
</script>



<!-- Option 1: Bootstrap Bundle with Popper -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
<script src="/resources/common/bootstrap/bootstrap-5.1.3-dist/js/bootstrap.bundle.min.js"></script>  

<!-- Option 2: Separate Popper and Bootstrap JS -->
<!-- 
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.10.2/dist/umd/popper.min.js" integrity="sha384-7+zCNj/IqJ95wo16oMtfsKbZ9ccEh31eOz1HGyDuCQ6wgnyJNSYdrPa03rtR1zdB" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.min.js" integrity="sha384-QJHtvGhmr9XOIpI6YVutG+2QOK9T+ZnN4kzFN1RtK3zEFEIsxhlmWl5/YESvpZ13" crossorigin="anonymous"></script>
 -->
</body>
</html>