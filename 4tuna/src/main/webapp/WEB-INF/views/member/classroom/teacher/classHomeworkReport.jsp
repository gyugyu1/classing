

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
.container_wrapper>div:first-child {
	padding: 0;
}

.homework_table thead>tr:not(first-child)>td:first-child {
	font-weight: 600;
	color: black;
}

.homework_table tbody>tr>td:first-child {
	color: black;
}

#posting {
	width: 800px;
	margin-left: auto;
	margin-right: auto;
	margin-top: 50px;
}
</style>

</head>
<body id="page-top">

	<!-- Page Wrapper -->
	<div id="wrapper">

		<!-- Sidebar -->
		<%@ include file="/WEB-INF/views/member/include/classSidebar.jsp"%>

		<!-- Content Wrapper -->
		<div id="content-wrapper" class="d-flex flex-column">

			<!-- Topbar -->
			<%@ include file="/WEB-INF/views/member/include/classNavbar.jsp"%>

			<div class="container-fluid">
				<div class="row" id="posting">
					<div class="col-12">
						<div class="container_title shadow mb-4">
							<div class="header">과제 리포트</div>
							<div class="body">클래스에 배부된 모든 과제 현황을 확인할 수 있어요.</div>
						</div>

						<div class="container_wrapper shadow p-0">
							<div class="container_base">
								<div class="homework_check">
									<div class="homework_table table-responsive">
										<table class="table m-0" id="dataTable" width="100%" cellspacing="0">
											<thead>
												<tr>

													<td>전체<c:out value="${fn:length(submitMap) }" />명</td>
													<c:forEach items="${homeworkList }" var="homeworkList" varStatus=" st">
														<td style="color:black"><b><c:out value="${homeworkList.cthpTitle }" /> <input type="hidden" value="${homeworkList.cthpSeq}" /></b></td>
													</c:forEach>
												</tr>
												<tr>
													<td>평균 점수</td>
													<c:forEach items="${scoreAvg}" var="score" varStatus=" st">
														<c:choose>
															<c:when test="${empty score.scoreAvg}">
																<td><b><c:out value="-" /></b></td>
															</c:when>
															<c:otherwise>
																<td><b><c:out value="${score.scoreAvg }" /></b></td>
															</c:otherwise>
														</c:choose>
													</c:forEach>
												</tr>
												<tr>
													<td>제출률</td>
													<c:forEach items="${homeworkCountList }" var = "li" varStatus="st">
														<td><b><fmt:formatNumber value="${li }" type="percent"/></b></td>
														
													</c:forEach>
												</tr>



											</thead>

											<tbody>
												<c:forEach items="${submitMap }" var="sm" varStatus=" st">

													<tr>
														<td><c:out value="${sm.key}" /></td>
														<c:set value="${sm.value }" var="submitList" />
														<c:forEach items="${submitList}" var="sl2" varStatus="st2">
															<td><c:choose>
																	<c:when test="${sl2.value eq -1 }">
																		<span class='badge badge_hw bg-danger' style="color:white"><c:out value="미제출" /></span>
																	</c:when>
																	<c:when test="${empty sl2.value  }">
																		<span class='badge badge_hw'><c:out value="채점중" /></span>
																	</c:when>
																	<c:otherwise>
																		<c:out value="${sl2.value }" />
																	</c:otherwise>
																</c:choose></td>
														</c:forEach>
													</tr>
												</c:forEach>
											</tbody>
										</table>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
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
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
	<script src="/resources/common/bootstrap/bootstrap-5.1.3-dist/js/bootstrap.bundle.min.js"></script>


</body>
</html>