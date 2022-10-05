<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<!-- CSS only -->
<!-- Content Wrapper -->
<nav class="navbar navbar-expand navbar-light bg-white topbar mb-4 static-top shadow">

	<!-- Sidebar Toggle (Topbar) -->
	<button id="sidebarToggleTop" class="btn btn-link d-md-none rounded-circle mr-3">
		<i class="fa fa-bars"></i>
	</button>

	<!-- Topbar Navbar -->
	<ul class="navbar-nav ml-auto">
		<!-- Nav Item - Alerts -->

		<!-- Nav Item - Messages -->
		<li class="nav-item dropdown no-arrow mx-1 "><a class="nav-link dropdown-toggle position-relative" href="/chat" id="chatAlarm" role="button" data-bs-toggle="popover" data-bs-placement="bottom">
				<i class="fa-solid fa-comment"></i>
				<!-- Counter - Messages -->
				<!-- <span class="badge badge-danger badge-counter">7</span> -->
				<span class="badge bg-danger position-absolute" id="msgCount" style="top: 22%; left: 55%;"></span>
			</a></li>




		<div class="topbar-divider d-none d-sm-block"></div>
		<!-- Nav Item - User Information -->
		<li class="nav-item dropdown no-arrow"><a class="nav-link dropdown-toggle" href="#" id="userDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
				<span class="mr-2 d-none d-lg-inline text-gray-600 small">
					<b>${sessName}</b>
				</span>
				<c:if test="${teacherNy eq 1}">
					<span class="mr-2 d-none d-lg-inline text-gray-600 small">
						<font id="roleT">선생님</font>
					</span>
				</c:if>
				<c:if test="${teacherNy eq 0}">
					<span class="mr-2 d-none d-lg-inline text-gray-600 small">
						<font id="roleS">학생</font>
					</span>
				</c:if>
				<c:if test="${ctcmProfile ne null}">
					<img class="img-profile rounded-circle" width="35px" height="35px" src="/resources/uploaded/${ctcsSeq }/${ctcmSeq}/${ctcmProfile}" alt="/resources/uploaded/common/profile2.png">
				</c:if>
				<c:if test="${empty ctcmProfile}">
					<img class="img-profile rounded-circle" width="35px" height="35px" src="/resources/uploaded/common/profile2.png">
				</c:if>
			</a> <!-- Dropdown - User Information -->
			<div class="dropdown-menu dropdown-menu-right shadow animated--grow-in" aria-labelledby="userDropdown">
				<a class="dropdown-item" href="/classMemberView">
					<i class="fas fa-user fa-sm fa-fw mr-2 text-gray-400"></i>&nbsp;&nbsp;클래스 정보
				</a>
				<a class="dropdown-item" href="/classList">
					<i class="fas fa-list fa-sm fa-fw mr-2 text-gray-400"></i>&nbsp;&nbsp;내 클래스
				</a>
				<div class="dropdown-divider"></div>
				<c:if test="${not empty sessSeq}">
					<a class="dropdown-item" id="btnLogout" style="cursor: pointer;">
						<i class="fas fa-sign-out-alt fa-sm fa-fw mr-2 text-gray-400"></i>&nbsp;&nbsp;로그아웃
					</a>
				</c:if>
			</div></li>
	</ul>


</nav>

<input type="hidden" value="${ctcmSeq }" id="ctcmSeqNav" />
<input type="hidden" value="${ctcsSeq }" id="ctcsSeqNav" />
<!-- JavaScript Bundle with Popper -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/js/bootstrap.bundle.min.js" integrity="sha384-pprn3073KE6tl6bjs2QrFaJGz5/SUsLqktiwsUTF55Jfv3qYSDhgCecCxMW52nD2" crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/stomp.js/2.3.3/stomp.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/sockjs-client/1.6.1/sockjs.min.js" integrity="sha512-1QvjE7BtotQjkq8PxLeF6P46gEpBRXuskzIVgjFpekzFVF4yjRgrQvTG1MTOJ3yQgvTteKAcO7DSZI92+u/yZw==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script>
	$(function() {

		var sock = new SockJS("/ctChatServer");
		var client = Stomp.over(sock);
		var ctcsSeq = $("#ctcsSeqNav").val();
		var ctcmSeq = $("#ctcmSeqNav").val();
		var params = {
			ctcsSeq : ctcsSeq,
			myId : ctcmSeq
		}; //메세지 갯수 세기위한 파라미터

		getMsgCount(params);

		client.connect({}, function() {
			console.log("header stomp connected")
			client.subscribe('/sub/topic/' + ctcsSeq + "/" + ctcmSeq, function(
					msg) {
				var data = JSON.parse(msg.body)
				//메세지 알람
				$("#chatAlarm").popover("dispose")
				$("#chatAlarm").popover({
					trigger : 'manual',
					animation : true,
					content : data.ctmgSender + "님이 채팅을 보냈습니다.",
					sanitize : true
				});
				$("#chatAlarm").popover('show');
				setTimeout(function() {
					$("#chatAlarm").popover('hide');
				}, 1300);

				getMsgCount(params); //메세지가 오면 받은 메세지 수 갱신

			})
		})

	})

	function getMsgCount(params) { //자신에게 온 메세지 갯수 가져오기
		//파라미터를 아작스로 보냄
		$.ajax({
			type : "POST",
			url : "/getMsgCount",
			data : JSON.stringify(params),
			contentType : "application/json; charset=UTF-8",
			dataType : "json",
			success : function(res) {
				$("#msgCount").html(res);
			},
			error : function() {
				alert("통신실패");
			}
		})
	}
</script>