package com.cacao.classting.member;

import java.util.Date;

public class MemberVo {

	private String mmSeq;
	private String ctcsSeq;
	private String ctcsCode;

	private String mmName;
	private String mmPhoneNumber;
	private String mmId;
	private Integer mmDelNy;
	private String pseq;
	
//	Member

	private String mmPassword;
	private String mmMemberEmail;
	private String mmDesc;
	private Integer mmAdminNy;
	private Integer mmDormacyNy;
	private Integer mmTeacherNy;
	private Integer mmSchoolCd;
	private Integer mmGradeCd;
	private Integer mmGenderCd;
	private Integer mmTypeOfLoginCd;
	private Integer mmTermsOfserviceNy;
	private Integer mmEventNotificationNy;
	private Integer mmPersonalInfoNy;
	private Integer mmAlarmInvitationNy;
	private Integer mmAlarmReplyNy;
	private Date mmPwdModDate;
	private String mmDob;
	private Date regDateTime;
	private Date regDateTimeSvr;
	private Date modDateTime;
	private Date modDateTimeSvr;
	
	private String ctcmSeq;
	private String ctptSeq;
	private String ctboSeq;
	private String[] checkboxSeqArray;
	
	
			//member search
			private String shMmDelNy;
			private String shMmTeacherNy;
			private String shMmName;
			private String shMmId;
			private String shDateStart;
			private String shDateEnd;
			private Integer shOptionDate;
			

			//common
			private String shOption;
			private String shValue;
			

			

			private int thisPage = 1;									// 현재 페이지
			private int rowNumToShow = 5;								// 화면에 보여줄 데이터 줄 갯수
			private int pageNumToShow = 10;								// 화면에 보여줄 페이징 번호 갯수

			private int totalRows;										// 전체 데이터 갯수
			private int totalPages;										// 전체 페이지 번호



			private int startPage;										// 시작 페이지 번호
			private int endPage;										// 마지막 페이지 번호
			
			private int startRnumForOracle = 1;							// 쿼리 시작 row
			private int endRnumForOracle;								// 쿼리 끝 row
			private Integer RNUM;
			private int startRnumForMysql = 0;							// 쿼리 시작 row
			
			
			
	
	
	public String getMmSeq() {
		return mmSeq;
	}

	public void setMmSeq(String mmSeq) {
		this.mmSeq = mmSeq;
	}

	public String getCtcsSeq() {
		return ctcsSeq;
	}

	public void setCtcsSeq(String ctcsSeq) {
		this.ctcsSeq = ctcsSeq;
	}

	public String getMmName() {
		return mmName;
	}

	public void setMmName(String mmName) {
		this.mmName = mmName;
	}

	public String getMmPhoneNumber() {
		return mmPhoneNumber;
	}

	public void setMmPhoneNumber(String mmPhoneNumber) {
		this.mmPhoneNumber = mmPhoneNumber;
	}

	public Integer getMmDelNy() {
		return mmDelNy;
	}

	public void setMmDelNy(Integer mmDelNy) {
		this.mmDelNy = mmDelNy;
	}

	public String getPseq() {
		return pseq;
	}

	public void setPseq(String pseq) {
		this.pseq = pseq;
	}

	public String getMmId() {
		return mmId;
	}

	public void setMmId(String mmId) {
		this.mmId = mmId;
	}

	
	public String getMmPassword() {
		return mmPassword;
	}

	public void setMmPassword(String mmPassword) {
		this.mmPassword = mmPassword;
	}

	public String getMmMemberEmail() {
		return mmMemberEmail;
	}

	public void setMmMemberEmail(String mmMemberEmail) {
		this.mmMemberEmail = mmMemberEmail;
	}

	public String getMmDesc() {
		return mmDesc;
	}

	public void setMmDesc(String mmDesc) {
		this.mmDesc = mmDesc;
	}

	public Integer getMmAdminNy() {
		return mmAdminNy;
	}

	public void setMmAdminNy(Integer mmAdminNy) {
		this.mmAdminNy = mmAdminNy;
	}

	public Integer getMmDormacyNy() {
		return mmDormacyNy;
	}

	public void setMmDormacyNy(Integer mmDormacyNy) {
		this.mmDormacyNy = mmDormacyNy;
	}

	public Integer getMmTeacherNy() {
		return mmTeacherNy;
	}

	public void setMmTeacherNy(Integer mmTeacherNy) {
		this.mmTeacherNy = mmTeacherNy;
	}

	public Integer getMmSchoolCd() {
		return mmSchoolCd;
	}

	public void setMmSchoolCd(Integer mmSchoolCd) {
		this.mmSchoolCd = mmSchoolCd;
	}

	public Integer getMmGradeCd() {
		return mmGradeCd;
	}

	public void setMmGradeCd(Integer mmGradeCd) {
		this.mmGradeCd = mmGradeCd;
	}

	public Integer getMmGenderCd() {
		return mmGenderCd;
	}

	public void setMmGenderCd(Integer mmGenderCd) {
		this.mmGenderCd = mmGenderCd;
	}

	public Integer getMmTypeOfLoginCd() {
		return mmTypeOfLoginCd;
	}

	public void setMmTypeOfLoginCd(Integer mmTypeOfLoginCd) {
		this.mmTypeOfLoginCd = mmTypeOfLoginCd;
	}

	public Integer getMmTermsOfserviceNy() {
		return mmTermsOfserviceNy;
	}

	public void setMmTermsOfserviceNy(Integer mmTermsOfserviceNy) {
		this.mmTermsOfserviceNy = mmTermsOfserviceNy;
	}

	public Integer getMmEventNotificationNy() {
		return mmEventNotificationNy;
	}

	public void setMmEventNotificationNy(Integer mmEventNotificationNy) {
		this.mmEventNotificationNy = mmEventNotificationNy;
	}

	public Integer getMmPersonalInfoNy() {
		return mmPersonalInfoNy;
	}

	public void setMmPersonalInfoNy(Integer mmPersonalInfoNy) {
		this.mmPersonalInfoNy = mmPersonalInfoNy;
	}

	public Integer getMmAlarmInvitationNy() {
		return mmAlarmInvitationNy;
	}

	public void setMmAlarmInvitationNy(Integer mmAlarmInvitationNy) {
		this.mmAlarmInvitationNy = mmAlarmInvitationNy;
	}

	public Integer getMmAlarmReplyNy() {
		return mmAlarmReplyNy;
	}

	public void setMmAlarmReplyNy(Integer mmAlarmReplyNy) {
		this.mmAlarmReplyNy = mmAlarmReplyNy;
	}

	public Date getMmPwdModDate() {
		return mmPwdModDate;
	}

	public void setMmPwdModDate(Date mmPwdModDate) {
		this.mmPwdModDate = mmPwdModDate;
	}

	public String getMmDob() {
		return mmDob;
	}

	public void setMmDob(String mmDob) {
		this.mmDob = mmDob;
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

	public String getShMmDelNy() {
		return shMmDelNy;
	}

	public void setShMmDelNy(String shMmDelNy) {
		this.shMmDelNy = shMmDelNy;
	}

	public String getShMmName() {
		return shMmName;
	}

	public String getShMmTeacherNy() {
		return shMmTeacherNy;
	}

	public void setShMmTeacherNy(String shMmTeacherNy) {
		this.shMmTeacherNy = shMmTeacherNy;
	}
	public void setShMmName(String shMmName) {
		this.shMmName = shMmName;
	}

	public String getShMmId() {
		return shMmId;
	}

	public void setShMmId(String shMmId) {
		this.shMmId = shMmId;
	}

	public String getShDateStart() {
		return shDateStart;
	}

	public void setShDateStart(String shDateStart) {
		this.shDateStart = shDateStart;
	}

	public String getShDateEnd() {
		return shDateEnd;
	}

	public void setShDateEnd(String shDateEnd) {
		this.shDateEnd = shDateEnd;
	}

	public Integer getShOptionDate() {
		return shOptionDate;
	}

	public void setShOptionDate(Integer shOptionDate) {
		this.shOptionDate = shOptionDate;
	}

	public String getShOption() {
		return shOption;
	}

	public void setShOption(String shOption) {
		this.shOption = shOption;
	}

	public String getShValue() {
		return shValue;
	}

	public void setShValue(String shValue) {
		this.shValue = shValue;
	}

	public int getThisPage() {
		return thisPage;
	}

	public void setThisPage(int thisPage) {
		this.thisPage = thisPage;
	}

	public int getRowNumToShow() {
		return rowNumToShow;
	}

	public void setRowNumToShow(int rowNumToShow) {
		this.rowNumToShow = rowNumToShow;
	}

	public int getPageNumToShow() {
		return pageNumToShow;
	}

	public void setPageNumToShow(int pageNumToShow) {
		this.pageNumToShow = pageNumToShow;
	}

	public int getTotalRows() {
		return totalRows;
	}

	public void setTotalRows(int totalRows) {
		this.totalRows = totalRows;
	}

	public int getTotalPages() {
		return totalPages;
	}

	public void setTotalPages(int totalPages) {
		this.totalPages = totalPages;
	}

	public int getStartPage() {
		return startPage;
	}

	public void setStartPage(int startPage) {
		this.startPage = startPage;
	}

	public int getEndPage() {
		return endPage;
	}

	public void setEndPage(int endPage) {
		this.endPage = endPage;
	}

	public int getStartRnumForOracle() {
		return startRnumForOracle;
	}

	public void setStartRnumForOracle(int startRnumForOracle) {
		this.startRnumForOracle = startRnumForOracle;
	}

	public int getEndRnumForOracle() {
		return endRnumForOracle;
	}

	public void setEndRnumForOracle(int endRnumForOracle) {
		this.endRnumForOracle = endRnumForOracle;
	}

	public Integer getRNUM() {
		return RNUM;
	}

	public void setRNUM(Integer rNUM) {
		RNUM = rNUM;
	}

	public int getStartRnumForMysql() {
		return startRnumForMysql;
	}

	public void setStartRnumForMysql(int startRnumForMysql) {
		this.startRnumForMysql = startRnumForMysql;
	}
	
	public String getCtptSeq() {
		return ctptSeq;
	}

	public void setCtptSeq(String ctptSeq) {
		this.ctptSeq = ctptSeq;
	}

	public String getCtboSeq() {
		return ctboSeq;
	}

	public void setCtboSeq(String ctboSeq) {
		this.ctboSeq = ctboSeq;
	}
	public String[] getCheckboxSeqArray() {
		return checkboxSeqArray;
	}

	public String getCtcmSeq() {
		return ctcmSeq;
	}

	public void setCtcmSeq(String ctcmSeq) {
		this.ctcmSeq = ctcmSeq;
	}

	public void setCheckboxSeqArray(String[] checkboxSeqArray) {
		this.checkboxSeqArray = checkboxSeqArray;
	}
	public String getCtcsCode() {
		return ctcsCode;
	}

	public void setCtcsCode(String ctcsCode) {
		this.ctcsCode = ctcsCode;
	}

			// ---- paging
			public void setParamsPaging(int totalRowsParam) {
				
				totalRows = totalRowsParam;

				totalPages = totalRows / rowNumToShow;

				if (totalRows % rowNumToShow > 0) {
					totalPages = totalPages+ 1;
				}

				if (totalPages < thisPage) {
					thisPage = totalPages;
				}
				
				startPage = (((thisPage - 1) / pageNumToShow) * pageNumToShow + 1);

				endPage = (startPage + pageNumToShow - 1);

				if (endPage > totalPages) {
					endPage = (totalPages);
				}
				
				endRnumForOracle = ((rowNumToShow * thisPage));
				startRnumForOracle = ((endRnumForOracle - rowNumToShow) + 1);
				if (startRnumForOracle < 1) startRnumForOracle = 1;
				
				
				if (thisPage == 1) {
					startRnumForMysql = 0;
				} else {
					startRnumForMysql = ((rowNumToShow * (thisPage-1)));
				}
				
				System.out.println("getThisPage():" + thisPage);
				System.out.println("getTotalRows():" + totalRows);
				System.out.println("getRowNumToShow():" + rowNumToShow);
				System.out.println("getTotalPages():" + totalPages);
				System.out.println("getStartPage():" + startPage);
				System.out.println("getEndPage():" + endPage);		
				System.out.println("getStartRnumForOracle():" + startRnumForOracle);
				System.out.println("getEndRnumForOracle():" + endRnumForOracle);
				System.out.println("getStartRnumForMysql(): " + startRnumForMysql);
				
			}
}