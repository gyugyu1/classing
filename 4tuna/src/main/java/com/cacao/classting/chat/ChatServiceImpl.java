package com.cacao.classting.chat;


import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class ChatServiceImpl implements ChatService{

	@Autowired
	ChatDao dao;

	@Override
	public int insertMsgInfo(Chat chat) throws Exception {
		// TODO Auto-generated method stub
		return dao.insertMsgInfo(chat);
	}

	@Override
	public List<Chat> selectMsg(Map<String, Object> chatMap) throws Exception {
		return dao.selectMsg(chatMap);
	}

	@Override
	public int readNyUpdate(Map<String, Object> chatMap) throws Exception {
		return dao.readNyUpdate(chatMap);
	}

	@Override
	public int countMsgOne(Map<String, String> chatMap) throws Exception {
		return dao.countMsgOne(chatMap);
	}

	@Override
	public int countMsg(Map<String, String> chatMap) throws Exception {
		return dao.countMsg(chatMap);
	}





	
	
	

}
