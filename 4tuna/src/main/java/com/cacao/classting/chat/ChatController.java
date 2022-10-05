package com.cacao.classting.chat;

import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.messaging.handler.annotation.MessageMapping;
import org.springframework.messaging.simp.SimpMessagingTemplate;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
public class ChatController {
	@Autowired
	private SimpMessagingTemplate simpMessagingTempleate;	
	@Autowired
	private ChatService service;
	private static final Logger logger = LoggerFactory.getLogger(ChatController.class);
	
	@MessageMapping("/topic/public") // 클라이언트에서 메세지를 보내는 주소.
	public void message(Chat chat) throws Exception {
		String classId = chat.getCtcsSeq();
		String receiver = chat.getCtmgReceiver();
		String sender = chat.getCtmgSender();
		String msg = chat.getCtmgMessage();
		service.insertMsgInfo(chat);
		logger.info("메세지전송: 발신자(나): " + sender + " |수신자: " + receiver + " |클래스seq: " + classId + " |메세지: " + msg);
		//받은 데이터를 저장 발신인,수신인,메세지,전송날짜,클래스id
		simpMessagingTempleate.convertAndSend("/sub/topic/" + classId + "/" + receiver, chat); //받은 메세지를 convertAndSend의 파라미터로 전송

	}
	
	@ResponseBody
	@RequestMapping("/enterRoom") //채팅창 입장
	public Map<String,Object> enterRoom(@RequestBody Map<String,Object> chatMap ) throws Exception {
		logger.info("채팅장입장: 발신자(나): " + chatMap.get("myId") + "| 수신자: " + chatMap.get("name") + "|클래스seq: " + chatMap.get("ctcsSeq"));
		System.out.println(chatMap.toString());
		List<Chat> chatList = service.selectMsg(chatMap);
		service.readNyUpdate(chatMap); //내려받은 메세지 db상에서 읽음표시
		chatMap.put("receiver", chatMap.get("ctmgReceiver"));
		chatMap.put("chatList", chatList);
		
		
		
		return chatMap;
	}

	@ResponseBody
	@RequestMapping("/countMsg") //자신에게 온 메세지 카운트
	public int countMsg(@RequestBody Map<String,String> chatMap ) throws Exception {
		System.out.println("chatMap : " + chatMap.toString());
		int count = service.countMsgOne(chatMap);
		return count;
	}	
	
	@ResponseBody
	@RequestMapping("/readNyUpdate") //채팅창에 들어와있을 때는 readny의 값을 1로 변경
	public void ReadNyUpdate(@RequestBody Map<String,Object> chatMap ) throws Exception {
		service.readNyUpdate(chatMap);
	}
	
	@ResponseBody
	@RequestMapping("/getMsgCount")
	public int getMsgCount(@RequestBody Map<String,String> chatMap) throws Exception{
		int countMsg = service.countMsg(chatMap);
		System.out.println("가져온 받는 파라미터: " + chatMap);
		System.out.println("가져온 메세지 갯수: " + countMsg);
		return countMsg;
	}
}
