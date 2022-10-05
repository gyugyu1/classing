<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>

<div class="col-xl-4 col-lg-4">
	<div class="container_title shadow mb-4">
		<!-- Card Header - Dropdown -->
		<div class="header mb-5">실시간 수업</div>
		<button type="button" class="btn btn-lg mt-1 w-100 p-2" id="btn-add">
			<i class="fa-solid fa-video"></i> Zoom 연동하기
		</button>
		<c:forEach items="${memberList}" var="itemMemberList" varStatus="status">
		<c:if test="${itemMemberList.ctcmTeacherNy eq 1}">
		<div class="title_hw">
			<div class="col-md-2 col-lg-2" id="classImg">
				<img src="/resources/common/image/profile2.png" width="40" height="40" style="border-radius: 7px;">
			</div>
			<div class="col-md-10 col-lg-10" id="classInfo">
				<span><b><c:out value="${itemMemberList.ctcmName}"/></b></span><p><span style="color: #c8c8c8; font-size: 14px;">선셍님</span>
			</div>
		</div>
		</c:if>
		</c:forEach>
		
		<hr>
		<c:forEach items="${memberList}" var="itemMemberList" varStatus="status">
		<c:if test="${itemMemberList.ctcmTeacherNy eq 0}">
		<div class="title_hw">
			<div class="col-md-2 col-lg-2" id="classImg">
				<img src="/resources/common/image/profile2.png" width="40" height="40" style="border-radius: 7px;">
			</div>
			<div class="col-md-10 col-lg-10" id="classInfo">
				<span><b><c:out value="${itemMemberList.ctcmName}"/></b></span><p><span style="color: #c8c8c8; font-size: 14px;">학생</span>
			</div>
		</div>
		</c:if>
		</c:forEach>
		
	</div>
</div>