package com.cacao.classting.classroom;


import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.fasterxml.jackson.databind.ser.std.SqlTimeSerializer;







@Repository
public class ClassRoomDao {
	
	@Inject
	@Resource(name = "sqlSession")
	private SqlSession sqlSession;
	
	private static String namespace = "com.cacao.classting.classroom.ClassRoomMpp";
	//adminClass

	public List<ClassRoom> selectListClass(ClassRoomVo vo) { List<ClassRoom> list = sqlSession.selectList(namespace + ".selectListClass",vo); return list;}

	public List<ClassRoom> selectListMemberUploaded(ClassRoomVo vo) { List<ClassRoom> list = sqlSession.selectList(namespace + ".selectListMemberUploaded",vo); return list;}

	public ClassRoom selectOneClass(ClassRoomVo vo) { return sqlSession.selectOne(namespace + ".selectOneClass", vo);}

	public int deleteClass(ClassRoomVo vo) {return sqlSession.update(namespace + ".deleteClass", vo);}
	
	public int selectOneCount(ClassRoomVo vo) {return sqlSession.selectOne(namespace + ".selectOneCount", vo);}

	public int deleteClassMulti(ClassRoomVo vo) {return sqlSession.update(namespace + ".deleteClassMulti", vo);}


	//classMemberView
	public int updateClass(ClassRoom dto)  {return sqlSession.update(namespace + ".updateClass", dto);}

	public ClassRoom selectOneClassMemberUploaded(ClassRoomVo vo) {return sqlSession.selectOne(namespace + ".selectOneClassMemberUploaded", vo);}
	
	public ClassRoom selectOneMemberClass(ClassRoomVo vo)  { return sqlSession.selectOne(namespace + ".selectOneMemberClass", vo);}
	public int deleteClassMember(ClassRoomVo vo) {return sqlSession.update(namespace + ".deleteClassMember", vo);}

	public int deleteMemberForcely(ClassRoom dto) {return sqlSession.update(namespace + ".DeleteMemberForcely", dto);}

//	class
	public ClassRoom selectOneSidebar(ClassRoomVo vo) {return sqlSession.selectOne(namespace +".selectOneSidebar", vo);}
	public ClassRoom selectOneClassInfo(ClassRoomVo vo) {return sqlSession.selectOne(namespace +".selectOneClassInfo", vo);}
	public ClassRoom selectOneClassPost(ClassRoomVo vo) {return sqlSession.selectOne(namespace +".selectOneClassPost", vo);}
	public ClassRoom selectOneClassHomework(ClassRoomVo vo) {return sqlSession.selectOne(namespace +".selectOneClassHomework", vo);}
	public ClassRoom selectOneHomeworkSubmit(ClassRoomVo vo) {return sqlSession.selectOne(namespace +".selectOneHomeworkSubmit", vo);}
	public ClassRoom selectOneHomeworkSubmitStudent(ClassRoomVo vo) {return sqlSession.selectOne(namespace +".selectOneHomeworkSubmitStudent", vo);}
	public int selectOneMemberCount(ClassRoomVo vo) {return sqlSession.selectOne(namespace +".selectOneMemberCount", vo);}
	public int selectOneSubmitCount(ClassRoomVo vo) {return sqlSession.selectOne(namespace +".selectOneSubmitCount", vo);}
	public List<ClassRoom> selectListPost(ClassRoomVo vo) { List<ClassRoom> list = sqlSession.selectList(namespace + ".selectListPost",vo); return list;}
	public List<ClassRoom> selectListStorage(ClassRoomVo vo) { List<ClassRoom> list = sqlSession.selectList(namespace + ".selectListStorage",vo); return list;}
	public List<ClassRoom> selectListHomework(ClassRoomVo vo) { List<ClassRoom> list = sqlSession.selectList(namespace + ".selectListHomework",vo); return list;}
	public List<ClassRoom> selectListHomeworkSubmit(ClassRoomVo vo) { List<ClassRoom> list = sqlSession.selectList(namespace + ".selectListHomeworkSubmit",vo); return list;}
	public List<ClassRoom> selectListClassMember(ClassRoomVo vo) { List<ClassRoom> list = sqlSession.selectList(namespace + ".selectListClassMember",vo); return list;}
	public List<ClassRoom> selectListClassPostUrl(ClassRoomVo vo) { List<ClassRoom> list = sqlSession.selectList(namespace + ".selectListClassPostUrl",vo); return list;}
	public List<ClassRoom> selectCategory(ClassRoomVo vo) { List<ClassRoom> list = sqlSession.selectList(namespace + ".selectCategory",vo); return list;}
	public int updateClassMember(ClassRoomVo vo) {return sqlSession.update(namespace + ".updateClassMember", vo);}
	public int updateUploaded(ClassRoom dto) {return sqlSession.update(namespace +".updateUploaded", dto);}
	public int updateClassMemberDel(ClassRoom dto)  {return sqlSession.update(namespace + ".updateClassMemberDel", dto);}
//	댓글리스트
	public List<ClassRoom> selectListReply(ClassRoomVo vo) { List<ClassRoom> list = sqlSession.selectList(namespace + ".selectListReply",vo); return list;}
	public List<ClassRoom> selectListHomeworkReply(ClassRoomVo vo) { List<ClassRoom> list = sqlSession.selectList(namespace + ".selectListHomeworkReply",vo); return list;}
	public List<ClassRoom> selectListHomeworkSubmitReply(ClassRoomVo vo) { List<ClassRoom> list = sqlSession.selectList(namespace + ".selectListHomeworkSubmitReply",vo); return list;}
	
//	댓글삽입
	public int insertReply(ClassRoom dto) {return sqlSession.insert(namespace+ ".insertReply", dto);}
	public int insertHomeworkReply(ClassRoom dto) {return sqlSession.insert(namespace+ ".insertHomeworkReply", dto);}
	public int insertHomeworkSubmitReply(ClassRoom dto) {return sqlSession.insert(namespace+ ".insertHomeworkSubmitReply", dto);}
	
//	댓글삭제(update)
	public int updateReplyUele(ClassRoom dto)  {return sqlSession.update(namespace + ".updateReplyUele", dto);}
	public int updateHomeworkReplyUele(ClassRoom dto)  {return sqlSession.update(namespace + ".updateHomeworkReplyUele", dto);}
	public int updateHomeworkSubmitReplyUele(ClassRoom dto)  {return sqlSession.update(namespace + ".updateHomeworkSubmitReplyUele", dto);}
	
	
	
	public int insertHomeworkSubmit(ClassRoom dto) {return sqlSession.insert(namespace+ ".insertHomeworkSubmit", dto);}
	public int insertHomeworkPost(ClassRoom dto) {return sqlSession.insert(namespace+ ".insertHomeworkPost", dto);}
	
	public int updateHomeworkSubmitScore(ClassRoom dto)  {return sqlSession.update(namespace + ".updateHomeworkSubmitScore", dto);}
	public int updateHomeworkSubmit(ClassRoom dto)  {return sqlSession.update(namespace + ".updateHomeworkSubmit", dto);}
	public ClassRoom selectOneClassPostUrl(ClassRoomVo vo) {return sqlSession.selectOne(namespace +".selectOneClassPostUrl", vo);}
	public int insertUrl(ClassRoom dto) {return sqlSession.insert(namespace+ ".insertUrl", dto);}
//��ȸ��
	
	public int hitUpdate(ClassRoom dto) {return sqlSession.update(namespace + ".hitUpdate",dto);}
	
	
	// 출석부
	public ClassRoom getClassId(ClassRoomVo vo) {
		return sqlSession.selectOne(namespace+".getClassId",vo);
		
	}
	
	public int attendance(ClassRoom dto) {
		return sqlSession.insert(namespace + ".attendance",dto);
		
	}
	
	public int today(ClassRoom dto){
		return sqlSession.selectOne(namespace+ ".today",dto);
		
	}
	
	public List<ClassRoom> enterLog(Map<String, String> dates){
		return sqlSession.selectList(namespace + ".enterLog" , dates );
	}
	public List<ClassRoom> homeworkMember(ClassRoom dto) {
		return sqlSession.selectList(namespace + ".homeworkMember" , dto);
	}

	//과제리포트
	
	public List<ClassRoom> homeworkWriter(ClassRoom dto){
		return sqlSession.selectList(namespace + ".homeworkWriter" , dto);
	}
	
	public List<ClassRoom> scoreAvg(ClassRoomVo vo){
		return sqlSession.selectList(namespace + ".scoreAvg" , vo);
	}
//게시글
	public int insertPost(ClassRoom dto) {
		return sqlSession.insert(namespace+ ".insertPost", dto);
	}
	public int deletePost(ClassRoomVo vo) {
		return sqlSession.delete(namespace + ".deletePost", vo);
	}
	public int insertAddress(ClassRoom dto) {
		return sqlSession.insert(namespace + ".insertAddress", dto);
	}
// 게시글	예약 view
	public List<ClassRoom> selectListReserv(ClassRoomVo vo) {
		List<ClassRoom> list = sqlSession.selectList(namespace + ".selectListReserv",vo);
		return list;
		}
	public List<ClassRoom> homeworkSubmit(ClassRoom dto){
		return sqlSession.selectList(namespace + ".homeworkSubmit",dto);
	}
	
//채팅관련
	public List<ClassRoom> countMsg(HashMap<String, String> countMsg) {return sqlSession.selectList(namespace + ".countMsg",countMsg);}

	
//좋아요 관련
	public int checkLike(ClassRoom dto){return sqlSession.selectOne(namespace + ".checkLike",dto);}
	public int addLike(ClassRoom dto) {return sqlSession.insert(namespace + ".addLike",dto);}
	public int countLike(ClassRoom dto) {return sqlSession.selectOne(namespace + ".countLike",dto);}
	public int deleteLike(ClassRoom dto) {return sqlSession.delete(namespace + ".deleteLike",dto);}
	
	}