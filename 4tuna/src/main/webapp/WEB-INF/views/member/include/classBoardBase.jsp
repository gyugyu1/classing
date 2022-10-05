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
<!-- Bootstrap CSS -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.1.0/css/all.min.css"/>

<title></title>
<!-- Custom fonts for this template-->
<link href="/resources/common/vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
<link href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i" rel="stylesheet">

<!-- Custom styles for this template-->
<link href="/resources/common/css/sb-admin-2.css" rel="stylesheet">
<link href="/resources/user/css/classCommon.css" rel="stylesheet">

<style>
	.header_board{
		display:flex;
		align-items:center;
		justify-content:space-between;
		color:#00C896;
		padding: 1.25rem 1.25rem;
		margin-bottom: 0;
		background-color: #f8f9fc;
		border-bottom: 1px solid #e3e6f0;
		
	}
	
	.toggled_btn{
		background-color:transparent;
		border : transparent;
		color:#999999;
	}
	
	.basic_button{
		background-color : #00C896;
		border : transparent;
		border-radius: 10px;
		padding:8px;
		color:white;
		font-weight:300;
	}
	.reply {
		display:flex;
	}
	
	.reply:first-child {
		width:33%;
	}
</style>
</head>
<body id="page-top">

    <!-- Page Wrapper -->
    <div id="wrapper">

        <!-- Sidebar -->
        <ul class="navbar-nav sidebar sidebar-dark accordion" id="accordionSidebar">

            <!-- Sidebar - Brand -->
		    <img src="/resources/common/image/header_logo.png"  width="180px;" style="margin-left: 10px;">

            <!-- Divider -->
            <hr class="sidebar-divider my-0">

            <!-- Nav Item - Dashboard -->
            <li class="nav-item active">
            	<div class="col-md-3 mt-4" id="classImg"><img src="/resources/user/image/a3.jpg"  width="50" height="50" style="border-radius: 7px; "></div>
				<div class="col-md-9 mt-4" id="classInfo"><span><b>4조</b></span><p><span>2022</span></div>
				<button type="button" class="btn btn-lg mt-1 w-100 p-2" id="btn-add"><i class="fa-solid fa-user-plus"></i>  구성원 초대하기</button>
            </li>

            <!-- Divider -->
            <hr class="sidebar-divider">

            <!-- Nav Item - Pages Collapse Menu -->
            <div class="sidebar-heading" style="color: #828282;">전체 메뉴</div>
            <li class="nav-item">
                <a class="nav-link" href="#"><i class="fa-solid fa-bullhorn" style="color: #828282;"></i> <span>모든 공지</span></a>
                <a class="nav-link" href="#"><i class="fa-solid fa-pencil" style="color: #828282;"></i> <span>모든 과제</span></a>
                <a class="nav-link" href="#"><i class="fa-solid fa-file-circle-check" style="color: #828282;"></i> <span>과제 리포트</span></a>
                <a class="nav-link" href="#"><i class="fa-solid fa-school-circle-check" style="color: #828282;""></i> <span>출석부</span></a>
                <a class="nav-link" href="#"><i class="fa-solid fa-users" style="color: #828282;"></i> <span>구성원</span></a>
                <a class="nav-link" href="#"><i class="fa-solid fa-gear" style="color: #828282;"></i> <span>클래스 설정</span></a>
            </li>

            <!-- Divider --> 
            <hr class="sidebar-divider">
            <!-- Heading -->
            <div class="sidebar-heading" style="color: #828282;">나만 참여한 공간</div>
            <li class="nav-item">
                <a class="nav-link" href="#"><i class="fa-solid fa-file-pen" style="color: #828282;"></i> <span>예약 / 임시저장한 글</span></a>
            </li>

            <!-- Divider -->
            <hr class="sidebar-divider">

            <!-- Heading -->
            <div class="sidebar-heading" style="color: #828282;">내가 참여한 공간</div>

            <!-- Nav Item - Pages Collapse Menu -->
            <li class="nav-item">
                <a class="nav-link collapsed" href="#" data-toggle="collapse" data-target="#collapsePages"
                    aria-expanded="true" aria-controls="collapsePages">
                    <i class="fas fa-fw fa-folder" style="color: #828282;"></i>
                    <span>모두를 위한 공간</span>
                </a>
                <div id="collapsePages" class="collapse" aria-labelledby="headingPages" data-parent="#accordionSidebar">
                    <div class="bg-white py-2 collapse-inner rounded">
                        <a class="collapse-item" href="login.html">자유 공간</a>
                        <a class="collapse-item" href="register.html">학습 자료</a>
                        <a class="collapse-item" href="forgot-password.html">활동 사진</a>
                    </div>
                </div>
            </li>


            <!-- Divider -->
            <hr class="sidebar-divider d-none d-md-block">
        </ul>
        <!-- End of Sidebar -->

        <!-- Content Wrapper -->
        <div id="content-wrapper" class="d-flex flex-column">

            <!-- Main Content -->
            <div id="content">

                <!-- Topbar -->
                <nav class="navbar navbar-expand navbar-light bg-white topbar mb-4 static-top shadow">

                    <!-- Sidebar Toggle (Topbar) -->
                    <button id="sidebarToggleTop" class="btn btn-link d-md-none rounded-circle mr-3">
                        <i class="fa fa-bars"></i>
                    </button>

             
                    <!-- Topbar Navbar -->
                    <ul class="navbar-nav ml-auto">

                        <!-- Nav Item - Search Dropdown (Visible Only XS) -->
                        <li class="nav-item dropdown no-arrow d-sm-none">
                            <a class="nav-link dropdown-toggle" href="#" id="searchDropdown" role="button"
                                data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                <i class="fas fa-search fa-fw"></i>
                            </a>
                            <!-- Dropdown - Messages -->
                            <div class="dropdown-menu dropdown-menu-right p-3 shadow animated--grow-in"
                                aria-labelledby="searchDropdown">
                                <form class="form-inline mr-auto w-100 navbar-search">
                                    <div class="input-group">
                                        <input type="text" class="form-control bg-light border-0 small"
                                            placeholder="Search for..." aria-label="Search"
                                            aria-describedby="basic-addon2">
                                        <div class="input-group-append">
                                            <button class="btn btn-primary" type="button">
                                                <i class="fas fa-search fa-sm"></i>
                                            </button>
                                        </div>
                                    </div>
                                </form>
                            </div>
                        </li>

                        <!-- Nav Item - Alerts -->
                        <li class="nav-item dropdown no-arrow mx-1">
                            <a class="nav-link dropdown-toggle" href="#" id="alertsDropdown" role="button"
                                data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                <i class="fas fa-bell fa-fw"></i>
                                <!-- Counter - Alerts -->
                                <!-- <span class="badge badge-danger badge-counter">3+</span> -->
                            </a>
                        </li>

                        <!-- Nav Item - Messages -->
                        <li class="nav-item dropdown no-arrow mx-1">
                            <a class="nav-link dropdown-toggle" href="#" id="messagesDropdown" role="button"
                                data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                <i class="fa-solid fa-comment"></i>
                                <!-- Counter - Messages -->
                                <!-- <span class="badge badge-danger badge-counter">7</span> -->
                            </a>
                        </li>

                        <div class="topbar-divider d-none d-sm-block"></div>

                        <!-- Nav Item - User Information -->
                        <li class="nav-item dropdown no-arrow">
                            <a class="nav-link dropdown-toggle" href="#" id="userDropdown" role="button"
                                data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                <span class="mr-2 d-none d-lg-inline text-gray-600 small"><b>윤수빈</b></span>
                                <span class="mr-2 d-none d-lg-inline text-gray-600 small">학생</span>
                                <img class="img-profile rounded-circle" src="/resources/common/image/profile2.png">
                            </a>
                        </li>

                    </ul>

                </nav>
                <!-- End of Topbar -->

                <!-- Begin Page Content -->
                <div class="container-fluid">

                    <!-- Page Heading -->
                    <div class="d-sm-flex align-items-center justify-content-between mb-4">
                        <h1 class="h3 mb-0 text-gray-800">게시판 이름</h1>
                    </div>

                    <!-- Content Row -->
                    <div class="row">


                    <!-- Content Row -->

                    <div class="row">

                        <!-- Area Chart -->
                        <div class="col-xl-8 col-lg-7">
                            <div class="card shadow mb-4">
                                <!-- Card Header - Dropdown -->
                                <div class="header_board">
									<div>
	                                	<button type="button" class="toggled_btn">게시글</button>
	                                	<button type="button" class="toggled_btn">사진/동영상</button>
									</div>	
                                    <div class="dropdown no-arrow">
                                        <a class="dropdown-toggle" href="#" role="button" id="dropdownMenuLink" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                            <i class="fas fa-ellipsis-v fa-sm fa-fw text-gray-400"></i>
                                        </a>
                                        <div class="dropdown-menu dropdown-menu-right shadow animated--fade-in"
                                            aria-labelledby="dropdownMenuLink">
                                            <div class="dropdown-header">Dropdown Header:</div>
                                            <a class="dropdown-item" href="#">Action</a>
                                            <a class="dropdown-item" href="#">Another action</a>
                                            <div class="dropdown-divider"></div>
                                            <a class="dropdown-item" href="#">Something else here</a>
                                        </div>
                                    </div>
                                </div>
                                <!-- Card Body -->
                                <div class="card-body">
									<div class="container_board">
										<div class="header_article" > <!-- 게시글 제목, 작성자  -->
											<div>
												<h3>여기는 게시글 제목이 들어가요.</h3>
											</div>
										
											<div class="d-flex justify-content-between bg-light border rounded p-2"> <!--  작성자 컨테이너 -->
												<div class="d-flex gap-3">
													<div><img src="../profile.jpg"></div>
													<div>
														<div>
															<b>박규원</b>
															<div>4월 22월 오전 11:16 5명 읽음</div>
														</div>
													</div>
												</div>
												<div>
													<i class="fa-solid fa-ellipsis-vertical"></i>
												</div>	
											</div>
										</div>
										
										<hr>
										
										<div class="p-3">
											<div><!-- 게시글 내용 오는 자리  -->
											글 내용입니다
											</div>
										</div>
										
										<hr>
										
										<div class="p-3">
											<div>댓글 1개</div>
										
											<div class="d-flex"> 
												<div class="d-flex gap-3">
													<div><img src="../profile.jpg" style="width:50px; height:50px"></div>
													<div>
														<div>
															<b>박규원</b>
															<div>4월 22월 오전 11:16 </div>
														</div>
														<div>
															여기는 댓글이 보이는 창입니다.
														</div>
														<a href="#">답글 쓰기</a>
													</div>
												</div>
												<div class="ms-auto">
													<i class="fa-solid fa-ellipsis-vertical"></i>
												</div>
											</div>
										</div>
										
										<hr>
										
										<div class="reply"> <!-- 댓글 입력 창  -->
											<div><img src="#"></div>
											<div class="w-100 p-2">
												<div style="position : relative;">
													<textarea class="form-control w-100" style="height:120px;" placeholder="댓글을 달아주세요."></textarea>
													<button class="basic_button" style="position:absolute; right : 3%; top : 60%;">등록</button>
													<div class="border rounded bg-light p-0 d-flex gap-3" style="position:absolute; left : 3%; top : 60%;">
														<button class="btn"><i class="fa-solid fa-file-arrow-up"></i></button>
														<button class="btn"><i class="fa-solid fa-image" ></i></button>
													</div>
												</div>
											</div>
										</div>
									</div>
                                </div>
                            </div>
                        </div>

                        <!-- Pie Chart -->
                        <div class="col-xl-4 col-lg-5">
                            <div class="card shadow mb-4">
                                <!-- Card Header - Dropdown -->
                                <div
                                    class="card-header py-3 d-flex flex-row align-items-center justify-content-between">
                                    <h6 class="m-0 font-weight-bold text-primary">Revenue Sources</h6>
                                    <div class="dropdown no-arrow">
                                        <a class="dropdown-toggle" href="#" role="button" id="dropdownMenuLink"
                                            data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                            <i class="fas fa-ellipsis-v fa-sm fa-fw text-gray-400"></i>
                                        </a>
                                        <div class="dropdown-menu dropdown-menu-right shadow animated--fade-in"
                                            aria-labelledby="dropdownMenuLink">
                                            <div class="dropdown-header">Dropdown Header:</div>
                                            <a class="dropdown-item" href="#">Action</a>
                                            <a class="dropdown-item" href="#">Another action</a>
                                            <div class="dropdown-divider"></div>
                                            <a class="dropdown-item" href="#">Something else here</a>
                                        </div>
                                    </div>
                                </div>
                                <!-- Card Body -->
                                <div class="card-body">
                                    <div class="chart-pie pt-4 pb-2">
                                        <canvas id="myPieChart"></canvas>
                                    </div>
                                    <div class="mt-4 text-center small">
                                        <span class="mr-2">
                                            <i class="fas fa-circle text-primary"></i> Direct
                                        </span>
                                        <span class="mr-2">
                                            <i class="fas fa-circle text-success"></i> Social
                                        </span>
                                        <span class="mr-2">
                                            <i class="fas fa-circle text-info"></i> Referral
                                        </span>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>

                    <!-- Content Row -->
                    <div class="row">
                        <!-- Content Column -->
                        <div class="col-lg-6 mb-4">
                            <!-- Project Card Example -->
                            <div class="card shadow mb-4">
                            </div>
                        <div class="col-lg-6 mb-4">



                        </div>
                    </div>

                </div>
                <!-- /.container-fluid -->

            </div>
            <!-- End of Main Content -->

            <!-- Footer -->
            <footer class="sticky-footer bg-white">
                <div class="container my-auto">
                    <div class="copyright text-center my-auto">
                        <span>Copyright &copy; CLASSING 2021</span>
                    </div>
                </div>
            </footer>
            <!-- End of Footer -->

        </div>
        <!-- End of Content Wrapper -->

    </div>
    <!-- End of Page Wrapper -->



    <!-- Bootstrap core JavaScript-->
    <script src="/resources/common/vendor/jquery/jquery.min.js"></script>
    <script src="/resources/common/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

    <!-- Core plugin JavaScript-->
    <script src="/resources/common/vendor/jquery-easing/jquery.easing.min.js"></script>

    <!-- Custom scripts for all pages-->
    <script src="/resources/common/js/sb-admin-2.min.js"></script> 
	<script>
		$(".toggled_btn").click(function(){
			 $(this).css('border-bottom', '2px solid #00C896');
			 $(this).css('color', '#00C896');
		})
	</script>


</body>
</html>