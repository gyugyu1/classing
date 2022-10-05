<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>

		<div class="card shadow mb-4">
			<!-- <div class="rightbar"> -->
			<form action="" id="homeworkSubmit" name="homeworkSubmit" method="post">
				<input type="hidden" id="cthpWriter" name="cthpWriter" value="${ctcmSeq}">
				<input type="hidden" id="cthsSeq" name="cthsSeq" value="<c:out value="${vo.cthsSeq}"/>">
				<input type="hidden" id="cthpSeq" name="cthpSeq" value="<c:out value="${vo.cthpSeq}"/>">
				<div class="container_base">
					<div class="title">내 과제</div>
				</div>
				<div class="container_base">
					<div class="title_hw">
						<div>마감일시</div>
					</div>
					<div><c:out value="${item.cthpEndDateTime}"/></div>
					<c:if test="${itemSubmit.cthsSeq eq null}"><span class="badge bg-danger">제출 전</span></c:if>
					<c:if test="${itemSubmit.cthsSeq ne null}"><span class="badge bg-primary">제출 완료</span></c:if>
					<c:if test="${itemSubmit.cthsScore ne null}"><span class="badge bg-success">채점완료</span></c:if>
					<%-- <c:if test="${itemSubmit.cthsScore}"><span class="badge bg-secondary">기간만료</span></c:if> --%>
				</div>
				<%-- <div class="container_base">
				<div class="mb-1"><input type="text" class="form-control" id="cthsTitle" name="cthsTitle" placeholder="제목입력" value="<c:out value="${itemSubmit.cthsTitle}"/>"/></div>
				<textarea class="form-control mb-1" id="cthsDesc" name="cthsDesc" rows="3" placeholder="내용입력"><c:out value="${itemSubmit.cthsDesc}"/></textarea>
				<div class="input-group">
				  <input type="file" class="form-control" id="inputGroupFile04" aria-describedby="inputGroupFileAddon04" aria-label="Upload">
				  <button class="btn btn-outline-secondary" type="button" id="inputGroupFileAddon04">Button</button>
				</div>
				</div> --%>
				<div class="container_base">
					<div class="title_hw">
						<div>채점 현황</div>
					</div>
					<div>
						<c:if test="${itemSubmit.cthsScore ne null}">채점이 완료되었습니다. <p style="font-size: 20px; color: blue; display: inline; margin-left: 20px; margin-right: 10px;"><c:out value="${itemSubmit.cthsScore}"/></p>점</c:if>
						<c:if test="${itemSubmit.cthsScore eq null}"><div>아직 채점 전 입니다.</div></c:if>
					</div>	
					<c:if test="${itemSubmit.cthsSeq ne null && itemSubmit.cthsScore ne null}"><button type="button" class="btn btn-light" style="font-size: 15px; margin-top: 10px;" onclick="location.href='javascript:goHomeworkSubmitStu(<c:out value="${itemSubmit.cthsSeq}"/>)'">제출한 과제 확인</button></c:if>
				</div>
				
				<div class="container_base">
					<div class="rightbar_button">
						<c:if test="${itemSubmit.cthsSeq eq null}"><button type="button" class="basic_button w-50" onclick="location.href='javascript:goHomeworkSubmitUpload()'">과제 등록</button></c:if>
						<c:if test="${itemSubmit.cthsSeq ne null && itemSubmit.cthsScore eq null}"><button type="button" class="basic_button w-50" onclick="location.href='javascript:goHomeworkSubmitStuEdit(<c:out value="${itemSubmit.cthsSeq}"/>)'">과제 수정</button>
						<button type="button" class="btn btn-primary w-50" style="border-radius: 9px;" onclick="location.href='javascript:goHomeworkSubmitStu(<c:out value="${itemSubmit.cthsSeq}"/>)'">제출한 과제 확인</button>
						</c:if>
						<c:if test="${itemSubmit.cthsScore ne null}">채점완료된 과제는 수정할 수 없습니다. </c:if>
					</div>
				</div>
			<!-- </div> -->
		</form>	
		</div>
	



