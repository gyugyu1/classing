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

#picture_change {
	font-size:12px; 
	font-weight:bold; 
	border:none; 
	margin-bottom:10px;
	margin-top:0px;
	margin-left:10px;
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
		<div class="col-12">
		    <div class="container_title shadow mb-4">
		        <div class="header" >예약/임시저장한 글</div>
		        <div class="body">예약 및 임시저장 게시물이 있습니다.</div>
		    </div>
		    <div class="card shadow mb-4 ">
           <div class="container_base">
				<div class="body">예약한 글</div>
			</div>
			<c:choose>
				<c:when test="${fn:length(list) eq 0}">
					<div class="container_base">
						<div class="homework list mt-5 mb-5" >예약한 글이 없습니다!</div>
					</div>
				</c:when>
				<c:otherwise>
					<c:forEach items="${list2}" var="item" varStatus="status">
						<c:if test="${item.ctptReservation ne null && item.ctptWriter eq ctcmSeq}">
						    <div class="container_base" onclick="location.href='/member/class/common/postedit';">
								예약 날짜/시간 : <fmt:formatDate value="${item.ctptReservation}" pattern="yyyy-MM-dd HH:mm:ss"/>							
									<c:if test="${item.ctboSeq eq 5}"><span class='badge badge_notice'>공지</span></c:if>
									<c:if test="${item.ctboSeq eq 1}"><span class='badge badge_graded'>자유공간</span></c:if>
									<c:if test="${item.ctboSeq eq 2}"><span class='badge badge_alreadyend'>학습자료</span></c:if>
									<c:if test="${item.ctboSeq eq 3}"><span class='badge badge_after3'>활동사진</span></c:if>
								<div class="homework_listitem mt-3">
								    <div class="title_hw" >
								        <div class="col-md-10 col-lg-10" id="classInfo">
								        	<b><c:out value="${item.ctptTitle}"/></b><br>
								        	<span style="font-size: 14px;"><c:out value="${item.ctptContent}"/></span>
								        	
								        	<p><p><span style="color: #c8c8c8; font-size: 14px;">저장한 시간 : <fmt:formatDate value="${item.regDateTime}" pattern="yyyy-MM-dd HH:mm:ss"/></span>
							        	</div>
							            <div class="dropdown no-arrow">
							                <a class="dropdown-toggle" href="#" role="button" id="dropdownMenuLink" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
							                    <i class="fas fa-ellipsis-v fa-sm fa-fw text-gray-400"></i>
							                </a>
							                <div class="dropdown-menu dropdown-menu-right shadow animated--fade-in"
							                    aria-labelledby="dropdownMenuLink">
							                    <a class="dropdown-item text-danger" href="#">삭제</a>
							                </div>
						               </div>
							        </div>
							    </div>
							</div>	
						</c:if>	
					</c:forEach>
				</c:otherwise>
			</c:choose>
            <div class="container_base">
				<div class="body">임시 저장한 글</div>
			</div>
			<c:choose>
				<c:when test="${fn:length(list) eq 0}">
					<div class="container_base">
						<div class="homework list mt-5 mb-5" >임시 저장 글이 없습니다!</div>
					</div>
				</c:when>
				<c:otherwise>
					<c:forEach items="${list}" var="item" varStatus="status">
			   			<c:if test="${item.ctptReservation eq null && item.ctptWriter eq ctcmSeq}">
						    <div class="container_base" onclick="location.href='/member/class/common/postedit';">
							    임시 저장 중
				   					<c:if test="${item.ctboSeq eq 5}"><span class='badge badge_notice'>공지</span></c:if>
									<c:if test="${item.ctboSeq eq 1}"><span class='badge badge_graded'>자유공간</span></c:if>
									<c:if test="${item.ctboSeq eq 2}"><span class='badge badge_alreadyend'>학습자료</span></c:if>
									<c:if test="${item.ctboSeq eq 3}"><span class='badge badge_after3'>활동사진</span></c:if>
												<div class="homework_listitem mt-3">
							    <div class="title_hw" >
							        <div class="col-md-10 col-lg-10" id="classInfo">
							        	<b><c:out value="${item.ctptTitle}"/></b><br>
							        	<span style="font-size: 14px;"><c:out value="${item.ctptContent}"/></span>
							        	<p><p><span style="color: #c8c8c8; font-size: 14px;">저장한 시간 : <fmt:formatDate value="${item.regDateTime}" pattern="yyyy-MM-dd HH:mm:ss"/></span>
							        	</div>
							            <div class="dropdown no-arrow">
							                <a class="dropdown-toggle" href="#" role="button" id="dropdownMenuLink" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
							                </a>
							                <div class="dropdown-menu dropdown-menu-right shadow animated--fade-in"
							                    aria-labelledby="dropdownMenuLink">
							                    <a class="dropdown-item text-danger" href="#">삭제</a>
							                </div>
						               </div>
							        </div>
							    </div>
							</div>	
						</c:if>	
					</c:forEach>
			</c:otherwise>
			</c:choose>
		    <!-- Card Body -->
		    </div>
		</div>
		</div>
	<!-- End of Main Content -->
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