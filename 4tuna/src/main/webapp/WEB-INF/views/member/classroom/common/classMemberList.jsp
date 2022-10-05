<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="rb" uri="http://www.springframework.org/tags"%>
<!DOCTYPE html>
<html lang="en">

<head>

<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="description" content="">
<meta name="author" content="">
<!-- Bootstrap CSS -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.1.0/css/all.min.css" />

<link rel="shortcut icon" href="https://ifh.cc/g/nj4CTw.png" type="image/x-icon" />
<title id="ctl00_headerTitle">CLASSING</title>
<style type="text/css">
body {
	cursor: default;
}

#posting {
	width: 800px;
	margin-left: auto;
	margin-right: auto;
	margin-top: 50px;
}
</style>
<!-- Custom fonts for this template-->
<link href="/resources/common/vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
<link href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i" rel="stylesheet">

<!-- Custom styles for this template-->
<link href="/resources/common/css/sb-admin-2.min.css" rel="stylesheet">
<link href="/resources/user/css/classCommon.css" rel="stylesheet">
<link href="/resources/common/css/boardCss.css" rel="stylesheet">

</head>
<body id="page-top">

	<!-- Page Wrapper -->
	<div id="wrapper">

		<!-- Sidebar -->
		<%@ include file="/WEB-INF/views/member/include/classSidebar.jsp"%>
		<!-- End of Sidebar -->

		<!-- Content Wrapper -->
		<div id="content-wrapper" class="d-flex flex-column">
			<!-- Main Content -->
			<!-- Topbar -->
			<%@ include file="/WEB-INF/views/member/include/classNavbar.jsp"%>
			<!-- End of Topbar -->

			<!-- Begin Page Content -->
			<div class="container-fluid">
				<div class="row" id="posting">
					<form id="memberList" name="memberList" method="post">
						<input type="hidden" id="ctcmSeq" name="ctcmSeq" value="<c:out value="${vo.ctcmSeq}"/>">
						<input type="hidden" id="ctcsSeq" name="ctcsSeq" value="<c:out value="${ctcsSeq}"/>">
						<!-- Area Chart -->
						<div class="col-12">
							<div class="container_title shadow mb-4">
								<div class="header">클래스 구성원</div>
								<div class="body">총 6명</div>
							</div>
							<div class="card shadow mb-4 ">
								<div class="container_base">
									<div class="body">선생님</div>
								</div>
								<div class="container_base">
									<c:forEach items="${list}" var="item" varStatus="status">
										<c:if test="${item.ctcmTeacherNy eq 1}">
											<div class="homework_listitem mt-3">
												<div class="title_hw">
														<div class="col-md-2 col-lg-2" id="classImg">
															<img class="profile" src="/resources/uploaded/${ctcsSeq }/${item.ctcmSeq}/${item.ctcmProfile}" onerror="this.src='/resources/uploaded/common/profile2.png'" style="border-radius: 18px; width: 40px; height: 40px;" />
														</div>
													<!-- <div class="col-md-2 col-lg-2" id="classImg"><img src="/resources/uploaded/common/profile2.png"  width="40" height="40" style="border-radius: 7px; "></div> -->
													<div class="col-md-10 col-lg-10" id="classInfo">
														<span>
															<b><c:out value="${item.ctcmName}" /></b>
														</span>
														<p>
															<span style="color: #c8c8c8; font-size: 14px;">선셍님</span>
													</div>
												</div>

											</div>
										</c:if>
									</c:forEach>
								</div>
								<div class="container_base">
									<div class="body">학생 목록</div>
								</div>
								<div class="container_base">
									<div class="homework_listitem">
										<c:forEach items="${list}" var="item" varStatus="status">
											<c:if test="${item.ctcmTeacherNy eq 0}">
												<div class="title_hw">

														<div class="col-md-2 col-lg-2" id="classImg">
															<img class="profile" src="/resources/uploaded/${ctcsSeq }/${item.ctcmSeq}/${item.ctcmProfile}" onerror="this.src='/resources/uploaded/common/profile2.png'" style="border-radius: 18px; width: 40px; height: 40px;" />
														</div>
													<div class="col-md-10 col-lg-10" id="classInfo">
														<span>
															<b><c:out value="${item.ctcmName}" /></b>
														</span>
														<p>
															<span style="color: #c8c8c8; font-size: 14px;">학생</span>
													</div>
													<c:if test="${teacherNy eq 1}">
														<div class="dropdown no-arrow">
															<a class="dropdown-toggle" href="#" role="button" id="dropdownMenuLink" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
																<i class="fas fa-ellipsis-v fa-sm fa-fw text-gray-400"></i>
															</a>
															<div class="dropdown-menu dropdown-menu-right shadow animated--fade-in" aria-labelledby="dropdownMenuLink">
																<a class="dropdown-item text-danger" href="javascript:goList(<c:out value="${item.ctcmSeq}"/>)">회원탈퇴</a>
															</div>
														</div>
													</c:if>
												</div>
											</c:if>
										</c:forEach>
									</div>
								</div>
								<!-- Card Body -->
							</div>
						</div>
						<!-- Pie Chart -->
						<!-- /.container-fluid -->
					</form>
				</div>
				<!-- End of Main Content -->
			</div>
			<!-- Footer -->
			<!-- End of Footer -->
		</div>
	</div>
	<!-- Bootstrap core JavaScript-->
	<script src="/resources/common/vendor/jquery/jquery.min.js"></script>
	<script src="/resources/common/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

	<!-- Core plugin JavaScript-->
	<script src="/resources/common/vendor/jquery-easing/jquery.easing.min.js"></script>

	<!-- Custom scripts for all pages-->
	<script src="/resources/common/js/sb-admin-2.min.js"></script>

	<script type="text/javascript">
		goList = function(seq) {
			var answer = confirm("삭제하시겠습니까?");

			if (answer) {
				$("#ctcmSeq").val(seq);
				$("#memberList").attr("action", "/classMemberUele");
				$("#memberList").submit();
			} else {
				return false;
			}

		};

		$("#btnLogout").on(
				"click",
				function() {

					$.ajax({
						async : true,
						cache : false,
						type : "post",
						url : "/member/logoutProc"
						/* ,data : { "mvmmId" : $("#mvmmId").val(), "mvmmPassword" : $("#mvmmPassword").val()} */
						,
						success : function(response) {
							if (response.rt == "success") {
								location.href = "/";
							} else {
								// by pass
							}
						},
						error : function(jqXHR, textStatus, errorThrown) {
							alert("ajaxUpdate " + jqXHR.textStatus + " : "
									+ jqXHR.errorThrown);
						}
					});
				});
	</script>



	<!-- Option 1: Bootstrap Bundle with Popper -->
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
	<script src="/resources/common/bootstrap/bootstrap-5.1.3-dist/js/bootstrap.bundle.min.js"></script>


</body>
<!-- <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.10.2/dist/umd/popper.min.js" integrity="sha384-7+zCNj/IqJ95wo16oMtfsKbZ9ccEh31eOz1HGyDuCQ6wgnyJNSYdrPa03rtR1zdB" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.min.js" integrity="sha384-QJHtvGhmr9XOIpI6YVutG+2QOK9T+ZnN4kzFN1RtK3zEFEIsxhlmWl5/YESvpZ13" crossorigin="anonymous"></script>

 -->

</html>