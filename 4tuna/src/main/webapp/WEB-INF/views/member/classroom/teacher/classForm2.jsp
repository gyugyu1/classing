<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="rb" uri="http://www.springframework.org/tags" %>
<jsp:useBean id="CodeServiceImpl" class="com.cacao.classting.code.CodeServiceImpl"/>
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
	#btn-add2{
		border-radius: 50px;
		font-size: 14px;
		font-weight: bold;
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
	label {
	margin-top:10px;
	}
	  textarea {
    width: 100%;
    height: 6.25em;
    resize: none;
    border-radius:10px;
    border: 1px solid silver;
  }
</style>
</head>
<body>
<jsp:include page="/WEB-INF/views/member/include/main_header.jsp" flush="true" />
<img style="float: left;" src="../../../../../resources/common/image/classtingFlower.png">

<div class="row justify-content-center" style="color:black;">
<c:set var="CodeClassGrade" value="${CodeServiceImpl.selectListCachedCode('4')}"/>
	<div class="col-md-10 d-flex justify-content-center" id="context">
	<form action="/classInst" method="post" id="classForm" name="classForm" class="row">
	<input type="hidden" name="ctcsSeq" id="ctcsSeq" value="<c:out value="${vo.ctcsSeq}"/>">
	<%-- <input type="hidden" name="mmSeq" id="mmSeq" value="<c:out value="${vo.mmSeq}"/>"> --%>
		<div class="col-md-7" style="margin-top:100px;">
		<h3 >클래스 이름을 지어주세요.</h3>
			<label for="className">클래스 이름</label>
			<input type="text" class="form-control" id="ctcsName" name="ctcsName" placeholder="클래스 이름은 언제든지 설정에서 수정할 수 있어요." >
			<label for="year">연도</label>
			<input type="text" class="form-control" id="ctcsYear" name="ctcsYear" placeholder="숫자만 입력해주세요.  예시)2022" >
			<label for="ctcsGradeCd">학년</label>
			<select class="form-select" id="ctcsGradeCd" name="ctcsGradeCd" >
				<c:forEach items="${CodeClassGrade}" var="itemClassGrade" varStatus="statusClassGrade">
					<option value="<c:out value="${itemClassGrade.ifcdOrder}"/>" <c:if test="${item.ctcsGradeCd eq itemClassGrade.ifcdOrder }">selected</c:if> ><c:out value="${itemClassGrade.ifcdName}"/></option>	
				</c:forEach>
			</select>
			
			<label for="introduce">소개글(옵션)</label>
			<textarea rows="3" cols="80" id="ctcsDesc" name="ctcsDesc" placeholder="예:즐거운 영어회화 클래스입니다~"></textarea>
	
			<button type="button" class="btn btn-outline-secondary" style="display: inline; margin-top:30px;" id="btn-add2" onclick="location.href='./classForm'">이전</button>
			<button type="submit" class="btn btn-outline-success" style="display: inline; margin-top:30px; float: right;" id="btn-add2" >클래스 개설</button>
		
		</div>
	</form>	
	</div>
</div>


	


    <!-- Bootstrap core JavaScript-->
    <script src="../../../../../resources/common/vendor/jquery/jquery.min.js"></script>
    <script src="../../../../../resources/common/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

    <!-- Core plugin JavaScript-->
    <script src="../../../../../resources/common/vendor/jquery-easing/jquery.easing.min.js"></script>

    <!-- Custom scripts for all pages-->
<script src="../../../../../resources/common/js/sb-admin-2.min.js"></script> 
    
<script src="/resources/common/js/validation.js"></script>    
<script type="text/javascript">

$("#btn-add2").on("click", function(){
	
	if(!checkNull($("#ctcsName"), $("#ctcsName").val(), "이름을 입력하세요.")) return false;
	
	$("#classForm").attr("action", "/classInst");
	$("#classForm").submit();

});

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