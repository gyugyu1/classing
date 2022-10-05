<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="rb" uri="http://www.springframework.org/tags"%>

<!doctype html>
<html lang="ko">
<head>
<!-- Required meta tags -->
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<!-- Bootstrap CSS -->
<link href="/resources/common/bootstrap/bootstrap-5.1.3-dist/css/bootstrap.min.css" rel="stylesheet">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.1.1/css/all.min.css" />
<!-- <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous"> -->

<!-- Custom fonts for this template-->
<link href="/resources/common/vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
<link href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i" rel="stylesheet">

<!-- Custom styles for this template-->
<link href="/resources/common/css/sb-admin-2.min.css" rel="stylesheet">
<link href="/resources/user/css/classCommon.css" rel="stylesheet">
<link href="/resources/user/css/main_teacher.css" rel="stylesheet" type="text/css">
<link rel="shortcut icon" href="https://ifh.cc/g/nj4CTw.png" type="image/x-icon" />
<title id="ctl00_headerTitle">CLASSING</title>
</head>
<body>
	<%@ include file="/WEB-INF/views/member/include/main_header.jsp"%><!-- header -->

	<div class="container" id="main">
		<div class="row">
			<div class="col-md-7">
				<img src="/resources/user/image/main_bg.png" class="w-100" id="main_bg">

				<div id="classNotice" style="cursor: default;">
					<h5 style="font-weight: bold; margin-bottom: 30px;">내 클래스 공지 알림</h5>
					<c:choose>
						<c:when test="${fn:length(list) eq 0}">공지가 없습니다!</c:when>
						<c:otherwise>
							<c:forEach items="${listNotice}" var="itemPost" varStatus="status">
								<c:if test="${sessSeq eq itemPost.mmSeq}">
									<c:forEach items="${list}" var="item" varStatus="status">
										<c:if test="${item.ctcsSeq eq itemPost.ctcsSeq}">
											<div class="mb-2">
												<span style="font-size: 20px; font-weight: bold; padding-top: 25px;">
													<c:out value="${item.ctcsName}" />
												</span>
											</div>
										</c:if>
									</c:forEach>
									<div>
										<span class="badge bg-info text-light mb-3">공지</span>
										<c:out value="${itemPost.ctptTitle}" />
										<p id="content">
											<c:out value="${itemPost.ctptContent}" />
										</p>
										<p id="date">
											<fmt:formatDate value="${itemPost.regDateTime}" pattern="yyyy-MM-dd HH:mm:ss" />
										</p>
										<hr style="color: gray;">
									</div>
								</c:if>
							</c:forEach>
						</c:otherwise>
					</c:choose>

				</div>
			</div>
			<div class="col-md-5">
				<form id="mainclassList" name="mainclassList" method="post" action="">
					<input type="hidden" id="ctcsSeq" name="ctcsSeq">
					<input type="hidden" id="mmSeq" name="mmSeq">
					<div id="classList" style="cursor: default;">
						<h5 style="font-weight: bold; margin-bottom: 30px; cursor: default;">클래스 바로가기</h5>
						<c:choose>
							<c:when test="${fn:length(list) eq 0}">
								<p>클래스가 없습니다!</p>
							</c:when>
							<c:otherwise>
								<c:forEach items="${list}" var="item" varStatus="status">
									<div class="class" style="cursor: pointer;" onclick="location.href='javascript:goClass(<c:out value="${item.ctcsSeq}"/>)'">
										<img src="/resources/user/image/classLogo.png" class="" width="50" height="50" style="border-radius: 7px; float: left">
										<span class="" id="date" style="margin-left: 13px;">
											<c:out value="${item.ctcsYear}" />
										</span>
										<br>
										<span style="margin-left: 12px;">
											<c:out value="${item.ctcsName}" />
										</span>
									</div>
									<hr>
								</c:forEach>
							</c:otherwise>
						</c:choose>


						<div>
							<button type="button" class="btn btn-outline-secondary btn-lg w-100" id="btn-add" data-bs-toggle="modal" data-bs-target="#addressModal">
								<i class="fa-solid fa-lock"></i> 클래스 코드로 가입하기
							</button>
						</div>
						<c:if test="${sessTeacher eq 1}">
							<div>
								<button type="button" class="btn btn-outline-success btn-lg w-100" id="btn-open" onclick="location.href='/classForm2'">
									<i class="fa-solid fa-plus"></i> 클래스 생성하기
								</button>
							</div>
						</c:if>
					</div>
				</form>

			</div>
			<div class="col-md-12">
				<div id="schInfo">
					<div class="mb-4">
						<img src="/resources/user/image/schIcon.png" width="40" height="40" style="border-radius: 7px;">
						<span style="font-size: 20px; font-weight: bold; margin-left: 20px;">사조 초등학교</span>
					</div>
					<p style="margin-left: 10px; font-weight: bold;">공지사항</p>
					<div id="schNotice">아직 공지사항이 없습니다!</div>
					<p style="margin-left: 10px; font-weight: bold;">오늘의 급식</p>
					<div id="schFood">
						<p>
							<b>4월 26일</b>
						</p>
						<p>
							친환경강황밥(강황분말)<br>부대찌개<br>새우가스+타르타르소스<br>친환경사과<br>김치
						</p>
					</div>

				</div>
			</div>
			<!-- 모달 -->
			<div class="modal fade" id="addressModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
				<form action="/classCodeSearch" id="codeModal" name="codeModal" method="post">
					<input type="hidden" id="ctcmName" name="ctcmName" value="<c:out value="${sessName}"/>">
					<input type="hidden" id="mmSeq" name="mmSeq" value="<c:out value="${sessSeq}"/>">
					<div class="modal-dialog">
						<div class="modal-content">
							<div class="modal-header">
								<h5 class="modal-title" id="exampleModalLabel">클래스 가입</h5>
								<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
							</div>
							<div class="modal-body">
								<h3 style="text-align: center">코드입력</h3>
								<br>
								<br>
								<div class="input-group mb-3">
									<input class="form-control form-control-lg" type="text" id="ctcsCode" name="ctcsCode" placeholder="코드 6자리 입력" value="KIAVUX">
									<br>
								</div>
							</div>
							<div class="modal-footer">
								<button type="button" class="btn btn-secondary" data-bs-dismiss="modal">닫기</button>
								<button type="submit" class="btn btn-primary" id="btn-submit">확인</button>
							</div>
						</div>
					</div>
				</form>
			</div>

		</div>
	</div>
	<%@ include file="/WEB-INF/views/member/include/main_footer.jsp"%><!-- footer -->

	<!-- 학교식단불러오기 -->
	<script>
		$(document)
				.ready(
						function() {
							var url = 'https://open.neis.go.kr/hub/mealServiceDietInfo?'
									+ ' MMEAL_SC_CODE=668f94cb39474be8bb1bfe12ecc816b7&Type=json&pIndex=1&pSize=100';
							var param = '';
							ajaxCallApiTest(url, param, ApiCallBack);
						});

		function ajaxCallApiTest(url, param, callback) {

			$
					.ajax({
						url : url,
						async : true,
						type : "POST",
						data : param,
						dataType : 'json',
						success : callback,
						error : function(request, textStatus) {
							var format = new OpenLayers.Format.WESDescribeFeatureType();
							var doc = request.responseXML;
							var describeFeatureType = format.read(doc);
							alert(" describeFeatureType = "
									+ describeFeatureType + " textStatus = "
									+ textStatus);
						}
					});
		}
	</script>

	<script>
		function ApiCallBack(json) {

			if (json.schoolInfo != null) {

				document
						.write("<table style='border:1px solid #b5b5b5;padding:1px; margin:1px;'>");

				document.write("<tr>");

				$
						.each(
								json.schoolInfo[1].row[0],
								function(key, state) {

									document
											.write("<td style='color: black;background-color:#CEFBC9'>");
									document.write(key);
									document.write("</td>");

								});

				document.write("</tr>");

				for (var i = 0; i < 5; i++) {
					document.write("<tr>");
					$
							.each(
									json.schoolInfo[1].row[i],
									function(key, state) {
										document
												.write("<td style='color:black;background-color:#F0F8FF'>");
										document
												.write(eval("json.schoolInfo[1].row["
														+ i + "]." + key)
														+ " <br> ");
										document.write("</td>");
									});

					document.write("</tr>");
				}

				document.write("</table>");
			}
		}
	</script>
	<!-- 학교식단 end -->


	<!-- Bootstrap core JavaScript-->
	<script src="/resources/common/vendor/jquery/jquery.min.js"></script>
	<script src="/resources/common/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

	<!-- Core plugin JavaScript-->
	<script src="/resources/common/vendor/jquery-easing/jquery.easing.min.js"></script>

	<!-- Custom scripts for all pages-->
	<script src="/resources/common/js/sb-admin-2.min.js"></script>
	<script src="/resources/common/js/validation.js"></script>
	<script type="text/javascript">
		goClass = function(seq) {
			$("#ctcsSeq").val(seq);
			$("#mainclassList").attr("action", "/classMain");
			$("#mainclassList").submit();
		}

		$("#btn-submit").on("click", function() {

			if (!checkNull($("#ctcsCode"), $("#ctcsCode").val(), "코드를 입력하세요."))
				return false;

		});
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
	</script>



	<!-- Option 1: Bootstrap Bundle with Popper -->
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
	<script src="/resources/common/bootstrap/bootstrap-5.1.3-dist/js/bootstrap.bundle.min.js"></script>

	<!-- Option 2: Separate Popper and Bootstrap JS -->
	<!-- 
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.10.2/dist/umd/popper.min.js" integrity="sha384-7+zCNj/IqJ95wo16oMtfsKbZ9ccEh31eOz1HGyDuCQ6wgnyJNSYdrPa03rtR1zdB" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.min.js" integrity="sha384-QJHtvGhmr9XOIpI6YVutG+2QOK9T+ZnN4kzFN1RtK3zEFEIsxhlmWl5/YESvpZ13" crossorigin="anonymous"></script>
 -->
</body>
</html>