package com.cacao.classting.classroom;

import java.util.HashMap;
import java.util.List;
import java.util.Map;



public interface ClassRoomService {
	
	//adminClass

	public List<ClassRoom> selectListClass(ClassRoomVo vo) throws Exception;
	public List<ClassRoom> selectListMemberUploaded(ClassRoomVo vo) throws Exception;
	public int insertClass(ClassRoom dto) throws Exception;

	public int deleteClass(ClassRoomVo vo) throws Exception;

	public ClassRoom selectOneClass(ClassRoomVo vo) throws Exception;
	
	public int selectOneCount(ClassRoomVo vo) throws Exception;
	
	int deleteClassMulti(ClassRoomVo vo) throws Exception;

	//classMemberView
	public int updateClass(ClassRoom dto) throws Exception;
	
	public ClassRoom selectOneMemberClass(ClassRoomVo vo) throws Exception;
	public int deleteClassMember(ClassRoomVo vo) throws Exception;
	public ClassRoom selectOneClassMemberUploaded(ClassRoomVo vo) throws Exception;

	public int deleteMemberForcely(ClassRoom dto) throws Exception;
	// 조회수 
	public int hitUpdate(ClassRoom dto) throws Exception;

//	클래스 내 정보
	public ClassRoom selectOneSidebar(ClassRoomVo vo) throws Exception;
	public ClassRoom selectOneClassInfo(ClassRoomVo vo) throws Exception;
	public ClassRoom selectOneClassPost(ClassRoomVo vo) throws Exception;
	public ClassRoom selectOneClassHomework(ClassRoomVo vo) throws Exception;
	public ClassRoom selectOneHomeworkSubmit(ClassRoomVo vo) throws Exception;
	public ClassRoom selectOneHomeworkSubmitStudent(ClassRoomVo vo) throws Exception;
	public int selectOneMemberCount(ClassRoomVo vo) throws Exception;
	public int selectOneSubmitCount(ClassRoomVo vo) throws Exception;
	public List<ClassRoom> selectListPost(ClassRoomVo vo) throws Exception;
	public List<ClassRoom> selectListStorage(ClassRoomVo vo) throws Exception;
	public List<ClassRoom> selectListReserv(ClassRoomVo vo) throws Exception;
	public List<ClassRoom> selectListHomework(ClassRoomVo vo) throws Exception;
	public List<ClassRoom> selectListHomeworkSubmit(ClassRoomVo vo) throws Exception;
	public List<ClassRoom> selectListClassMember(ClassRoomVo vo) throws Exception;
	public List<ClassRoom> selectCategory(ClassRoomVo vo) throws Exception;
	public int updateClassMember(ClassRoomVo vo) throws Exception;
	
	public int updateClassMemberDel(ClassRoom dto) throws Exception;
	
//	댓글리스트
	public List<ClassRoom> selectListReply(ClassRoomVo vo) throws Exception;
	public List<ClassRoom> selectListHomeworkReply(ClassRoomVo vo) throws Exception;
	public List<ClassRoom> selectListHomeworkSubmitReply(ClassRoomVo vo) throws Exception;
	
//	댓글삽입
	public int insertReply(ClassRoom dto) throws Exception;
	public int insertHomeworkReply(ClassRoom dto) throws Exception;
	public int insertHomeworkSubmitReply(ClassRoom dto) throws Exception;
	
//	댓글삭제(update)
	public int updateReplyUele(ClassRoom dto) throws Exception;
	public int updateHomeworkReplyUele(ClassRoom dto) throws Exception;
	public int updateHomeworkSubmitReplyUele(ClassRoom dto) throws Exception;
	
	
	public int insertHomeworkSubmit(ClassRoom dto) throws Exception;
	public int insertHomeworkPost(ClassRoom dto) throws Exception;
	public int insertPost(ClassRoom dto) throws Exception;
	public int updateHomeworkSubmitScore(ClassRoom dto) throws Exception;
	public int updateHomeworkSubmit(ClassRoom dto) throws Exception;
	
	public List<ClassRoom> homeworkSubmit(ClassRoom dto) throws Exception;
	public int insertUrl(ClassRoom dto) throws Exception;
	public ClassRoom selectOneClassPostUrl(ClassRoomVo vo) throws Exception;
	public List<ClassRoom> selectListClassPostUrl(ClassRoomVo vo) throws Exception;
	
//출석부
	public ClassRoom getClassId(ClassRoomVo vo) throws Exception;
	public int attendance(ClassRoom dto) throws Exception;
	public int today(ClassRoom dto) throws Exception;
	public List<ClassRoom> enterLog(Map<String, String> dates) throws Exception;
// 과제 리포트
	public List<ClassRoom> homeworkWriter(ClassRoom dto) throws Exception;
	public List<ClassRoom> scoreAvg(ClassRoomVo vo) throws Exception;
//게시글등록
	public int insertAddress(ClassRoom dto);
	public int deletePost(ClassRoomVo vo);
//채팅관련
	public List<ClassRoom> countMsg(HashMap<String,String> countMsg) throws Exception;
	
//좋아요 관련
	public int checkLike(ClassRoom dto) throws Exception;
	public int addLike(ClassRoom dto) throws Exception;
	public int countLike(ClassRoom dto) throws Exception;
	public int deleteLike(ClassRoom dto) throws Exception;
	
	
	
// api 호출 service
	public String getMenuData(String url) throws Exception;
}