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
<link href="../../resources/common/vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
<link href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i" rel="stylesheet">

<!-- Custom styles for this template-->
<link href="../../../resources/common/css/sb-admin-2.min.css" rel="stylesheet">
<link href="../../../resources/user/css/classCommon.css" rel="stylesheet">
<link href="../../../resources/common/css/boardCss.css" rel="stylesheet">
<link href="../../../resources/chat/css/chat.css" rel="stylesheet">


<link rel="shortcut icon" href="https://ifh.cc/g/nj4CTw.png" type="image/x-icon" />
<title id="ctl00_headerTitle">CLASSING</title>
<style>
.membersList {
	border: 1px solid #00C896;
	background-color: white;
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

			<div id="container-fluid">
				<div class="row" id="posting">
					<div class="col-12 mb-5">
						<aside>
							<header class="py-3 rounded bg-white" style="color: #00C896; border: 1px solid #00C896">
								<div style="text-align: center;">
									<h3 style="font-weight: 500">????????????</h3>
								</div>
							</header>
							<ul>
								<c:forEach items="${memberList }" var="ml" varStatus="st">
									<c:if test="${ml.ctcmSeq != vo.ctcmSeq  }">
										<li class="pr-3 py-2 ">
											<button type="button" class="membersList btn position-relative w-100 rounded" id="member">
												<input type="hidden" value="${ml.ctcmName }" id="name" class="name" />
												<input type="hidden" value="${ml.ctcmSeq}" id="seq" class="seq" />
												<img src="/resources/uploaded/${ctcsSeq }/${ml.ctcmSeq}/${ml.ctcmProfile}" onerror="this.src='/resources/uploaded/common/profile2.png'" width="35" height="35">
												<div>
													<h2>
														<c:out value="${ml.ctcmName }" />
													</h2>
													<%-- 													<h3 id = "status${ml.ctcmSeq }">
														<span class="status orange" ></span>
														offline
													</h3> --%>
												</div>


												<span id="${ml.ctcmSeq }" class="position-absolute top-0 start-100 translate-middle badge rounded bg-danger">
													<c:out value="${ml.chatCountNum }" />
												</span>
											</button>
										</li>
									</c:if>
								</c:forEach>
							</ul>
						</aside>
						<main id="main">
							<header>
								<div>
									<h3 style="color: #00C896; font-weight: 700; font-size: 1.5rem;">??????????????? ???????????????.</h3>
								</div>
							</header>
							<ul id="chat">

							</ul>
						</main>
					</div>
				</div>
			</div>
		</div>
	</div>

	<input type="hidden" value="${vo.ctcmSeq }" id="myId">
	<input type="hidden" value="${vo.ctcsSeq }" id="classId">
	<input type="hidden" value="${vo.ctcmName }" id="myName">
	<input type="hidden" value="${fn:length(memberList) }" id="listSize">


	<!-- End of Page Wrapper -->
	<!-- Bootstrap core JavaScript-->
	<script src="../../../../../resources/common/vendor/jquery/jquery.min.js"></script>
	<script src="../../../../../resources/common/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

	<!-- Core plugin JavaScript-->
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
	<script src="../../../../../resources/common/vendor/jquery-easing/jquery.easing.min.js"></script>

	<!-- Custom scripts for all pages-->
	<script src="../../../../../resources/common/js/sb-admin-2.min.js"></script>

	<script src="https://cdnjs.cloudflare.com/ajax/libs/stomp.js/2.3.3/stomp.min.js"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/sockjs-client/1.6.1/sockjs.min.js" integrity="sha512-1QvjE7BtotQjkq8PxLeF6P46gEpBRXuskzIVgjFpekzFVF4yjRgrQvTG1MTOJ3yQgvTteKAcO7DSZI92+u/yZw==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
	<script>
		$("#btnLogout").on("click", function() {
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
					alert("ajaxUpdate " + jqXHR.textStatus + " : " + jqXHR.errorThrown);
				}
			});
		});

		
		
		var listSize = $("#listSize").val();
		var client;
		var mySessionId = $("#myId").val();
		var classId = $("#classId").val();
		var myName = $("#myName").val();
		var receiver; //memberList ??????????????? ?????? ????????? ????????? ?????????
		var msg = "";
		//????????? ?????? ?????? ??????
		var today = new Date();
		var hours = today.getHours();
		var minutes = today.getMinutes();

		//????????? ?????????/???????????? ??????
		var statusOn = ' <span class="status green" ></span> ';
		statusOn += "online"

		var onlineSet = new Set(listSize);

		$(function() {
			var msgTemplate;
			var sock = new SockJS("/ctChatServer");
			client = Stomp.over(sock);
			client.connect({}, function() {
				console.log("connected stompTest");
				//Controller's MessageMapping, header , message(????????????)
				//??????????????? ???????????? ????????? ????????? msg??? ?????? ????????? ????????????
				client.subscribe('/sub/topic/' + classId + "/" + mySessionId, function(msg) { 
					var data = JSON.parse(msg.body);

					if (data.ctmgSenderId == receiver) { //???????????? ??????????????? ???
						msgTemplate = '<li class="you">'
						msgTemplate += '<div class="entete">';
						msgTemplate += '<h3>' + hours + "???" + minutes + "???" + '</h3>';
						msgTemplate += '<h2>' + data.ctmgSender + '</h2>';
						msgTemplate += '<span class="status green"></span>';
						msgTemplate += '</div>';
						msgTemplate += '<div class="triangle"></div>';
						msgTemplate += '<div class="message">' + data.ctmgMessage + '</div>';
						msgTemplate += '</li>';
						$("#chat").append(msgTemplate);
						$("#chat").animate({
							scrollTop : $("#chat")[0].scrollHeight
						}, 400)

						var tmp = {
							'ctcsSeq' : classId,
							'ctmgReceiver' : data.ctmgSenderId,
							'myId' : mySessionId
						}
						//readNyUpdate???????????? ?????????????????? ?????? ???????????? ????????????
						$.ajax({
							type : "POST",
							url : "/readNyUpdate",
							data : JSON.stringify(tmp),
							contentType : "application/json; charset = UTF-8",
							dataType : "json"
						})

					} else {
						//???????????? ???????????? ????????? ???????????? ??????????????? ?????????
						var countData = {
							'ctcsSeq' : classId,
							'ctmgSenderId' : data.ctmgSenderId,
							'myId' : mySessionId
						}

						$.ajax({
							type : "POST",
							url : "/countMsg",
							data : JSON.stringify(countData),
							contentType : "application/json; charset = UTF-8",
							dataType : "json",
							success : function(res) {
								$("#" + data.ctmgSenderId).text(res);
							}

						})

					}
				})
			})

			//??? ????????? ??????

		})

		$(".membersList").click(function() { //????????? ???????????? ?????? id??? ????????? controller??? ??????
			var params = {
				name : $(this).find($(".name")).val(),
				ctmgReceiver : $(this).find($(".seq")).val(),
				ctcsSeq : classId,
				myId : mySessionId
			}

			$.ajax({ //ajax????????? /enterRoom??? ??????
				type : "POST",
				url : "/enterRoom",
				data : JSON.stringify(params),
				contentType : "application/json; charset=UTF-8",
				dataType : "json",
				success : function(res) { //???????????? ???????????? ????????? id,????????????id,?????????id??? ????????? ????????????????????? ?????????
					receiver = res.receiver;
					var List = res.chatList;
					var main = '<header>'
					main += '<img src="/resources/uploaded/common/profile2.png" alt="" width="35" height="35">'
					main += '<div>'
					main += '<h2 id="with">????????????:' + res.name + '</h2>'
					main += '</div>'
					main += '<img src="https://s3-us-west-2.amazonaws.com/s.cdpn.io/1940306/ico_star.png" alt="">'
					main += '</header>'
					main += '<ul id="chat">'

					$.each(List, function(index, item) {
						if (item.ctmgSenderId == mySessionId) {
							main += '<li class="me">';
							main += '<div class="entete">';
							main += '<h3>' + item.ctmgSendDate + '</h3>'; //????????????
							main += '<h2>' + item.ctmgSender + '</h2>';
							main += '<span class="status blue"></span>';
							main += '</div>';
							main += '<div class="triangle"></div>';
							main += '<div class="message">' + item.ctmgMessage + '</div>';
							main += '</li>'
						} else {
							main += '<li class="you">';
							main += '<div class="entete">';
							main += '<h3>' + item.ctmgSendDate + '</h3>';
							main += '<h2>' + item.ctmgSender + '</h2>';
							main += '<span class="status green"></span>';
							main += '</div>';
							main += '<div class="triangle"></div>';
							main += '<div class="message">' + item.ctmgMessage + '</div>';
							main += '</li>'
						}
					})
					main += '</ul>'
					main += '<footer>';
					main += '<div class="input-group">';
					main += '<input type="text" id="msg" class="form-control" />'
					main += '<input type="button" class="btn btn-primary" value="??????" onclick="send()" id="sendBtn">';
					main += '</div>';
					/* main += '<img src="https://s3-us-west-2.amazonaws.com/s.cdpn.io/1940306/ico_file.png" alt="">'  */
					/* <img src="https://s3-us-west-2.amazonaws.com/s.cdpn.io/1940306/ico_picture.png" alt="">; */
					main += '</footer>'

					$("#main").html(main) //html ????????? ???????????? ??????
					$("#chat").scrollTop($("#chat")[0].scrollHeight); //??????????????? ???????????? ?????????
					$("#" + res.receiver).text(0); //badge??? 0 ?????? ?????????
					//????????? ??????
					$("#msg").keydown(function(e) {
						if (e.keyCode == 13) {
							$("#sendBtn").trigger("click");
						}
					})
				},
				error : function(XMLHttpRequest, textStatus, errorThrown) {
					alert("????????????");
				}
			})

		})

		function send() {
			msg = $("#msg").val();
			var data = {
				'ctcsSeq' : $("#classId").val(),
				'ctmgReceiver' : receiver,
				'ctmgSender' : myName,
				'ctmgSenderId' : mySessionId,
				'ctmgMessage' : msg
			}//?????????id,?????????id,?????????,?????????id,?????????
			client.send('/topic/public', {}, JSON.stringify(data));

			var msgTemplate = '<li class="me">'
			msgTemplate += '<div class="entete">';
			msgTemplate += '<h3>' + hours + "???" + minutes + "???" + '</h3>';
			msgTemplate += '<h2>' + myName + '</h2>';
			msgTemplate += '<span class="status blue"></span>';
			msgTemplate += '</div>';
			msgTemplate += '<div class="triangle"></div>';
			msgTemplate += '<div class="message">' + msg + '</div>';
			msgTemplate += '</li>';
			$("#chat").append(msgTemplate);
			$("#chat").animate({
				scrollTop : $("#chat")[0].scrollHeight
			}, 400)
			//scrollHeight ????????? ?????? ?????? ?????? ???????????? ????????? ??????.

			$("#msg").val("");
		}
	</script>
</body>

</html>




