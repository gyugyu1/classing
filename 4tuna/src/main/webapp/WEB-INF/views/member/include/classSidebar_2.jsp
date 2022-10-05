<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>

 <ul class="navbar-nav sidebar sidebar-dark accordion" id="accordionSidebar">

            <!-- Sidebar - Brand -->
		    <img src="/resources/common/image/header_logo.png"  width="180px;" style="margin-left: 10px;" onclick="location.href='/main'">

            <!-- Divider -->
            <hr class="sidebar-divider my-0">

            <!-- Nav Item - Dashboard -->
            <li class="nav-item active" onclick="location.href='/classMain'">
            	<div class="col-md-3 mt-4" id="classImg"><img src="/resources/user/image/a3.jpg"  width="50" height="50" style="border-radius: 7px; "></div>
				<div class="col-md-9 mt-4" id="classInfo"><span><b>4조</b></span><p><span>2022</span></div>
            </li>
			<div class="d-flex justify-content-center w-100"><button type="button" class="btn btn-lg mt-1 p-2" id="btn-add" onclick="location.href='/classInvitation'">
				<i class="fa-solid fa-user-plus"></i>구성원 초대하기</button>
			</div>
            <!-- Divider -->
            <hr class="sidebar-divider">

            <!-- Nav Item - Pages Collapse Menu -->
            <div class="sidebar-heading" style="color: #828282;">전체 메뉴</div>
            <li class="nav-item">
                <a class="nav-link" href="/noticeBoard"><i class="fa-solid fa-bullhorn" style="color: #828282;"></i> <span>모든 공지</span></a>
                <a class="nav-link" href="/member/class/teacher/homeworklist"><i class="fa-solid fa-pencil" style="color: #828282;"></i> <span>모든 과제</span></a>
                <a class="nav-link" href="/member/class/teacher/attendance"><i class="fa-solid fa-school-circle-check" style="color: #828282;"></i> <span>출석부</span></a>
                <a class="nav-link" href="/classMemberList"><i class="fa-solid fa-users" style="color: #828282;"></i> <span>구성원</span></a>
            </li>

            <!-- Divider --> 
            <hr class="sidebar-divider">
            <!-- Heading -->
            <div class="sidebar-heading" style="color: #828282;">나만 참여한 공간</div>
            <li class="nav-item">
                <a class="nav-link" href="/classStorage"><i class="fa-solid fa-file-pen" style="color: #828282;"></i> <span>예약 / 임시저장한 글</span></a>
            </li>

            <!-- Divider -->
            <hr class="sidebar-divider">

            <!-- Heading -->
            <div class="sidebar-heading" style="color: #828282;">내가 참여한 공간</div>

            <!-- Nav Item - Pages Collapse Menu -->
            <li class="nav-item">
                <a class="nav-link collapsed" href="#" data-toggle="collapse" data-target="#collapsePages"
                    aria-expanded="true" aria-controls="collapsePages">
                    <i class="fas fa-fw fa-folder" style="color: #828282;"></i>
                    <span>모두를 위한 공간</span>
                </a>
                <div id="collapsePages" class="collapse" aria-labelledby="headingPages" data-parent="#accordionSidebar">
                    <div class="bg-white py-2 collapse-inner rounded">
                        <a class="collapse-item" href="/member/class/common/postlist">자유 공간</a>
                        <a class="collapse-item" href="/member/class/common/postdatalist">학습 자료</a>
                        <a class="collapse-item" href="/member/class/common/postpicturelist">활동 사진</a>
                    </div>
                </div>
            </li>

            <!-- Divider -->
            <hr class="sidebar-divider d-none d-md-block">
        </ul>
