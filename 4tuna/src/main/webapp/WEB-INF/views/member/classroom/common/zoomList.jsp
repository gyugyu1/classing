<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="rb" uri="http://www.springframework.org/tags"%>

<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="description" content="">
<meta name="author" content="">
<!-- Bootstrap CSS -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.1.1/css/all.min.css" />

<!-- Custom fonts for this template-->
<link href="../../../../../resources/common/vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
<link href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i" rel="stylesheet">

<!-- Custom styles for this template-->
<link href="../../../../../resources/common/css/sb-admin-2.css" rel="stylesheet">
<link href="../../../../../resources/user/css/classCommon.css" rel="stylesheet">
<link href="../../../../../resources/common/css/boardCss.css" rel="stylesheet">

<link rel="shortcut icon" href="https://ifh.cc/g/nj4CTw.png" type="image/x-icon" />
<title id="ctl00_headerTitle">CLASSING</title>
<style type="text/css">
#picture_change {
	font-size: 12px;
	font-weight: bold;
	border: none;
	margin-bottom: 10px;
	margin-top: 0px;
	margin-left: 10px;
}

.container_base .header {
	display:flex;
	align-items:center;
	gap:8px;
}

.container_base .header > span:nth-child(3){
	font-weight:normal;
}
.btn-zoom{
	background-color: #00C896;
	border: transparent;
	border-radius: 13px;
	padding:0.5rem 1rem 0.5rem 1rem;
	color: white;
	font-weight: bold;
	float: right
}
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

			<!-- Begin Page Content -->
	<div class="container-fluid">
		<div class="row" id="posting">
			<!-- Area Chart -->
			<div class="col-12">
				<div class="container_title shadow mb-4">
					<div class="header">실시간 수업</div>
					<div class="body">클래스의 실시간 수업목록을 확인할 수 있어요.</div>
					<div class="footer">
						<c:if test="${teacherNy eq 1}"><button type="button" class="basic_button w-25" data-bs-toggle="modal" data-bs-target="#zoomModal"><i class="fa-solid fa-video"></i> <b>실시간 수업 생성</b></button></c:if>
					</div>
					<!-- 모달 -->
					<div class="modal fade" id="zoomModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
						<form action="/zoomCreate" id="createZoom" name="createZoom" method="post">
						<input type="hidden" id="agenda" name="agenda" value="<c:out value="${ctcsSeq}"/>">
							<div class="modal-dialog">
								<div class="modal-content">
									<div class="modal-header">
										<h5 class="modal-title" id="exampleModalLabel">줌 수업 만들기</h5>
										<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
									</div>
									<div class="modal-body">
										<br>
										<div class="input-group mt-1">
											<label class="mt-1">제목</label>&nbsp;
											<input class="form-control form-control-sm" type="text" id="topic" name="topic" placeholder="제목 입력"> <br>
										</div>
<!-- 										<div class="input-group mt-1">
											<label class="mt-1">시작시간</label>&nbsp;
											<input class="form-control form-control-sm" type="text" id="start_time" name="start_time" placeholder="2022-06-07 12:00:00 형태로 입력"> <br>
										</div> -->
									</div>
									<div class="modal-footer">
										<button type="button" class="btn btn-secondary" data-bs-dismiss="modal">닫기</button>
										<button type="submit" class="btn btn-primary" id="btn-submit">확인</button>
									</div>
								</div>
							</div>
						</form>	
					</div>
				</div>

				<div class="card shadow mb-4 ">
				<div class="container_base">
					<div class="body">실시간 수업 목록</div>
				</div>	
				<form action="/zoomDelete" id="zoomList" name="zoomList" method="post">
				<input type="hidden" id="id" name="id" value="<c:out value="${dto.id}" />">
					<c:choose>
						<c:when test="${fn:length(list) eq 0}">
							<div class="container_base">
								<div class="homework list mt-5 mb-5" >실시간 수업이 없습니다!</div>
							</div>
						</c:when>
						<c:otherwise>
							<c:forEach items="${list}" var="item" varStatus="status">
								<c:if test="${item.agenda eq ctcsSeq}">
								<div class="container_base">
									<div class="homework list">
										<div class="header" style="cursor: default;">
											<span class='badge badge_hw' style="float: left;">실시간 수업</span>
											<c:out value="${fn:substring(item.start_time, 0, 10)}"/>&nbsp;<c:out value="${fn:substring(item.start_time, 11, 19)}"/>
										</div>
										<div class="body mt-2" style="cursor: pointer;">
											<p style="font-size: 22px; color: black; font-weight: bold;"><c:out value="${item.topic}"/>
											<span onclick="javascript:goDelete(<c:out value="${item.id}"/>);" style="float: right;"><i class="fas fa-trash" style="cursor: pointer;"></i></span>	
											</p>
											<br>
											<p style="font-size: 15px; color: black;">시작 시간 : <c:out value="${fn:substring(item.start_time, 0, 10)}"/>&nbsp;<c:out value="${fn:substring(item.start_time, 11, 19)}"/></p>
											<p style="font-size: 15px; color: black; display: inline;">진행 시간 : <c:out value="${item.duration}"/> 분</p>
											<button type="button" class="btn btn-zoom" onclick="location.href='${item.join_url}'">수업 참여 하기</button>
										</div>
										<div class="footer mt-4 mb-2">
										</div>
									</div>
								</div>
								</c:if>
							</c:forEach>	
						</c:otherwise>
					</c:choose>	
				</form>	 
				</div>
			</div>
		</div>
	</div>
	</div>
</div>


	<!-- End of Page Wrapper -->
	<!-- Bootstrap core JavaScript-->
	<script src="../../../../../resources/common/vendor/jquery/jquery.min.js"></script>
	<script src="../../../../../resources/common/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

	<!-- Core plugin JavaScript-->
	<script src="../../../../../resources/common/vendor/jquery-easing/jquery.easing.min.js"></script>

	<!-- Custom scripts for all pages-->
	<script src="../../../../../resources/common/js/sb-admin-2.min.js"></script>
<script type="text/javascript">

goDelete = function(seq){
	$("#id").val(seq);
	$("#zoomList").attr("action","/zoomDelete");
	$("#zoomList").submit();
}

/* const date = new Date();
console.log(date) // Thu Dec 23 2021 00:06:11 GMT+0900 (한국 표준시)
console.log(date.toISOString()) // 2021-12-22T15:07:22.573Z
var date1 = date.toISOString().replace('T', ' ').substring(0, 19)); */


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
<script src="/resources/common/bootstrap/bootstrap-5.1.3-dist/js/bootstrap.bundle.min.js"></script>  

</body>

</html>