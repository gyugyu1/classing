package com.cacao.classting.chat;


import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.cacao.classting.classroom.ClassRoom;

@Repository
public class ChatDao {
	
	@Inject
	@Resource(name = "sqlSession")
	private SqlSession sqlSession;
	private static String namespace = "com.cacao.classting.chat.ChatMpp";
	public int insertMsgInfo(Chat chat) {return sqlSession.insert(namespace+ ".insertMsgInfo", chat);}
	public List<Chat> selectMsg(Map<String, Object> chatMap){return sqlSession.selectList(namespace + ".selectMsg", chatMap);}
	public int readNyUpdate(Map<String,Object> chatMap) {return sqlSession.update(namespace + ".readNyUpdate", chatMap);}
	public int countMsgOne(Map<String,String> chatMap) {return sqlSession.selectOne(namespace + ".countMsgOne",chatMap);}
	public int countMsg(Map<String,String> chatMap) {return sqlSession.selectOne(namespace+".countMsg",chatMap);}
}
	