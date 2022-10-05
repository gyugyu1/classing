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
<link href="/resources/common/bootstrap/bootstrap-5.1.3-dist/css/bootstrap.min.css"  rel="stylesheet" >
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.1.1/css/all.min.css"/>
<!-- <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous"> -->

<!-- Custom fonts for this template-->
<link href="/resources/common/vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
<link href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i" rel="stylesheet">

<!-- Custom styles for this template-->
<link href="/resources/index/css/jquery-ui.css" rel="stylesheet">
<link href="/resources/common/css/sb-admin-2.min.css" rel="stylesheet">
<link href="/resources/user/css/classCommon.css" rel="stylesheet">
<link href="/resources/user/css/memberForm_user.css" rel="stylesheet" type="text/css">
<link rel="shortcut icon" href="https://ifh.cc/g/nj4CTw.png" type="image/x-icon" />
<title id="ctl00_headerTitle">CLASSING</title>
</head>
<body>
<div class="container my-wrap">
<!-- 헤더 s -->
<div class="container my-wrap"><!-- d-none d-sm-block : sm사이즈에서는 보이지 않음 d-block d-sm-none : sm에서만 보임 -->
	<div class="row mt-5 mb-4 ">
		<div class="d-grid gap-2 col-12 mx-auto mt-3">
			<img src="/resources/common/image/header_logo.png" style="width: 240px; margin-left: 30px;" onclick="location.href='/index'">
		</div>	
	</div>
</div>	
<!-- 헤더 e-->
	 <div class="col ml-auto" data-aos="fade-up" data-aos-delay="500">
                  <form action="" method="post" class="form-box">
                    <h3 class="h4 text-black mb-4" style="text-align: center;">관리자 로그인</h3>
                    <div class="form-group">
                      <input type="text" class="form-control" id="mmId" name="mmId" placeholder="아이디" value="asd123">
                    </div>
                    <div class="form-group">
                      <input type="password" class="form-control" id="mmPassword" name="mmPassword" placeholder="비밀번호" value="1111">
                    </div>
                    <div class="form-group d-grid gap-2">
                    <input type="button" class="btn btn-primary btn-pill" id="btnLogin"   value="로그인">
                    </div>
                  </form>
                </div>
	</div>
<!-- Option 1: Bootstrap Bundle with Popper -->
<script src="http://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script src="/resources/index/js/jquery-ui.js"></script>
<script src="/resources/common/js/validation.js"></script>
<script src="/resources/common/bootstrap/bootstrap-5.1.3-dist/js/bootstrap.bundle.min.js"></script>  
<script type="text/javascript">
$("#btnLogin").on("click",function(){ 
	 
	if(!checkNull($("mmId"), $.trim($("#mmId").val()), "아이디를 입력해 주세요!")) return false;
	if(!checkNull($("mmPassword"), $.trim($("#mmPassword").val()), "비밀번호를 입력해 주세요!")) return false;
	$.ajax({
		async: true 
		,cache: false
		,type: "post"
		,url: "/member/loginProc"
		,data : { "mmId" : $("#mmId").val(), "mmPassword" : $("#mmPassword").val()}
		,success: function(response) {
			if(response.rt == "success") { 
					location.href = "/adminMemberList";
			} else {
				alert("회원없음");
			}
		}			
		,error : function(jqXHR, textStatus, errorThrown){
			alert("ajaxUpdate " + jqXHR.textStatus + " : " + jqXHR.errorThrown);
		}
	});
});
</script>


</body>
</html>