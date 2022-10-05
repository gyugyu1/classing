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


<title></title>

<style type="text/css">

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

.container_base .header>*:first-child {
	font-size: 1.2rem;
	font-weight: 600;
}

.container_base .header>.progress {
	height: 1.7rem;
}

.container_base .body>div {
	display: flex;
	justify-content: between;
	align-items: stretch;
	height: 1.25rem;
	gap: 1rem;
	margin-bottom: 0.5rem;
}

.container_base .body .badge {
	width: 10%;
	color: white;
}

.container_base .body * {
	color: #5a5a5a;
	font-weight: 600;
}

.video .body>div>*:first-child {
	width: 10%;
}

.video .body .progress {
	height: 100%;
	width: 70%;
}

.homework>.body>div>*:nth-child(2) {
	width: 70%;
	text-align: right;
}
</style>
</head>
<body id="page-top">

	<!-- Page Wrapper -->
	<div id="wrapper">

	<!-- Sidebar -->
	<%@ include file="/WEB-INF/views/member/include/classSidebar_2.jsp" %>
	
	<!-- Content Wrapper -->
	<div id="content-wrapper" class="d-flex flex-column">
	
	<!-- Topbar -->
	<%@ include file="/WEB-INF/views/member/include/classNavbar.jsp" %>

		<div class="container-fluid">
		<div class="row" id="posting">
			<div class="col-12">
				<div class="container_title shadow mb-4">
					<!-- 학습 진도 헤더 -->
					<div class="header">학습진도</div>
					<div class="body">내 학습량을 확인하세요.</div>
				</div>
				<!-- 동영상 강의 컨테이너 -->
				<div class="container_base_wrapper shadow">
					<div class="container_base">
						<div class="video">
							<!-- 동영상 강의 헤더  -->
							<div class="header">
								<span>동영상 강의 전체</span>
								<div class="progress">
									<div class="progress-bar" style="width: 50%" role="progressbar">50%</div>
								</div>
								<hr>
							</div>
							<!-- 동영상 강의 본문 -->
							<div class="body">
								<div>
									<span>강의 1</span>

									<div class="progress">
										<div class="progress-bar bg-success" style="width: 100%" role="progressbar" aria-valuemin="0" aria-valuemax="100">100%</div>
									</div>

									<span class="badge bg-primary">시청완료</span>
								</div>

								<div>
									<!--  개별 강의 -->
									<span>강의 2</span>

									<div class="progress">
										<div class="progress-bar bg-warning" style="width: 40%" role="progressbar" aria-valuemin="0" aria-valuemax="100">40%</div>
									</div>

									<span class="badge bg-warning">미완료</span>
								</div>
								<div>
									<!--  개별 강의 -->
									<div>강의 3</div>

									<div class="progress">
										<div class="progress-bar bg-danger" style="width: 0%" role="progressbar" aria-valuemin="0" aria-valuemax="100">0%</div>
									</div>

									<span class="badge bg-danger">미시청</span>
								</div>
							</div>
						</div>
					</div>

					<!-- 과제 컨테이너 -->
					<div class="container_base">
						<div class="homework">
							<div class="header">
								<span>과제</span>

								<div class="progress">
									<div class="progress-bar" style="width: 33%" role="progressbar">33%</div>
								</div>

								<hr>
							</div>

							<!--과제 본문  -->
							<div class="body">
								<div>
									<span>과제 1</span>
									<span>50/100</span>
									<span class="badge bg-primary">제출완료</span>
								</div>
								<div>
									<span>과제 2</span>
									<span></span>
									<span class="badge bg-danger">미제출</span>
								</div>

								<div>
									<!-- 개별 과제  -->
									<span>과제 3</span>
									<span></span>
									<span class="badge bg-warning">미채점</span>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	</div>
</div>	
	<script src="/resources/common/vendor/jquery/jquery.min.js"></script>
	<script src="/resources/common/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

	<script src="/resources/common/vendor/jquery-easing/jquery.easing.min.js"></script>

	<script src="/resources/common/js/sb-admin-2.min.js"></script>
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.min.js" integrity="sha384-QJHtvGhmr9XOIpI6YVutG+2QOK9T+ZnN4kzFN1RtK3zEFEIsxhlmWl5/YESvpZ13" crossorigin="anonymous"></script>


</body>
</html>