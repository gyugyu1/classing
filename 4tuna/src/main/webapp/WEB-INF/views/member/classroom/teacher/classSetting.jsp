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

<style type="text/css">
	#posting{
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
<link href="/resources/common/css/sb-admin-2.css" rel="stylesheet">
<link href="/resources/user/css/classCommon.css" rel="stylesheet">
<link href="/resources/common/css/boardCss.css" rel="stylesheet">


<title></title>
</head>
<body id="page-top">

	<!-- Page Wrapper -->
	<div id="wrapper">

		<%@ include file="/WEB-INF/views/member/include/classSidebar.jsp" %>
		<div id="content-wrapper" class="d-flex flex-column">
		<%@ include file="/WEB-INF/views/member/include/classNavbar.jsp" %>
		<!-- ????????? ??????  -->
		
                <!-- Begin Page Content -->
                <div class="container-fluid">
                    <div class="row" id="posting">
                        <!-- Area Chart -->
                        <div class="col-12">
							<div class="container_title shadow mb-4">
								<div class="header">????????? ??????</div>
								<div class="body">????????? ????????? ??????????????? ????????? ????????? ??? ?????????.</div>
								<br>
							</div>
							
							<!-- ????????? ?????? ?????? ?????? -->
                            <div class="card shadow mb-4 ">
                            <div class="container_base">
								<div class="homework_listitem">
									<div class="header">
										<span>????????? ??????</span>
									</div>
									<div class="classTitleSetting">
										<input type="text" class="form-control" placeholder="????????? ????????? ???????????? ???????????? ?????? ??? ??? ?????????." value="${ctcsName}" maxlength="50" style="margin-top:10px;" size="80px;">
									</div>
									<div class="footer">
									</div>
								</div>
								
								<div class="homework_listitem">
									<div class="header">
										<span>??????</span>
									</div>
									<div class="classTitleSetting">
										<select class="form-control" style="margin-top:10px;">
											<option value="9"><span><c:out value="${ctcsYear}"/></span>
											<option value="0">2022
											<option value="1">2021
											<option value="2">2020
											<option value="3">2019
											<option value="4">2018
											<option value="5">2017
											<option value="6">2016
											<option value="7">2015
											<option value="8">2014
										</select>
									</div>
									<div class="footer">
									</div>
								</div>

								<div class="homework_listitem">
									<div class="header">
										<span>??????</span>
									</div>
									<div class="classTitleSetting">
										<select class="form-control" style="margin-top:10px;">
											<option value="0">1??????
											<option value="1">2??????
											<option value="2">3??????
											<option value="3">4??????
											<option value="4">5??????
											<option value="5">6??????
										</select> 
<%-- 									<select class="form-select" id="ctcsGradeCd" name="ctcsGradeCd" >
											<c:forEach items="${CodeClassGrade}" var="itemClassGrade" varStatus="statusClassGrade">
												<option value="<c:out value="${itemClassGrade.ifcdOrder}"/>" <c:if test="${item.ctcsGradeCd eq itemClassGrade.ifcdOrder }">selected</c:if> ><c:out value="${itemClassGrade.ifcdName}"/></option>	
											</c:forEach>
										</select>		 --%>
									</div>
									<div class="footer">
									</div>
								</div>
								
								<div class="homework_listitem">
									<div class="header">
										<span>?????????</span>
									</div>
									<div class="classTitleSetting">
										<textarea class="form-control" cols="80" rows="10" id="content" name="content" placeholder="????????? ???????????? ??????????????????!" value="${ctcsDesc}"  style="resize:none; margin-top: 10px; margin-bottom:25px;"></textarea>	
										<button type="button" class="basic_button mt-10 w-25 p-2" data-bs-toggle="modal" data-bs-target="#formModal1" style="float:right">???????????? ??????</button>
									<!-- ?????? -->
											<div class="modal fade" id="formModal1" tabindex="-1" aria-hidden="true">
												<div class="modal-dialog">
													<div class="modal-content">
														<div class="modal-header">
															<h5 class="modal-title" id="editModalLabel">?????? ??????</h5	>
															<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
														</div>
														<div class="modal-body">????????? ?????????????????????.</div>
														<div class="modal-footer">
															<button type="button" class="basic_button" data-bs-dismiss="modal">??????</button>
														</div>
													</div>
												</div>
											</div>	
									<!-- ?????? -->
									
									</div>
									<div class="footer">
									</div>
								</div>
							</div>
							<!-- ????????? ?????? ?????? ??? -->
							
							
                            </div>
							<!-- ?????? ?????? -->
                            <div class="card shadow mb-4 ">
                            <div class="container_base">
								
								<div class="homework_listitem">
									<div class="header">
										<span>????????? ??????</span>
									</div>
									<div class="classTitleSetting">
										<div class="body" style="margin-top: 10px;">???????????? ?????? ???????????? ????????? ???????????????.<br> ?????? ????????? ???????????? ?????? ????????? ???????????? ????????? ???????????????.</div>
										
										<!-- ?????? ?????? -->
											<button type="button" class="btn btn-outline-danger mt-10 w-25 p-2" id="btn-nele" data-bs-toggle="modal" data-bs-target="#formModal" style="float:right;">????????? ??????</button>
											<div class="modal fade" id="formModal" tabindex="-1" aria-hidden="true">
												<div class="modal-dialog">
													<div class="modal-content">
														<div class="modal-header">
															<h5 class="modal-title" id="editModalLabel">????????? ??????</h5	>
															<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
														</div>
														<div class="modal-body">????????? ?????????????????????????</div>
														<div class="modal-footer">
															<button type="button" class="btn btn-secondary" data-bs-dismiss="modal">??????</button>
															<a class="btn btn-danger" role="button" href="/classList">??????</a>
														</div>
													</div>
												</div>
											</div>
										
										<!-- ?????? ??? -->
									</div>
			
									<div class="footer">
									</div>
								</div>
							</div>
							<!-- ?????? ??? -->
                        </div>

            </div>


			</div>
		</div>		
		
	</div>
	</div>



	<!-- End of Page Wrapper -->
	<!-- Bootstrap core JavaScript-->
	<script src="/resources/common/vendor/jquery/jquery.min.js"></script>
	<script src="/resources/common/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

	<!-- Core plugin JavaScript-->
	<script src="/resources/common/vendor/jquery-easing/jquery.easing.min.js"></script>

	<!-- Custom scripts for all pages-->
	<script src="/resources/common/js/sb-admin-2.min.js"></script>
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

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>

</html>