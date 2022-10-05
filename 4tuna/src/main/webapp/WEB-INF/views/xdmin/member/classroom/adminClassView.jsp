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
<link href="../../../../../resources/common/vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
<link href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i" rel="stylesheet">

<!-- Custom styles for this template-->
<link href="../../../../../resources/common/css/sb-admin-2.css" rel="stylesheet">
<link href="../../../../../resources/common/css/classCommon.css" rel="stylesheet">
<link href="../../../../../resources/common/css/boardCss.css" rel="stylesheet">
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
  label {
  margin-top:10px;
  }
</style>



</head>
<body id="page-top">
<form id="classView" name="classView" method="post" action="deleteClass">
	<jsp:include page="/WEB-INF/views/member/include/admin_header.jsp" flush="true" />
<!-- Topbar end -->
	<input type="hidden" id="shOption" name="shOption" value="<c:out value="${vo.shOption}"/>">
	<input type="hidden" id="shValue" name="shValue" value="<c:out value="${vo.shValue}"/>">
	<input type="hidden" id="ctcsSeq" name="ctcsSeq" value="<c:out value="${item.ctcsSeq}"/>">
	<input type="hidden" id="ctcsDelNy" name="ctcsDelNy" value="<c:out value="${item.ctcsDelNy}"/>">
			<div class="row justify-content-center">
				<div class="col-md-10 d-flex justify-content-center" id="context">
					<div class="col-md-6">
						<h4  style="text-align: center;">클래스정보</h4>
							<label for="ctcsName" class="form-label">클래스 이름</label>
							<input type="text" class="form-control" id="ctcsName" name="ctcsName" value="<c:out value="${item.ctcsName}"/>" readonly>
							
							<label for="ctcsBelongto" class="form-label">소속 학교</label>
							<input type="text" class="form-control" id="ctcsBelongto" name="ctcsBelongto" value="<c:out value="${item.ctcsBelongto}"/>" readonly>
							
				            <label class="col-form-label" for="ctcsDesc">클래스설명</label>
				          	<textarea rows="3" cols="100" id="ctcsDesc" name="ctcsDesc" disabled><c:out value="${item.ctcsDesc}"/></textarea>
				        
				        	 <fmt:formatDate value="${item.regDateTime}" var="regDate" pattern="yyyy-MM-dd"/>
							<label for="regDate" class="form-label">생성날짜</label>
							<!-- datepicker 사용 -->
							<input type="text" class="form-control" id="regDate" name="regDate" value="<fmt:formatDate value="${item.regDateTime}"/>" readonly> 
							<!-- datepicker 사용 -->
							
							<label for="ctcmName" class="form-label">구성원</label>
							<div id="ctcmName" name="ctcmName">
							<c:forEach items="${list}" var="item" varStatus="status">
			      			 	 <img src="/resources/uploaded/common/profile2.png" alt="" width="32" height="32" class="rounded-circle me-2">
			      			 	<strong><c:out value="${item.ctcmName}"/></strong>
							</c:forEach>
							</div>
							
							<label for="ctcsCode" class="form-label">클래스 코드</label>
							<input type="text" class="form-control"  id="ctcsCode" name="ctcsCode" value="<c:out value="${item.ctcsCode}"/>" readonly>
							
							<div>
							<button type="button" class="btn btn-outline-danger btn-lg w-45" style="display: inline;" id="btn-add" data-bs-toggle="modal" data-bs-target="#classDelete">클래스 삭제</button>
							<button type="button" class="btn btn-outline-success btn-lg w-45" style="display: inline; float: right;" id="btn-add" onclick="location.href='./adminClassList'">클래스리스트</button>
							</div>
					</div>
				</div>
			</div>
	</div>	
	<div class="modal" tabindex="-1" id="classDelete">
		  <div class="modal-dialog">
		    <div class="modal-content">
		      <div class="modal-header">
		        <h5 class="modal-title">클래스 삭제</h5>
		        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
		      </div>
		      <div class="modal-body">
		    	삭제하시겠습니까?
			   </div>
		      <div class="modal-footer">
		        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">닫기</button>
		        <button type="submit" class="btn btn-danger">삭제</button>
		      </div>
		      </div>
		    </div>
		  </div>
	</form>
					
					

 <!-- Bootstrap core JavaScript-->
    <script src="../../../../../resources/common/vendor/jquery/jquery.min.js"></script>
    <script src="../../../../../resources/common/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

    <!-- Core plugin JavaScript-->
    <script src="../../../../../resources/common/vendor/jquery-easing/jquery.easing.min.js"></script>

    <!-- Custom scripts for all pages-->
    <script src="../../../../../resources/common/js/sb-admin-2.min.js"></script> 
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.min.js" integrity="sha384-QJHtvGhmr9XOIpI6YVutG+2QOK9T+ZnN4kzFN1RtK3zEFEIsxhlmWl5/YESvpZ13" crossorigin="anonymous"></script>
<script type="text/javascript">
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