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
/* #posting {
	width: 850px;
	margin-left: auto;
	margin-right: auto;
	margin-top: 50px;
} */
</style>


</head>
<body id="page-top">
	<c:set value="${checkLikeOrNot}" var="chkLike" />
	<!-- Page Wrapper -->
	<div id="wrapper">
		<%@ include file="/WEB-INF/views/member/include/classSidebar.jsp"%>

		<div id="content-wrapper" class="d-flex flex-column">

			<%@ include file="/WEB-INF/views/member/include/classNavbar.jsp"%>

			<div class="container-fluid">
				<div class="row" id="posting">
					<div class="col-12">
						<div class="card shadow mb-4">
							<div class="container_base">
								<c:if test="${item.ctboSeq eq 5}">
									<span class='badge badge_notice'>공지</span>
								</c:if>
								<c:if test="${item.ctboSeq eq 1}">
									<span class='badge badge_graded'>자유공간</span>
								</c:if>
								<c:if test="${item.ctboSeq eq 2}">
									<span class='badge badge_alreadyend'>학습자료</span>
								</c:if>
								<c:if test="${item.ctboSeq eq 3}">
									<span class='badge badge_after3'>활동사진</span>
								</c:if>
								<div class="title d-flex justify-content-between">
									<c:out value="${item.ctptTitle}" />
									<c:if test = "${ctcmSeq eq item.ctptWriter}">
										<form action = "/postdelete.do" method="post" id="deleteForm">
											<input value="${item.ctptSeq}" type="hidden" name="ctptSeq">
											<button type="button" class="btn btn-danger float-end" id="deleteBtn">삭제</button>
										</form>
									</c:if>
								</div>
							</div>
							<div class="container_base">
								<div class="writer row">
									<div class="col-md-2 col-lg-1" id="classImg">
										<c:forEach items="${memberList}" var="itemMember" varStatus="status">
											<c:if test="${item.ctptWriter eq itemMember.ctcmSeq and itemMember.path ne null}">
												<span>
													<img class="profile" src="/resources/uploaded/${ctcsSeq }/${itemMember.ctcmSeq}/${itemMember.ctcmProfile}" onerror="this.src='/resources/uploaded/common/profile2.png'" style="border-radius: 18px; width: 35px; height: 35px;" />
												</span>
											</c:if>
										</c:forEach>
									</div>
									<div class="col-md-10 col-lg-11" id="classInfo">
										<c:forEach items="${memberList}" var="itemMember" varStatus="status">
											<c:if test="${item.ctptWriter eq itemMember.ctcmSeq }">
												<span>
													<b><c:out value="${itemMember.ctcmName}" /></b>
												</span>
											</c:if>
										</c:forEach>
										<span style="color: #c8c8c8; font-size: 14px; margin-left: 20px;">
											<fmt:formatDate value="${item.regDateTime}" pattern="yyyy-MM-dd HH:mm:ss" />
										</span>
										<%-- &nbsp;&nbsp;<span style="color: #acacac; font-size: 14px;">조회수:<c:out value="${item.ctptView }"/></span> --%>
									</div>
								</div>
							</div>
							<div class="container_base">
								<div class="post_content">
									<div class="mt-3 mb-5">
										<c:if test="${ytb.originalName ne null}">
											<div id="player"></div>
											<br>
										</c:if>
										<script>
											// 2. This code loads the IFrame Player API code asynchronously.
											var tag = document
													.createElement('script');

											tag.src = "https://www.youtube.com/iframe_api";
											var firstScriptTag = document
													.getElementsByTagName('script')[0];
											firstScriptTag.parentNode
													.insertBefore(tag,
															firstScriptTag);

											// 3. This function creates an <iframe> (and YouTube player)
											//    after the API code downloads.
											var player;
											function onYouTubeIframeAPIReady() {
												player = new YT.Player(
														'player',
														{
															height : '360',
															width : '640',
															videoId : '<c:out value="${ytb.originalName}"/>',
															events : {
																'onReady' : onPlayerReady,
																'onStateChange' : onPlayerStateChange
															}
														});
											}
											// 4. The API will call this function when the video player is ready.
											function onPlayerReady(event) {
												event.target.playVideo();
											}

											// 5. The API calls this function when the player's state changes.
											//    The function indicates that when playing a video (state=1),
											//    the player should play for six seconds and then stop.
											var done = false;
											function onPlayerStateChange(event) {
												if (event.data == YT.PlayerState.PLAYING
														&& !done) {

													done = true;
												}
											}
											function stopVideo() {
												player.stopVideo();
											}
										</script>

										<c:out value="${item.ctptContent}" />



									</div>
									<div class="post_content mt-3 float-end">
										<i class="fa-solid fa-eye"> <c:out value="${item.ctptView }" /></i>&nbsp;&nbsp;
										<c:choose>
											<c:when test="${chkLike}">
												<i class="fa fa-solid fa-thumbs-up" role="button" id="totalLikes" style="color: #00C896;">&nbsp;<c:out value="${countLike }" /></i>
											</c:when>
											<c:otherwise>
												<i class="fa fa-solid fa-thumbs-up" role="button" id="totalLikes">&nbsp;<c:out value="${countLike }" /></i>
											</c:otherwise>
										</c:choose>
									</div>
								</div>
							</div>
							<div class="container_base">
								<h5>댓글</h5>
								<c:forEach items="${replyList}" var="itemReply" varStatus="status">
									<div class="comment row mt-2 mb-3">
										<div class="col-md-2 col-lg-1" id="classImg">
											<c:forEach items="${memberList}" var="itemMember" varStatus="status">
												<c:if test="${itemReply.ctrpWriter eq itemMember.ctcmSeq and itemMember.path ne null}">
													<span>
														<img class="profile" src="/resources/uploaded/${ctcsSeq }/${itemMember.ctcmSeq}/${itemMember.ctcmProfile}" alt="/resources/uploaded/common/profile2.png" style="border-radius: 18px; width: 35px; height: 35px;" />
													</span>
												</c:if>
											</c:forEach>
										</div>
										<div class="col-md-10 col-lg-11" id="classInfo">
											<form action="/replyUele" id="replyList" name="replyList" method="post">
												<input type="hidden" id="ctptSeq" name="ctptSeq" value="${vo.ctptSeq}">
												<input type="hidden" id="ctrpSeq" name="ctrpSeq" value="${vo.ctrpSeq}">
												<div>
													<c:forEach items="${memberList}" var="itemMember" varStatus="status">
														<b><c:if test="${itemReply.ctrpWriter eq itemMember.ctcmSeq }">
																<span>
																	<b><c:out value="${itemMember.ctcmName}" /></b>
																</span>
															</c:if></b>
													</c:forEach>
													<c:if test="${ctcmSeq eq itemReply.ctrpWriter}">
														<div class="dropdown no-arrow d-inline">
															<a class="dropdown-toggle" href="#" role="button" id="dropdownMenuLink" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
																<i class="fas fa-ellipsis-v fa-sm fa-fw text-gray-400"></i>
															</a>
															<div class="dropdown-menu dropdown-menu-right shadow animated--fade-in" aria-labelledby="dropdownMenuLink">
																<a class="dropdown-item text-danger" href="javascript:goReplyUele(<c:out value="${itemReply.ctrpSeq}"/>)">댓글삭제</a>
															</div>
														</div>
													</c:if>
												</div>
												<div style="color: #c8c8c8; font-size: 14px;">
													<fmt:formatDate value="${itemReply.regDateTime}" pattern="yyyy-MM-dd HH:mm:ss" />
												</div>
												<div>
													<c:out value="${itemReply.ctrpContent}" />
												</div>
											</form>
										</div>
									</div>
								</c:forEach>
							</div>
							<div class="container_base">
								<form id="replyInst" name="replyInst" action="/member/class/common/replyInst" method="post">
									<input type="hidden" id="ctptSeq" name="ctptSeq" value="<c:out value="${vo.ctptSeq}"/>">
									<input type="hidden" id="ctrpWriter" name="ctrpWriter" value="<c:out value="${ctcmSeq}"/>">
									<div class="comment_write row">
										<div class="col-md-3 col-lg-2" id="classImg">
											<c:if test="${ctPath ne null}">
												<img class="profile" src="/resources/uploaded/${ctcsSeq }/${ctcmSeq}/${ctcmProfile}" alt="/resources/uploaded/common/profile2.png" style="border-radius: 18px; width: 35px; height: 35px;" />
											</c:if>
											<div>${ctcmName}</div>
										</div>
										<div class="col-md-9 col-lg-10" id="classInfo">
											<input type="text" id="ctrpContent" name="ctrpContent" class="w-100">
											<div>
												<div class="btn-group" role="group">
													<button type="button" class="btn btn-outline-secondary btn-sm">
														<i class="fa-solid fa-file-circle-plus"></i>
													</button>
													<button type="button" class="btn btn-outline-secondary btn-sm">
														<i class="fa-solid fa-image"></i>
													</button>
												</div>
												<button type="submit" class="basic_button" onclick="location.href='javascript:goReply()'">등록</button>
											</div>
										</div>
									</div>
								</form>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>

	<input value="${vo.ctptSeq }" id="ctptSeq">
	<input value="${ctcmSeq }" id="ctcmSeq">




	<!-- End of Page Wrapper -->
	<!-- Bootstrap core JavaScript-->
	<script src="../../../../resources/common/vendor/jquery/jquery.min.js"></script>
	<script src="../../../../resources/common/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

	<!-- Core plugin JavaScript-->
	<script src="../../../../resources/common/vendor/jquery-easing/jquery.easing.min.js"></script>

	<!-- Custom scripts for all pages-->
	<script src="../../../../resources/common/js/sb-admin-2.min.js"></script>
	<script type="text/javascript">
		//좋아요 클릭시

		var ctptSeq = $("#ctptSeq").val();
		var ctcmSeq = $("#ctcmSeq").val();

		var sendData = {
			"ctptSeq" : ctptSeq,
			"ctcmSeq" : ctcmSeq
		}
		goReply = function() {
			$("#replyInst").attr("action", "/member/class/common/replyInst");
			$("#replyInst").submit();
		}

		goReplyUele = function(seq) {
			$("#ctrpSeq").val(seq);
			$("#replyList").attr("action", "/replyUele");
			$("#replyList").submit();
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

		$("#totalLikes").on("click", function() {
			$.ajax({
				type : "POST",
				url : "/modLike",
				data : JSON.stringify(sendData),
				contentType : "application/json;charset =utf-8",
				success : function(res) {
					$("#totalLikes").html("&nbsp;" + res.total);
					if (res.check == 1) {
						$("#totalLikes").attr("style", "color:#00C896");
					} else {
						$("#totalLikes").removeAttr("style");
					}

				}
			})
		})
		
		
		$("#deleteBtn").on("click",function(){
			if(confirm("정말 삭제하시겠어요?") == true){
				$("#deleteForm").submit();
			}else{
				return false;
			}
			
		})
	</script>



	<!-- Option 1: Bootstrap Bundle with Popper -->
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
	<script src="/resources/common/bootstrap/bootstrap-5.1.3-dist/js/bootstrap.bundle.min.js"></script>


</body>
</html>