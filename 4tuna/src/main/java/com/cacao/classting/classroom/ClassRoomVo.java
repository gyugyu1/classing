package com.cacao.classting.classroom;

import java.util.Date;

public class ClassRoomVo {

//		ctClass
		private String ctcsSeq;
		private String ctcsBelongto;
		private String ctcsName;
		private String ctcsYear;
		private Integer ctcsGradeCd;
		private String ctcsDesc;
		private String ctcsCode;
		private Integer ctcsDelNy;
		private Date regDateTime;
		private Date regDateTimeSvr;
		private Date modDateTime;
		private Date modDateTimeSvr;
		
//		ctClassMember
		private String ctcmSeq;
		private String ctcmName;
		private String ctcmDesc;
		private Integer ctcmTeacherNy;
		private Integer ctcmAlarmReplyNy;
		private Integer ctcmAlarmReactionNy;
		private Integer ctcmDelNy;
		private String mmSeq;
		private String ctcmProfile;
		
		private String cthwSeq;
		private String ctptSeq;
		private String ctboSeq;
		private String cthpSeq;
		private String ctrpSeq;
		private String cthsWriter;
		
		private String ctrhSeq;	

		private int totalMembers;	
		private int submitMembers;	
		
		//class search
		private String shCtcsDelNy;
		private String shCtcsName;
		private String shCtcsId;
		private String shDateStart;
		private String shDateEnd;
		private Integer shOptionDate;

//		ctPostUploaded
		private String seq;	
		private String originalName;	
		private String uuidName;	
		private String ext;	
		private Integer type;	
		private Integer defaultNy;	
		private Integer sort;	
		private long size;	
		
		private Integer delNy;	
		private String pseq;
		//common
		private String[] checkboxSeqArray;
		private String shOption;
		private String shValue;
		private String shBelongto;
		
		private String cthsSeq;
		private String ctrsSeq;	
		

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
		
		private Integer ctptNoticeNy;
		
		public int getTotalMembers() {
			return totalMembers;
		}

		public void setTotalMembers(int totalMembers) {
			this.totalMembers = totalMembers;
		}
		
		public String getCthwSeq() {
			return cthwSeq;
		}
		public void setCthwSeq(String cthwSeq) {
			this.cthwSeq = cthwSeq;
		}
		public String getCtcsSeq() {
			return ctcsSeq;
		}
		public void setCtcsSeq(String ctcsSeq) {
			this.ctcsSeq = ctcsSeq;
		}
		public String getCtcsBelongto() {
			return ctcsBelongto;
		}
		public void setCtcsBelongto(String ctcsBelongto) {
			this.ctcsBelongto = ctcsBelongto;
		}
		public String getCtcsName() {
			return ctcsName;
		}
		public void setCtcsName(String ctcsName) {
			this.ctcsName = ctcsName;
		}
		public String getCtcsYear() {
			return ctcsYear;
		}
		public void setCtcsYear(String ctcsYear) {
			this.ctcsYear = ctcsYear;
		}
		public Integer getCtcsGradeCd() {
			return ctcsGradeCd;
		}
		public void setCtcsGradeCd(Integer ctcsGradeCd) {
			this.ctcsGradeCd = ctcsGradeCd;
		}
		public String getCtcsDesc() {
			return ctcsDesc;
		}
		public void setCtcsDesc(String ctcsDesc) {
			this.ctcsDesc = ctcsDesc;
		}
		public String getCtcsCode() {
			return ctcsCode;
		}
		public void setCtcsCode(String ctcsCode) {
			this.ctcsCode = ctcsCode;
		}
		public Integer getCtcsDelNy() {
			return ctcsDelNy;
		}
		public void setCtcsDelNy(Integer ctcsDelNy) {
			this.ctcsDelNy = ctcsDelNy;
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
		public String getCtcmSeq() {
			return ctcmSeq;
		}
		public void setCtcmSeq(String ctcmSeq) {
			this.ctcmSeq = ctcmSeq;
		}
		public String getCtcmName() {
			return ctcmName;
		}
		public void setCtcmName(String ctcmName) {
			this.ctcmName = ctcmName;
		}
		public String getCtcmDesc() {
			return ctcmDesc;
		}
		public void setCtcmDesc(String ctcmDesc) {
			this.ctcmDesc = ctcmDesc;
		}
		public Integer getCtcmTeacherNy() {
			return ctcmTeacherNy;
		}
		public void setCtcmTeacherNy(Integer ctcmTeacherNy) {
			this.ctcmTeacherNy = ctcmTeacherNy;
		}
		public Integer getCtcmAlarmReplyNy() {
			return ctcmAlarmReplyNy;
		}
		public void setCtcmAlarmReplyNy(Integer ctcmAlarmReplyNy) {
			this.ctcmAlarmReplyNy = ctcmAlarmReplyNy;
		}
		public Integer getCtcmAlarmReactionNy() {
			return ctcmAlarmReactionNy;
		}
		public void setCtcmAlarmReactionNy(Integer ctcmAlarmReactionNy) {
			this.ctcmAlarmReactionNy = ctcmAlarmReactionNy;
		}
		public Integer getCtcmDelNy() {
			return ctcmDelNy;
		}
		public void setCtcmDelNy(Integer ctcmDelNy) {
			this.ctcmDelNy = ctcmDelNy;
		}
		public String getMmSeq() {
			return mmSeq;
		}
		public void setMmSeq(String mmSeq) {
			this.mmSeq = mmSeq;
		}


		public String[] getCheckboxSeqArray() {
			return checkboxSeqArray;
		}
		public void setCheckboxSeqArray(String[] checkboxSeqArray) {
			this.checkboxSeqArray = checkboxSeqArray;
		}
		public String getShCtcsDelNy() {
			return shCtcsDelNy;
		}
		public void setShCtcsDelNy(String shCtcsDelNy) {
			this.shCtcsDelNy = shCtcsDelNy;
		}
		public String getShCtcsName() {
			return shCtcsName;
		}
		public void setShCtcsName(String shCtcsName) {
			this.shCtcsName = shCtcsName;
		}
		public String getShCtcsId() {
			return shCtcsId;
		}
		public void setShCtcsId(String shCtcsId) {
			this.shCtcsId = shCtcsId;
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
		
		public String getShBelongto() {
			return shBelongto;
		}
		public void setShBelongto(String shBelongto) {
			this.shBelongto = shBelongto;
		}
		
		public String getCtboSeq() {
			return ctboSeq;
		}
		public void setCtboSeq(String ctboSeq) {
			this.ctboSeq = ctboSeq;
		}
		
		public String getCtptSeq() {
			return ctptSeq;
		}
		public void setCtptSeq(String ctptSeq) {
			this.ctptSeq = ctptSeq;
		}
		
		public String getCthpSeq() {
			return cthpSeq;
		}
		public void setCthpSeq(String cthpSeq) {
			this.cthpSeq = cthpSeq;
		}
		
		public String getCtrpSeq() {
			return ctrpSeq;
		}
		public void setCtrpSeq(String ctrpSeq) {
			this.ctrpSeq = ctrpSeq;
		}
		
		public String getSeq() {
			return seq;
		}

		public void setSeq(String seq) {
			this.seq = seq;
		}

		public String getOriginalName() {
			return originalName;
		}

		public void setOriginalName(String originalName) {
			this.originalName = originalName;
		}

		public String getUuidName() {
			return uuidName;
		}

		public void setUuidName(String uuidName) {
			this.uuidName = uuidName;
		}

		public String getExt() {
			return ext;
		}

		public void setExt(String ext) {
			this.ext = ext;
		}

		public Integer getType() {
			return type;
		}

		public void setType(Integer type) {
			this.type = type;
		}

		public Integer getDefaultNy() {
			return defaultNy;
		}

		public void setDefaultNy(Integer defaultNy) {
			this.defaultNy = defaultNy;
		}

		public Integer getSort() {
			return sort;
		}

		public void setSort(Integer sort) {
			this.sort = sort;
		}

		public long getSize() {
			return size;
		}

		public void setSize(long size) {
			this.size = size;
		}

		public Integer getDelNy() {
			return delNy;
		}

		public void setDelNy(Integer delNy) {
			this.delNy = delNy;
		}

		public String getPseq() {
			return pseq;
		}

		public void setPseq(String pseq) {
			this.pseq = pseq;
		}

		public String getCthsSeq() {
			return cthsSeq;
		}
		public void setCthsSeq(String cthsSeq) {
			this.cthsSeq = cthsSeq;
		}
		public String getCthsWriter() {
			return cthsWriter;
		}

		public void setCthsWriter(String cthsWriter) {
			this.cthsWriter = cthsWriter;
		}

		
		public int getSubmitMembers() {
			return submitMembers;
		}

		public void setSubmitMembers(int submitMembers) {
			this.submitMembers = submitMembers;
		}
		
		public String getCtrhSeq() {
			return ctrhSeq;
		}

		public void setCtrhSeq(String ctrhSeq) {
			this.ctrhSeq = ctrhSeq;
		}

		public String getCtrsSeq() {
			return ctrsSeq;
		}

		public void setCtrsSeq(String ctrsSeq) {
			this.ctrsSeq = ctrsSeq;
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

		public String getCtcmProfile() {
			return ctcmProfile;
		}

		public void setCtcmProfile(String ctcmProfile) {
			this.ctcmProfile = ctcmProfile;
		}

		public Integer getCtptNoticeNy() {
			return ctptNoticeNy;
		}

		public void setCtptNoticeNy(Integer ctptNoticeNy) {
			this.ctptNoticeNy = ctptNoticeNy;
		}
	}
