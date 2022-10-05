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
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.1.1/css/all.min.css" />
<!-- Custom fonts for this template-->
<link href="/resources/common/vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
<link href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i" rel="stylesheet">

<!-- Custom styles for this template-->
<link href="/resources/common/css/sb-admin-2.css" rel="stylesheet">
<link href="/resources/user/css/classCommon.css" rel="stylesheet">
<link href="/resources/common/css/boardCss.css" rel="stylesheet">
<style type="text/css">


#classImg>div {
	font-size: 0.6rem;
	margin-top: 0.3rem;
}

.title {
	font-weight: bold;
	font-size: 1.8rem;
	color: #5a5c69;
}

.writer {
	align-items: center;
}

#classInfo>input {
	height: 100px;
	border: 1px solid #dee2e6;
}

.comment_write {
	position: relative;
}

.comment_write>div:nth-child(2)>div {
	position: absolute;
	display: flex;
	justify-content: space-between;
	width: 100%;
	padding-right: 2.5rem;
	padding-left: 1.2rem;
	bottom: 5%;
}

.post>.container_base:first-child {
	border-bottom-style: none;
	padding-left: 1rem;
}

.post>.container_base:nth-child(2) {
	border-bottom: 1px solid #adb5bd;
	padding-top: 0;
	padding-left: 1rem;
}

.rightbar>.container_base:first-child>div {
	font-size: 1.5rem;
	font-weight: 600;
	color: #adb5bd;
}

.rightbar_button {
	display: flex;
	justify-content: center;
}
#posting {
	width: 1100px;
	margin-left: auto;
	margin-right: auto;
	margin-top: 50px;
}
</style>


</head>
<body id="page-top">

	<!-- Page Wrapper -->
	<div id="wrapper">
		<%@ include file="/WEB-INF/views/member/include/classSidebar.jsp" %>

		<div id="content-wrapper" class="d-flex flex-column">
		
		<%@ include file="/WEB-INF/views/member/include/classNavbar.jsp" %>

		<div class="container-fluid">
			<div class="row" id="posting">
				<div class="col-xl-7 col-lg-7">
					<div class="card shadow mb-4">
						<div class="container_base">
							<div class="title"><c:out value="${item.cthpTitle}"/></div>
						</div>
						<div class="container_base">
								<div class="writer row">
									<div class="col-md-2 col-lg-1" id="classImg">
										<c:forEach items="${memberList}" var="itemMember" varStatus="status">
											<c:if test="${item.cthpWriter eq itemMember.ctcmSeq and itemMember.path ne null}"><span><img class="profile" src="${itemMember.path}${itemMember.uuidName}" style="border-radius: 18px; width: 35px; height: 35px;"/></span></c:if>
										</c:forEach></div>
									<div class="col-md-10 col-lg-11" id="classInfo">
										<c:forEach items="${memberList}" var="itemMember" varStatus="status">
										<c:if test="${item.cthpWriter eq itemMember.ctcmSeq }"><span><b><c:out value="${itemMember.ctcmName}"/></b></span></c:if>
										</c:forEach>
										<span style="color: #c8c8c8; font-size: 14px;"><fmt:formatDate value="${item.regDateTime}" pattern="yyyy-MM-dd HH:mm:ss"/></span>
									</div>
								</div>
						</div>
						<div class="container_base">
							<div class="post_content">
								<div class="mb-5 mt-5"><c:out value="${item.cthpDesc}"/></div>
								<div >마감일 : <c:out value="${item.cthpEndDateTime}"/></div>
								<%-- <div >마감일 : <fmt:formatDate value="${item.cthpEndDateTime}" pattern="yyyy-MM-dd HH:mm:ss"/></div> --%>
							</div>
						</div>
<%-- 						<div class="container_base">
						<h6>댓글</h6>
						<c:forEach items="${replyList}" var="itemReply" varStatus="status">
							<div class="comment row mt-2 mb-3">
								<div class="col-md-2 col-lg-1" id="classImg">
									<img src="/resources/uploaded/common/profile2.png" width="35" height="35" style="border-radius: 7px;">
								</div>
								<div class="col-md-10 col-lg-11" id="classInfo">
									<form action="/homeworkReplyUele" id="replyList" name="replyList" method="post">
									<input type="hidden" id="cthpSeq" name="cthpSeq" value="${vo.cthpSeq}">	
									<input type="hidden" id="ctrhSeq" name="ctrhSeq" value="${vo.ctrhSeq}">			
									<input type="hidden" id="cthsSeq" name="cthsSeq" value="${itemSubmit.cthsSeq}">			
										<div>
											<c:forEach items="${memberList}" var="itemMember" varStatus="status">
											<b><c:if test="${itemReply.ctrhWriter eq itemMember.ctcmSeq }"><span><b><c:out value="${itemMember.ctcmName}"/></b></span></c:if></b>
											</c:forEach>
											<c:if test="${ctcmSeq eq itemReply.ctrhWriter}">	
												<div class="dropdown no-arrow d-inline" >
			                                        <a class="dropdown-toggle" href="#" role="button" id="dropdownMenuLink" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
			                                            <i class="fas fa-ellipsis-v fa-sm fa-fw text-gray-400"></i>
			                                        </a>
			                                        <div class="dropdown-menu dropdown-menu-right shadow animated--fade-in"
			                                            aria-labelledby="dropdownMenuLink">
			                                            <a class="dropdown-item text-danger" href="javascript:goReplyUele(<c:out value="${itemReply.ctrhSeq}"/>)">댓글삭제</a>
			                                        </div>
			                                   	</div>
		                                    </c:if>
										</div>
										<div style="color: #c8c8c8; font-size: 14px;"><fmt:formatDate value="${itemReply.regDateTime}" pattern="yyyy-MM-dd HH:mm:ss"/></div>
										<div><c:out value="${itemReply.ctrhContent}"/></div>
									</form>	
								</div>
							</div>
							</c:forEach>
						</div>  --%>
<%-- 						<div class="container_base">
						<form id="replyInst" name="replyInst" action="/homeworkReplyInst" method="post">
						<input type="hidden" id="cthpSeq" name="cthpSeq" value="<c:out value="${vo.cthpSeq}"/>">
						<input type="hidden" id="ctrhWriter" name="ctrhWriter" value="<c:out value="${ctcmSeq}"/>">
						<input type="hidden" id="cthsSeq" name="cthsSeq" value="${vo.cthsSeq}">		
								<div class="comment_write row">
									<div class="col-md-3 col-lg-2" id="classImg">
										<img src="/resources/uploaded/common/profile2.png" width="35" height="35" style="border-radius: 7px;">
										<div>${ctcmName}</div>
									</div>
	
									<div class="col-md-9 col-lg-10" id="classInfo">
										<input type="text" id="ctrhContent" name="ctrhContent" class="w-100">
										<div>
											<div class="btn-group" role="group">
												<button type="button" class="btn btn-outline-secondary btn-sm">
													<i class="fa-solid fa-file-circle-plus"></i>
												</button>
												<button type="button" class="btn btn-outline-secondary btn-sm">
													<i class="fa-solid fa-image"></i>
												</button>
											</div>
											<button type="button" class="basic_button" onclick="location.href='javascript:goReply()'">등록</button>
										</div>
									</div>
								</div>
							</form>		
							</div> --%>
						</div>
			</div>
				<div class="col-xl-5 col-lg-5">
					<c:if test="${teacherNy eq 1 }"><%@ include file="/WEB-INF/views/member/include/classGraded.jsp" %></c:if>
					<c:if test="${teacherNy eq 0 }"><%@ include file="/WEB-INF/views/member/include/classHomeworkSubmit.jsp" %></c:if>
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
<script src="/resources/common/jquery/jquery-ui-1.13.1.custom/jquery-ui.js"></script>	
<script type="text/javascript">


	
goHomeworkSubmit = function(seq){

	$("#cthsSeq").val(seq); 
	$("#hwSubmitList").attr("action","/member/class/common/homeworkPostView");
	$("#hwSubmitList").submit(); 
}

goHomeworkSubmitStu = function(seq){

	$("#cthsSeq").val(seq);
	$("#homeworkSubmit").attr("action","/classHomeworkPostView_student");
	$("#homeworkSubmit").submit();

}

goHomeworkSubmitStuEdit = function(seq){
	
	$("#cthsSeq").val(seq);
	$("#homeworkSubmit").attr("action","/classHomeworkSubmitEdit");
	$("#homeworkSubmit").submit();

}
goHomeworkSubmitUpload = function(seq){
	
	$("#homeworkSubmit").attr("action","/classHomeworkSubmitUpload");
	$("#homeworkSubmit").submit();

}

goReply = function(){
	$("#replyInst").attr("action","/homeworkReplyInst");
	$("#replyInst").submit();
}

goReplyUele = function(seq){
	$("#ctrhSeq").val(seq);
	$("#replyList").attr("action","/homeworkReplyUele");
	$("#replyList").submit();
}

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