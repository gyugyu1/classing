package com.cacao.classting.chat;

import java.util.Date;

public class Chat {

	private String chatRoomId;
	private String Id;
	private String name;
	private Integer seq;
	
	

	private String ctcsSeq;
	private String ctmgMessage;
	private String ctmgReceiver;
	private String ctmgSendDate;
	private String ctmgSender;
	private String ctmgSenderId;
//	ctMessages
	private String ctmgSeq;
	private Integer ctmgDefaultNy;
	private Integer ctmgDelNy;
	private String ctmgUser;
	private String ctmgId;
	private String ctmgChannel;
	private String ctmgImage;
	private Date regDateTime;
	private Date regDateTimeSvr;
	private Date modDateTime;
	private Date modDateTimeSvr;
	
//	ctChannels
	private Integer ctchSeq;
	private Integer ctchDefaultNy;
	private Integer ctchDelNy;
	private String ctchalUser;
	private String ctchalId;
	
//	ctChats
	private String ctctSeq;
	private String ctctId;
	private Integer ctctDefaultNy;
	private Integer ctctDelNy;
	private Integer ctctChannel;
	private String ctctUser;
	
	
	private String roomName;
	private String roomSeq;
	public String getCtmgMessage() {
		return ctmgMessage;
	}
	public void setCtmgMessage(String ctmgMessage) {
		this.ctmgMessage = ctmgMessage;
	}
	public String getCtmgReceiver() {
		return ctmgReceiver;
	}
	public void setCtmgReceiver(String ctmgReceiver) {
		this.ctmgReceiver = ctmgReceiver;
	}
	public String getCtmgSender() {
		return ctmgSender;
	}
	public void setCtmgSender(String ctmgSender) {
		this.ctmgSender = ctmgSender;
	}
	public String getCtmgSeq() {
		return ctmgSeq;
	}
	public void setCtmgSeq(String ctmgSeq) {
		this.ctmgSeq = ctmgSeq;
	}
	public Integer getCtmgDefaultNy() {
		return ctmgDefaultNy;
	}
	public void setCtmgDefaultNy(Integer ctmgDefaultNy) {
		this.ctmgDefaultNy = ctmgDefaultNy;
	}
	public Integer getCtmgDelNy() {
		return ctmgDelNy;
	}
	public void setCtmgDelNy(Integer ctmgDelNy) {
		this.ctmgDelNy = ctmgDelNy;
	}
	public String getCtmgUser() {
		return ctmgUser;
	}
	public void setCtmgUser(String ctmgUser) {
		this.ctmgUser = ctmgUser;
	}
	public String getCtmgId() {
		return ctmgId;
	}
	public void setCtmgId(String ctmgId) {
		this.ctmgId = ctmgId;
	}
	public String getCtmgChannel() {
		return ctmgChannel;
	}
	public void setCtmgChannel(String ctmgChannel) {
		this.ctmgChannel = ctmgChannel;
	}
	public String getCtmgImage() {
		return ctmgImage;
	}
	public void setCtmgImage(String ctmgImage) {
		this.ctmgImage = ctmgImage;
	}
	public String getCtcsSeq() {
		return ctcsSeq;
	}
	public void setCtcsSeq(String ctcsSeq) {
		this.ctcsSeq = ctcsSeq;
	}
	public Date getRegDateTime() {
		return regDateTime;
	}
	public void setRegDateTime(Date regDateTime) {
		this.regDateTime = regDateTime;
	}
	public Date getRegDateTimeSvr() {
		return regDateTimeSvr;
	}
	public void setRegDateTimeSvr(Date regDateTimeSvr) {
		this.regDateTimeSvr = regDateTimeSvr;
	}
	public Date getModDateTime() {
		return modDateTime;
	}
	public void setModDateTime(Date modDateTime) {
		this.modDateTime = modDateTime;
	}
	public Date getModDateTimeSvr() {
		return modDateTimeSvr;
	}
	public void setModDateTimeSvr(Date modDateTimeSvr) {
		this.modDateTimeSvr = modDateTimeSvr;
	}
	public Integer getCtchSeq() {
		return ctchSeq;
	}
	public void setCtchSeq(Integer ctchSeq) {
		this.ctchSeq = ctchSeq;
	}
	public Integer getCtchDefaultNy() {
		return ctchDefaultNy;
	}
	public void setCtchDefaultNy(Integer ctchDefaultNy) {
		this.ctchDefaultNy = ctchDefaultNy;
	}
	public Integer getCtchDelNy() {
		return ctchDelNy;
	}
	public void setCtchDelNy(Integer ctchDelNy) {
		this.ctchDelNy = ctchDelNy;
	}
	public String getCtchalUser() {
		return ctchalUser;
	}
	public void setCtchalUser(String ctchalUser) {
		this.ctchalUser = ctchalUser;
	}
	public String getCtchalId() {
		return ctchalId;
	}
	public void setCtchalId(String ctchalId) {
		this.ctchalId = ctchalId;
	}
	public String getCtctSeq() {
		return ctctSeq;
	}
	public void setCtctSeq(String ctctSeq) {
		this.ctctSeq = ctctSeq;
	}
	public String getCtctId() {
		return ctctId;
	}
	public void setCtctId(String ctctId) {
		this.ctctId = ctctId;
	}
	public Integer getCtctDefaultNy() {
		return ctctDefaultNy;
	}
	public void setCtctDefaultNy(Integer ctctDefaultNy) {
		this.ctctDefaultNy = ctctDefaultNy;
	}
	public Integer getCtctDelNy() {
		return ctctDelNy;
	}
	public void setCtctDelNy(Integer ctctDelNy) {
		this.ctctDelNy = ctctDelNy;
	}
	public Integer getCtctChannel() {
		return ctctChannel;
	}
	public void setCtctChannel(Integer ctctChannel) {
		this.ctctChannel = ctctChannel;
	}
	public String getCtctUser() {
		return ctctUser;
	}
	public void setCtctUser(String ctctUser) {
		this.ctctUser = ctctUser;
	}
	public String getRoomName() {
		return roomName;
	}
	public void setRoomName(String roomName) {
		this.roomName = roomName;
	}
	public String getRoomSeq() {
		return roomSeq;
	}
	public void setRoomSeq(String roomSeq) {
		this.roomSeq = roomSeq;
	}

	public String getChatRoomId() {
		return chatRoomId;
	}
	public void setChatRoomId(String chatRoomId) {
		this.chatRoomId = chatRoomId;
	}
	public String getId() {
		return Id;
	}
	public void setId(String id) {
		Id = id;
	}

	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public Integer getSeq() {
		return seq;
	}
	public void setSeq(Integer seq) {
		this.seq = seq;
	}
	public String getCtmgSenderId() {
		return ctmgSenderId;
	}
	public void setCtmgSenderId(String ctmgSenderId) {
		this.ctmgSenderId = ctmgSenderId;
	}
	public String getCtmgSendDate() {
		return ctmgSendDate;
	}
	public void setCtmgSendDate(String ctmgSendDate) {
		this.ctmgSendDate = ctmgSendDate;
	}

	
	
	

}
