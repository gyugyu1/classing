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

<!-- Custom fonts for this template-->
<link href="/resources/common/vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
<link href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i" rel="stylesheet">

<!-- Custom styles for this template-->
<link href="/resources/common/css/sb-admin-2.css" rel="stylesheet">
<link href="/resources/user/css/classCommon.css" rel="stylesheet">
<link href="/resources/common/css/boardCss.css" rel="stylesheet">
<link href="/resources/common/css/classAttendance.css" rel="stylesheet">

<link rel="shortcut icon" href="https://ifh.cc/g/nj4CTw.png" type="image/x-icon" />
<title id="ctl00_headerTitle">CLASSING</title>
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
							<div class="header">출석부</div>
							<div class="body">학생의 출석 현황을 확인할 수 있어요</div>

						</div>
						<div class="container_base_wrapper shadow">
							<div class="container_base">
								<div class="today_attendance">
									<div class="header">
										<span>오늘의 출석 현황</span>
										<span>
											<c:out value="${now }" />
											기준
										</span>
									</div>
									<div class="body">
										<div class="attendance_bar">
											<c:set var="rate" value="${attendRate }" />
											<div>
												<c:out value="${rate }" />
												%
											</div>
											<div class="progress">
												<div class="progress-bar base_bgcolor" style="width:${rate}%" role="progressbar"></div>
											</div>
										</div>
										<div class="attendance_text">
											<div class="base_color">출석완료</div>
											<div>
												<c:out value="${totalAtt }" />
											</div>
										</div>
									</div>
								</div>
							</div>
						</div>

						<!-- 	
						<div class="container_base_wrapper shadow">
							<div class="container_base d-flex justify-content-center">
								<div class="attendance_setdate">
									출석 확인 날짜 설정 
									<button class="btn btn-primary base_bgcolor"><</button>
									<input type="text" class="daterange " name="daterange" value="01/01/2018 - 01/15/2018" />
									<button class="btn btn-primary base_bgcolor">></button>
								</div>
							</div>
						</div>
								 -->
						<div class="container_base_wrapper shadow">
							<div class="container_base p-0">
								<div class="attendance_table table-responsive">
									<table class="table attendance" id="dataTable" width="100%" cellspacing="0">
										<thead>
											<tr>
												<th></th>
												<c:forEach var="week" items="${week}" varStatus="var">
													<th>
														<div>
															<c:out value="${week }" />
														</div>
														<div>
															<c:out value="${day[var.index]}" />
														</div>
													</th>
												</c:forEach>
											</tr>
										</thead>
										<tbody>
											<c:forEach var="item" items="${log}" varStatus="st">
												<c:set var="name" value="${item.key }" />
												<c:set var="value" value="${item.value }" />

												<tr>
													<td>
														<div>
															<div class="profile_box">
																<c:forEach items="${memberList}" var="itemMember" varStatus="status">
																	<c:if test="${name eq itemMember.ctcmName}">
																		<span>
																			<img class="profile" src="/resources/uploaded/${ctcsSeq }/${itemMember.ctcmSeq}/${itemMember.ctcmProfile}" onerror="this.src='/resources/uploaded/common/profile2.png'" />
																		</span>
																	</c:if>
																</c:forEach>
															</div>
															<span>
																<c:out value="${name}" />
															</span>
														</div>
													</td>

													<c:forEach var="value" items="${value}" varStatus="st">

														<c:choose>
															<c:when test="${empty value}">
																<td>
																	<div>
																		<i class="fa-regular fa-circle-xmark fa-2x" style="color: red"></i>
																	</div>
																</td>
															</c:when>
															<c:otherwise>
																<td>
																	<div>
																		<i class="fa-regular fa-circle-check fa-2x" style="color: green"></i>
																		<span class="badge bg-secondary">
																			<fmt:parseDate value="${value }" pattern="yyyy-MM-dd'T'HH:mm" var="date" type="both" />
																			<fmt:formatDate value="${date}" pattern="HH:mm" />
																		</span>
																	</div>
																</td>
															</c:otherwise>
														</c:choose>
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



	<input type="hidden" id="aaa" value="${now}" />

	<!-- End of Page Wrapper -->
	<!-- Bootstrap core JavaScript-->
	<script src="../../../../resources/common/vendor/jquery/jquery.min.js"></script>
	<script src="../../../../resources/common/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

	<!-- Core plugin JavaScript-->
	<script src="../../../../resources/common/vendor/jquery-easing/jquery.easing.min.js"></script>

	<!-- Custom scripts for all pages-->
	<script src="../../../../resources/common/js/sb-admin-2.min.js"></script>
	<script type="text/javascript">
		function aaa() {

		}

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

</body>
</html>
