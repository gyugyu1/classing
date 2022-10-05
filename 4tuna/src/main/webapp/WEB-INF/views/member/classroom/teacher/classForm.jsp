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
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.1.1/css/all.min.css"/>
<!-- Custom fonts for this template-->
<link href="../../../../../resources/common/vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
<link href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i" rel="stylesheet">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.7.1/font/bootstrap-icons.css">
<!-- Custom styles for this template-->
<link href="../../../../../resources/common/css/sb-admin-2.min.css" rel="stylesheet">
<link href="../../../../../resources/user/css/classCommon.css" rel="stylesheet">
<link rel="shortcut icon" href="https://ifh.cc/g/nj4CTw.png" type="image/x-icon" />
<title id="ctl00_headerTitle">CLASSING</title>
<style type="text/css">
	#home{
		margin-left: 40px;
		font-size: 18px;
	}
	#class{
		margin-left: 20px;
		font-size: 18px;
	}
	.icon{
		display: inline;
		margin-right: 20px;
	}
	#profile{
		margin-left: 20px;
	}
	#main{
		width: 60%;
	}
	#main_bg{
		height: 110px;
		border-radius: 7px;
		margin-top: 20px;
	}
	#classNotice{
		border: 1px solid #dcdcdc;
		border-radius: 10px;
		width: 100%;
		height: 500px;
		margin-top: 20px;
		padding: 30px;
		height: auto;
	}
	#classList{
		border: 1px solid #dcdcdc;
		border-radius: 10px;
		width: 100%;
		height: 300px;
		margin-top: 20px;
		padding: 20px;
		height: auto;
	}
	#schInfo{
		border: 1px solid #dcdcdc;
		border-radius: 10px;
		width: 100%;
		height: 300px;
		margin-top: 20px;
		padding-left: 30px;
		padding-bottom: 30px;
		padding-right: 30px;
		padding-top: 20px;
		height: auto;
		background-color: #F6F9F7;
	}
	i{
		padding-left: 10px;
	}
	#title{
		font-weight: bold;
		margin-left: 20px;
		padding-top: 5px;
	}
	p {
		word-wrap: break-word;
	}
	#content{
		font-size: 15px;
	}
	#date{
		font-size: 13px;
		color: #c8c8c8;
	}
	#btn-add{
		border-radius: 50px;
		font-size: 14px;
		font-weight: bold;
		margin-bottom: 10px;
	}
  	#classImg{
		float: left;
	}  
 	#classInfo{
		float: right;
		font-size: 15px;
		padding-top: 3px;
	}
	#schNotice{
		background-color: white;
		border-radius: 7px;
		text-align: center;
		height: 100px;
		width: 100%;
		font-size: 14px;
		margin-bottom: 30px;
	}
	#schFood{
		background-color: white;
		border-radius: 7px;
		text-align: center;
		height: 200px;
		width: 25%;
		font-size: 14px;
		padding: 10px;
	}
</style>
</head>
<body>

<jsp:include page="/WEB-INF/views/member/include/main_header.jsp" flush="true" />

<img style="float: left;" src="../../../../../resources/common/image/classtingFlower.png">

<div class="row justify-content-center" style="color:black;">
	<div class="col-md-10 d-flex justify-content-center" id="context">
		<div class="col-md-7" style="margin-top:100px;">
		<h3 >환영합니다!
		<br>클래스 정보를 등록해주세요!</h3>
		<label for="school" class="form-label" style="color:black;">학교/기관</label>
		<div class="input-group mb-3" data-bs-toggle="modal" data-bs-target="#schModal">
			<input type="text" class="form-control" id="ctcsBelongto" name="ctcsBelongto" placeholder="학교/기관의 이름을 입력해주세요."  aria-describedby="button-addon2">
			<button class="btn btn-outline-secondary" type="button" id="button-addon2" ><i class="fa-solid fa-magnifying-glass" style="padding:0px;"></i></button>
		</div>
		<div style="height:100px; border:1px solid silver; border-radius: 5px;">
			<span>[학교·기관 이름] 또는 [지역이름 + 학교·기관 이름]으로 검색해주세요.<br>예) 클팅중학교(X), 서울 클팅중학교(O)</span>
		</div>
		
		<button type="button" class="btn btn-outline-none" data-bs-toggle="modal" data-bs-target="#none" style="font-weight: bold;color:black;">학교나 소속 기관이 없는 클래스인가요?</button>
		</div>
	</div>
</div>
<!-- modal -->
		<div class="modal" tabindex="-1" id="none" style="color:black;">
		  <div class="modal-dialog">
		    <div class="modal-content">
		     
		      <div class="modal-body">
		    	소속기관이 없는 클래스 개설 시, 일부 기관 관련 기능이 제한될 수 있습니다. 소속이 있는 경우, 학교/기관을 선택해주세요.
			   </div>
		      <div class="modal-footer">
		        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">취소</button>
		        <button type="submit" class="btn btn-primary" onclick="location.href='./classForm2'">등록</button>
		      </div>
		      </div>
		    </div>
		  </div>
		<!-- modal end -->


				<div class="modal fade" id="schModal" tabindex="-1" aria-hidden="true">
				<div class="modal-dialog">
					<div class="modal-content">
						<div class="modal-header">
							<h5 class="modal-title" id="exampleModalLabel">학교 / 기관 검색</h5>
							<button type="button" class="btn-close"
								data-bs-dismiss="modal" aria-label="Close"></button>
						</div>
						<div class="modal-body">
							<h3 style="text-align: center">학교 및 기관 검색</h3>
							<br> <br><div class="input-group mb-3"> <input class="form-control form-control-lg" type="text" placeholder="이름 입력">
							<button class="btn btn-outline-secondary" role="button" id="button-addon2">검색</button>
						</div>
						<p>[학교·기관 이름] 또는 [지역 이름 + 학교·기관 이름]으로 검색해 보세요.</p>
						<p>예) 클팅중학교 (X), 서울클팅중학교 (O)</p>
					</div>
					<div class="modal-footer">
						<button type="button" class="btn btn-secondary" data-bs-dismiss="modal">닫기</button>
						<button type="button" data-bs-toggle="modal" class="btn btn-primary">확인</button>
					</div>
				</div>
			</div>
			</div>
  
  
  
  
    <!-- Bootstrap core JavaScript-->
    <script src="../../../../../resources/common/vendor/jquery/jquery.min.js"></script>
    <script src="../../../../../resources/common/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

    <!-- Core plugin JavaScript-->
    <script src="../../../../../resources/common/vendor/jquery-easing/jquery.easing.min.js"></script>

    <!-- Custom scripts for all pages-->
    <script src="../../../../../resources/common/js/sb-admin-2.min.js"></script> 

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
<!-- <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"> --></script>
<!-- <script src="/resources/common/bootstrap/bootstrap-5.1.3-dist/js/bootstrap.bundle.min.js"></script>   -->

<!-- Option 2: Separate Popper and Bootstrap JS -->

<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.10.2/dist/umd/popper.min.js" integrity="sha384-7+zCNj/IqJ95wo16oMtfsKbZ9ccEh31eOz1HGyDuCQ6wgnyJNSYdrPa03rtR1zdB" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.min.js" integrity="sha384-QJHtvGhmr9XOIpI6YVutG+2QOK9T+ZnN4kzFN1RtK3zEFEIsxhlmWl5/YESvpZ13" crossorigin="anonymous"></script>

</body>
</html>