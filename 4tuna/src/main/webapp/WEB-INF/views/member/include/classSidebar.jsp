<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="rb" uri="http://www.springframework.org/tags"%>

<ul class="navbar-nav sidebar sidebar-dark accordion" id="accordionSidebar">

	<!-- Sidebar - Brand -->
	<img src="/resources/common/image/header_logo.png" width="180px;" style="margin-left: 10px;" onclick="location.href='/main'">
	<!-- Divider -->
	<hr class="sidebar-divider my-0">
	<!-- Nav Item - Dashboard -->
	<li class="nav-item active">
		<div class="col-md-3 mt-4" id="classImg">
			<img src="/resources/user/image/classLogo.png" width="50" height="50" style="">
		</div>
		<div class="col-md-9 mt-4" id="classInfo">
			<span>
				<b><c:out value="${ctcsName}" /></b>
			</span>
			<p>
				<span>
					<c:out value="${ctcsYear}" />
				</span>
		</div>
	</li>
	<div class="d-flex justify-content-center w-100 mb-3">
		<button type="button" class="btn btn-lg mt-1" id="btn-add" onclick="location.href='/classInvitation'">
			<i class="fa-solid fa-user-plus"></i> 구성원 초대하기
		</button>
	</div>
	<!-- Divider -->
	<hr class="sidebar-divider">

	<!-- Nav Item - Pages Collapse Menu -->
	<div class="sidebar-heading" style="color: #828282;">전체 메뉴</div>
	<li class="nav-item"><a class="nav-link" href="/noticeBoard">
			<i class="fa-solid fa-bullhorn" style="color: #828282;"></i>
			<span>모든 공지</span>
		</a> <a class="nav-link" href="/member/class/teacher/homeworklist">
			<i class="fa-solid fa-pencil" style="color: #828282;"></i>
			<span>모든 과제</span>
		</a> <a class="nav-link" href="/chat">
			<i class="fa-solid fa-comment" style="color: #828282;"></i>
			<span>클래스 채팅</span>
		</a> <a class="nav-link" href="/zoomList">
			<i class="fa-solid fa-video" style="color: #828282;"></i>
			<span>실시간 수업</span>
		</a> <a class="nav-link" href="/member/class/common/classVideoList">
			<i class="fa-brands fa-youtube" style="color: #828282;"></i>
			<span>모든 영상</span>
		</a> <c:if test="${teacherNy eq 1}">
			<a class="nav-link" href="/member/class/teacher/homeworkreport">
				<i class="fa-solid fa-file-circle-check" style="color: #828282;"></i>
				<span>과제 리포트</span>
			</a>
		</c:if> <c:if test="${teacherNy eq 1}">
			<a class="nav-link" href="/member/class/teacher/attendance">
				<i class="fa-solid fa-school-circle-check" style="color: #828282;"></i>
				<span>출석부</span>
			</a>
		</c:if> <a class="nav-link" href="/classMemberList">
			<i class="fa-solid fa-users" style="color: #828282;"></i>
			<span>구성원</span>
		</a> <c:if test="${teacherNy eq 1}">
			<a class="nav-link" href="/classSetting">
				<i class="fa-solid fa-gear" style="color: #828282;"></i>
				<span>클래스 설정</span>
			</a>
		</c:if></li>

	<!-- Divider -->
	<hr class="sidebar-divider">
	<!-- Heading -->
	<div class="sidebar-heading" style="color: #828282;">나만 참여한 공간</div>
	<li class="nav-item"><a class="nav-link" href="/classStorage">
			<i class="fa-solid fa-file-pen" style="color: #828282;"></i>
			<span>예약 / 임시저장한 글</span>
		</a></li>

	<!-- Divider -->
	<hr class="sidebar-divider">

	<!-- Heading -->
	<div class="sidebar-heading" style="color: #828282;">모두를 위한 공간</div>
	<li class="nav-item">
		<c:forEach items="${categories}" var = "category">
			<a class="nav-link" href="/member/class/common/postlist?ctboSeq=${category.ctboSeq }&ctboName=${category.ctboName}">
				<i class="fas fa-fw fa-folder" style="color: #828282;"></i>
				<span><c:out value="${category.ctboName }"/></span>
			</a> 
		</c:forEach>
	</li>

	<!-- Divider -->
	<hr class="sidebar-divider d-none d-md-block">
</ul>
