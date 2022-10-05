<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="rb" uri="http://www.springframework.org/tags" %>

<!doctype html>
<html lang="ko">
<head>
<!-- Required meta tags -->
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<!-- Bootstrap CSS -->
<!-- Bootstrap CSS -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.1.0/css/all.min.css" />

<!-- Custom fonts for this template-->
<link href="../../../../resources/common/vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
<link href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i" rel="stylesheet">

<!-- Custom styles for this template-->
<link href="../../../../resources/common/css/sb-admin-2.css" rel="stylesheet">
<link href="../../../../resources/common/css/classCommon.css" rel="stylesheet">
<link href="../../../../resources/common/css/boardCss.css" rel="stylesheet">
<link href="/resources/common/jquery/jquery-ui-1.13.1.custom/jquery-ui.css" rel="stylesheet">
<link rel="shortcut icon" href="https://ifh.cc/g/nj4CTw.png" type="image/x-icon" />
<title id="ctl00_headerTitle">CLASSING</title>



<style type="text/css">
/*  	body{
		background-color: #F9F9FA;
	}
 */
 body{
		background-color: #F6F9F7;
	}
#sidebar {
	background-color: white;
}

.btn-toggle {
	font-size: 15px;
	font-weight: bold;
}

#home {
	margin-left: 40px;
}

#class {
	margin-left: 20px;
}

.icon {
	display: inline;
	margin-right: 20px;
}

#classImg {
	float: left;
}

#classInfo {
	float: right;
	font-size: 15px;
	padding-top: 3px;
}

#menuList {
	clear: both;
}

#btn-add {
	border-radius: 50px;
	font-size: 14px;
	font-weight: bold;
	margin-top: 10px;
	margin-bottom: 30px;
}

.profile_box {
	border-radius: 70%;
	overflow: hidden;
	width: 30px;
	height: 30px;
}

.profile {
	width: 100%;
	height: 100%;
	object-fit: cover;
}



.container_title {
	border: 1px solid #dee2e6 !important;
	border-radius: 0.25rem;
	padding: 1.5rem;
	background-color: white;
	margin-bottom: 1.3rem;
}

.container_title>.header {
	font-size: 1.5rem;
	font-weight: bold;
	color: #5a5c69;
}

.container_title>.body {
	font-size: 0.8rem;
	font-weight: 500;
}

.container_title>.footer {
	display: flex;
	justify-content: end;
}

.container_title>.footer>button {
	width: 110px;
}

.homework_list > div {
	 box-shadow: 0 0.15rem 1.75rem 0 rgba(58, 59, 69, 0.15) !important;
}


.container_base:nth-child(2) {
	border-radius: 0.25rem 0.25rem 0 0;
}

.container_base:last-child {
	border-radius: 0 0 0.25rem 0.25rem;
	border-bottom-style: solid;
}

.container_base .homework_listitem {
	padding: 0px;
}

.container_base .header {
	margin: 0.5rem 0 0.5rem 0;
}

.container_base .header {
	display:flex;
	align-items:center;
	gap : 0.5rem;
}

.container_base .header>span {
	font-size: 0.75rem;
}


.container_base .header>span:nth-child(3) {
	color: #858796;
	font-weight: 400;
}

.container_base .body {
	margin: 0.15rem;
}

.container_base .body>.badge {
	padding: 6px;
}

.container_base .body>span:nth-child(3) {
	color: #5a5c69;
}

.container_base .body>div:nth-child(4) {
	font-size: 0.8rem;
}

.container_base .footer {
	margin-top: 3rem;
}

.container_base .footer>* {
	margin-right: 0.5rem;
}

.badge_hw {
	background-color: #cfe2f3;
	color: #4e73df;
}

.badge_after3 {
	background-color: white;
	border: 1px solid #f6c23e;
	color: #f6c23e;
}

.badge_todayend {
	color: #e74a3b;
	border: 1px solid #e74a3b;
}

.badge_alreadyend {
	color: #858796;
	border: 1px solid #858796;
}

.badge_afterNday {
	color: #1cc88a;
	border: 1px solid #1cc88a;
}

.badge_graded {
	color: #4e73df;
	border: 1px solid #4e73df;
}
  textarea {
    width: 100%;
    height: 6.25em;
    resize: none;
    border-radius:10px;
    border: 1px solid silver;
  }
  
</style>



</head>
<body id="page-top">
<jsp:include page="/WEB-INF/views/member/include/admin_header.jsp" flush="true" />
	<form id ="memberEdit" name="memberEdit" method="post" action="updateMember"enctype="multipart/form-data">
	<input type="hidden" id="mmSeq" name ="mmSeq" value="<c:out value="${item.mmSeq}"/>">
	<input type="hidden" id="shOption" name="shOption" value="<c:out value="${vo.shOption}"/>">
	<input type="hidden" id="shValue" name="shValue" value="<c:out value="${vo.shValue}"/>">
	<div class="row justify-content-center">
			<div class="col-md-10 d-flex justify-content-center" id="context">
			<div class="col-md-6">
				<h4 style="text-align: center;">회원정보 수정</h4>
				<h5>프로필</h5>
					<label for="mmName" class="form-label">이름</label>
					<input type="text" class="form-control" id="mmName" name="mmName" value="<c:out value="${item.mmName}"/>">
					<label for="classImg" class="form-label">클래스 사진</label>
					<div >
						<c:if test="${item.path ne null}"><img class="img-profile rounded-circle" width="35px" height="35px" src="${item.path}${item.uuidName}"></c:if>
						<input type="file" class="d-none w-0 h-0 position-absolute" id="profile-upload" name="file0">
					<label for="profile-upload" data-bs-toggle="tooltip" data-bs-placement="bottom" class="btn btn-primary me-3"> Upload photo </label>
					</div>
					<label for="mmSchoolCd" class="form-label">소속 학교</label>
					<input type="text" class="form-control" id="classSchool" name="classSchool"  value="<c:out value="${item.mmSchoolCd}"/>">
							
				<label for="mmGradeCd" class="form-label">담당학년</label>
				<select class="form-select" id="mmGradeCd" name="mmGradeCd">
					<option value="0">학년 선택
					<option value="1" <c:if test="${item.mmGradeCd eq 1 }">selected</c:if>>1학년
					<option value="2" <c:if test="${item.mmGradeCd eq 2 }">selected</c:if>>2학년
					<option value="3" <c:if test="${item.mmGradeCd eq 3 }">selected</c:if>>3학년
					<option value="4" <c:if test="${item.mmGradeCd eq 4 }">selected</c:if>>4학년
					<option value="5" <c:if test="${item.mmGradeCd eq 5 }">selected</c:if>>5학년
					<option value="6" <c:if test="${item.mmGradeCd eq 6 }">selected</c:if>>6학년
				</select>
		            <label class="col-form-label" for="mmDesc">프로필</label>
		          	  <textarea rows="3" cols="100" id="mmDesc" name="mmDesc"><c:out value="${item.mmDesc}"/></textarea>
					<label for="mmGenderCd" class="form-label">성별</label>
					<select class="form-select" id="mmGenderCd" name="mmGenderCd">
						<option  value="0">성별 선택
						<option value="1" <c:if test="${item.mmGenderCd eq 1 }">selected</c:if>>남
						<option value="2" <c:if test="${item.mmGenderCd eq 2 }">selected</c:if>>여
						<option value="3" <c:if test="${item.mmGenderCd eq 3 }">selected</c:if>>선택안함
					</select>
					<label for="mmDob" class="form-label">생일정보</label>
					<!-- datepicker 사용 -->
					<input type="text" class="form-control" id="mmDob" name="mmDob" value="<c:out value="${item.mmDob}"/>"> 
					<!-- datepicker 사용 -->
		<hr>
			<h5>계정</h5>
				<label for="mmId" class="form-label">아이디</label>
				<input type="text" class="form-control" id="mmId" name="mmId" value="<c:out value="${item.mmId}"/>">
				<label for="mmPassword" class="form-label">비밀번호</label>
				<input type="text" class="form-control" id="mmPassword" name="mmPassword" value="<c:out value="${item.mmPassword}"/>">
				
				<label for="mmMemberEmail" class="form-label">이메일</label>
				<input type="text" class="form-control"  id="mmMemberEmail" name="mmMemberEmail" value="<c:out value="${item.mmMemberEmail}"/>">
			
				<label for="mmPhoneNumber" class="form-label">휴대폰 번호</label>
					<input type="text" class="form-control"  id="mmPhoneNumber" name="mmPhoneNumber" value="<c:out value="${item.mmPhoneNumber}"/>">

			<label for="mmTeacherNy" class="form-label">역할</label>
				<select class="form-select" id="mmTeacherNy" name="mmTeacherNy">
					<option value="1" <c:if test="${item.mmTeacherNy eq 1 }">selected</c:if>>선생님
					<option value="2" <c:if test="${item.mmTeacherNy eq 0 }">selected</c:if>>학생
				</select>
		<hr>
		
		<h5>알림 상세 설정</h5>
			<label for="mmAlarmInvitationNy" class="form-label">클래스 초대/수락</label>
				<select class="form-select" id="mmAlarmInvitationNy" name="mmAlarmInvitationNy">
					<option value="1" <c:if test="${item.mmAlarmInvitationNy eq 1 }">selected</c:if>>알림 받기
					<option value="0" <c:if test="${item.mmAlarmInvitationNy eq 0 }">selected</c:if>>알림 거부
				</select>
			<label for="mmEventNotificationNy" class="form-label">홈소식</label>
				<select class="form-select" id="mmEventNotificationNy" name="mmEventNotificationNy">
					<option value="1" <c:if test="${item.mmEventNotificationNy eq 1 }">selected</c:if>>모든 소식 알림
					<option value="0" <c:if test="${item.mmEventNotificationNy eq 0 }">selected</c:if>>알림 거부
				</select>
			<label for="mmAlarmReplyNy" class="form-label">답글</label>
				<select class="form-select" id="mmAlarmReplyNy" name="mmAlarmReplyNy">
					<option value="1" <c:if test="${item.mmAlarmReplyNy eq 1 }">selected</c:if>>모든 답글 알림
					<option value="0" <c:if test="${item.mmAlarmReplyNy eq 0 }">selected</c:if>>알림 거부
				</select>
			<div>
				<button type="button" class="btn btn-outline-success btn-lg w-45" style="display: inline; float: right;" id="btn-add" data-bs-toggle="modal" data-bs-target="#Change">수정</button>
				<button type="button" class="btn btn-outline-warning btn-lg w-45" style="display: inline; float: right; " id="btn-add" onclick="javascript:goView(<c:out value='${item.mmSeq}'/>);">돌아가기</button>
			</div>
			
			</div>
		</div>
	</div>
	<!-- modal -->
		<div class="modal" tabindex="-1" id="Change">
		  <div class="modal-dialog">
		    <div class="modal-content">
		      <div class="modal-header">
		        <h5 class="modal-title">회원정보 변경</h5>
		        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
		      </div>
		      <div class="modal-body">
		    	수정하시겠습니까?
			   </div>
		      <div class="modal-footer">
		        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">닫기</button>
		        <button type="submit" class="btn btn-primary">확인</button>
		      </div>
		      </div>
		    </div>
		  </div>
		<!-- modal end -->
		
		</div>
	</form>			
					
		


 <!-- Bootstrap core JavaScript-->
    <script src="../../../../resources/common/vendor/jquery/jquery.min.js"></script>
    <script src="../../../../resources/common/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

    <!-- Core plugin JavaScript-->
    <script src="../../../../resources/common/vendor/jquery-easing/jquery.easing.min.js"></script>

    <!-- Custom scripts for all pages-->
    <script src="../../../../resources/common/js/sb-admin-2.min.js"></script> 

	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.min.js" integrity="sha384-QJHtvGhmr9XOIpI6YVutG+2QOK9T+ZnN4kzFN1RtK3zEFEIsxhlmWl5/YESvpZ13" crossorigin="anonymous"></script>
<script src="/resources/common/jquery/jquery-ui-1.13.1.custom/jquery-ui.js" rel="stylesheet"></script>
<script type="text/javascript">

goView = function(seq) {
	$("#mmSeq").val(seq);
	$("#memberEdit").attr("action","/adminMemberView");
	$("#memberEdit").submit();
}

$(document).ready(function(){
	 $("#mmDob").datepicker();
}); 

$.datepicker.setDefaults({
   dateFormat: 'yy-mm-dd',
   prevText: '이전 달',
   nextText: '다음 달',
   monthNames: ['1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월', '9월', '10월', '11월', '12월'],
   monthNamesShort: ['1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월', '9월', '10월', '11월', '12월'],
   dayNames: ['일', '월', '화', '수', '목', '금', '토'],
   dayNamesShort: ['일', '월', '화', '수', '목', '금', '토'],
   dayNamesMin: ['일', '월', '화', '수', '목', '금', '토'],
   showMonthAfterYear: true,
   yearSuffix: '년'
   });
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


</body>
</html>