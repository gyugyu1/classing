<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="rb" uri="http://www.springframework.org/tags" %>
<!DOCTYPE html>
<html lang="en">

<head>

<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="description" content="">
<meta name="author" content="">
<link rel="shortcut icon" href="https://ifh.cc/g/nj4CTw.png" type="image/x-icon" />
<title id="ctl00_headerTitle">CLASSING</title>
<!-- Bootstrap CSS -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.1.0/css/all.min.css" />

<!-- Custom fonts for this template-->
<link href="/resources/common/vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
<link href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i" rel="stylesheet">

<!-- Custom styles for this template-->
<link href="/resources/common/css/sb-admin-2.css" rel="stylesheet">
<link href="/resources/user/css/classCommon.css" rel="stylesheet">
<link href="/resources/common/css/boardCss.css" rel="stylesheet">
<style type="text/css">


/* 스위치 */
/* The switch - the box around the slider */
.switch {
	position: relative;
	display: inline-block;
	width: 60px;
	height: 34px;
	vertical-align: middle;
	float: right;
}

/* Hide default HTML checkbox */
.switch input {
	display: none;
}

/* The slider */
.slider {
	position: absolute;
	cursor: pointer;
	top: 0;
	left: 0;
	right: 0;
	bottom: 0;
	background-color: #ccc;
	-webkit-transition: .4s;
	transition: .4s;
}

.slider:before {
	position: absolute;
	content: "";
	height: 26px;
	width: 26px;
	left: 4px;
	bottom: 4px;
	background-color: white;
	-webkit-transition: .4s;
	transition: .4s;
}

input:checked+.slider {
	background-color: #2196F3;
}

input:focus+.slider {
	box-shadow: 0 0 1px #2196F3;
}

input:checked+.slider:before {
	-webkit-transform: translateX(26px);
	-ms-transform: translateX(26px);
	transform: translateX(26px);
}

/* Rounded sliders */
.slider.round {
	border-radius: 34px;
}

.slider.round:before {
	border-radius: 50%;
}

/* 스위치 */
</style>

</head>
<body id="page-top">

<!-- Page Wrapper -->
<div id="wrapper">
	
	<!-- Sidebar -->
	<%@ include file="/WEB-INF/views/member/include/classSidebar.jsp" %>

	<!-- Content Wrapper -->
	<div id="content-wrapper" class="d-flex flex-column">
	
	<!-- Topbar -->
	<%@ include file="/WEB-INF/views/member/include/classNavbar.jsp" %>
		
	<div class="container-fluid">		
	<div class="row" id="posting">
		<form action="/classHomeworkSubmitEditUpdt" id="editSubmit" name="editSubmit" method="post">
		<input type="hidden" id="cthpSeq" name="cthpSeq" value="<c:out value="${vo.cthpSeq}"/>" >
		<input type="hidden" id="cthsSeq" name="cthsSeq" value="<c:out value="${vo.cthsSeq}"/>" >
			<div class="col-12">
				<div class="card shadow mb-4">
					<!-- Card Body -->
					<div class="card-body">
						<!-- 제목 시작 -->
						<div class="form-title">
							<input type="text" class="form-control" id="cthsTitle" placeholder="제목(옵션)" name="cthsTitle" maxlength="100" value="<c:out value="${itemSubmit.cthsTitle}"/>" >
						</div>
						<hr>
						<!-- 제목 끝  -->
						<!-- 첨부파일 넣기 시작 -->
						<div class="title_hw border">
							<div class="col-md-10 col-lg-11" id="classInfo">
								<div class="btn-group" role="group" aria-label="Basic outlined example">
									<button type="button" class="btn btn-outline-secondary btn-sm">
										<i class="fa-solid fa-image fa-2x"></i>
									</button>
									<button type="button" class="btn btn-outline-secondary btn-sm">
										<i class="fa-solid fa-file-circle-plus fa-2x"></i>
									</button>
									<button type="button" class="btn btn-outline-secondary btn-sm">
										<i class="fa-solid fa-video fa-2x"></i>
									</button>
								</div>
							</div>
						</div>
						<hr>
						<!-- 첨부파일 넣기 끝 -->
						<!-- 내용 넣기 시작 -->
						<div class="title_hw border">
							<textarea class="formBoard" rows="20" cols="100" id="cthsDesc" name="cthsDesc" placeholder="본문을 작성하세요."><c:out value="${itemSubmit.cthsDesc}"/></textarea>
						</div>
						
						<button type="submit" class="basic_button w-25 mt-1" id="submitUpdt" name="submitUpdt">등록</button>
						<!-- 내용 넣기 끝 -->
					</div>
				</div>
			</div>
		</form>
		</div>
		
	</div>
</div>






	<!-- End of Page Wrapper -->
	<!-- Bootstrap core JavaScript-->
	<script src="../../../../resources/common/vendor/jquery/jquery.min.js"></script>
	<script src="../../../../resources/common/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

	<!-- Core plugin JavaScript-->
	<script src="../../../../resources/common/vendor/jquery-easing/jquery.easing.min.js"></script>

	<!-- Custom scripts for all pages-->
	<script src="../../../../resources/common/js/sb-admin-2.min.js"></script>

<script type="text/javascript">

$("#submitUpdt").on("click", function(){
	var answer = confirm("수정하시겠습니까?");
	
	if(answer){
		$("#editSubmit").attr("action","/classHomeworkSubmitEditUpdt");
		$("#editSubmit").submit();
	}else{
		return false;
	}
	
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



<!-- Option 1: Bootstrap Bundle with Popper -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
<script src="/resources/common/bootstrap/bootstrap-5.1.3-dist/js/bootstrap.bundle.min.js"></script>  

</body>
</html>