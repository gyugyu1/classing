package com.cacao.classting.classroom;

import java.io.File;
import java.time.LocalDate;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Map.Entry;

import javax.servlet.http.HttpSession;

import org.apache.commons.io.FileUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.cacao.classting.common.constants.Constants;
import com.cacao.classting.common.util.UtilDateTime;
import com.cacao.classting.*;
@Controller
public class ClassRoomController {
	static String userDir= System.getProperty("user.dir");
	static String defaultDir = userDir.substring(0,userDir.length()-3);
	public static String sep = System.getProperty("file.separator");
	
	public static String IMG_DIRECTORY = defaultDir+"webapps" + sep +"ROOT" + sep +"resources" + sep +"uploaded";
	
	@Autowired
	ClassRoomServiceImpl service;

	private static final Logger logger = LoggerFactory.getLogger(ClassRoomController.class);

	@RequestMapping(value = "/classStudentForm")
	public String classStudentForm(@ModelAttribute("vo") ClassRoomVo vo, ClassRoom dto, Model model, HttpSession httpSession) {

		return "member/classroom/student/classStudentForm";
	}

	@RequestMapping(value = "/classMemberView")
	public String classMemberView(@ModelAttribute("vo") ClassRoomVo vo, ClassRoom dto, Model model, HttpSession httpSession) throws Exception {
		vo.setCtcsSeq((String) httpSession.getAttribute("ctcsSeq"));
		System.out.println("vo.getCtcsSeq :" + vo.getCtcsSeq());
		
		vo.setCtcmSeq((String) httpSession.getAttribute("ctcmSeq"));
		System.out.println("vo.getCtcmSeq :" + vo.getCtcmSeq());
		
		vo.setMmSeq((String) httpSession.getAttribute("mmSeq"));
		System.out.println("vo.getMmSeq :" + vo.getMmSeq());
		
		ClassRoom item = service.selectOneMemberClass(vo);
		
		
		System.out.println("??????????????? :" +defaultDir);
		model.addAttribute("item", item);
		
		System.out.println("item" + item);
		System.out.println(vo.getCtcsSeq());
		return "member/classroom/common/classMemberView";
	}

	@RequestMapping(value = "/updateClassMember.do")
	public String updateClassMember(@RequestParam("ctcmName")String ctcmName,HttpSession httpSession, ClassRoomVo vo, RedirectAttributes redirectAttributes, MultipartHttpServletRequest mr) throws Exception {
		String ctcsSeq = (String) httpSession.getAttribute("ctcsSeq");
		String ctcmSeq = (String) httpSession.getAttribute("ctcmSeq");// ???????????? ???????????? ????????? seq ????????????
		
		
		vo.setCtcmSeq(ctcmSeq);
		vo.setCtcsSeq(ctcsSeq); // vo ??? class??? member??? seq set
		String ctcmProfile = upload(mr);
		httpSession.setAttribute("profile", ctcmProfile );
		System.out.println("??????????????? :" + System.getProperty("user.dir"));
		System.out.println("????????? ogName:" + ctcmProfile );
		
		vo.setCtcmName(ctcmName);
		vo.setCtcmProfile(ctcmProfile);
		
		httpSession.setAttribute("ctcmProfile", ctcmProfile);
		//??????????????? ???????????? ?????? ??????????????? ?????????
		if(ctcmProfile != null) {
			File srcFile = new File(IMG_DIRECTORY + sep + "temp" + sep + ctcmProfile); //???????????? ????????? ?????????????????? ?????? ??????
			File destFile = new File(IMG_DIRECTORY + sep + ctcsSeq + sep + ctcmSeq ); // ????????? seq\\?????? seq ????????? ????????????

			File oldFile = new File(IMG_DIRECTORY + sep + ctcsSeq + sep + ctcmSeq + sep + ctcmProfile );
			//?????? ????????? ?????? ???????????? ??????
			if(oldFile.exists()) {
				oldFile.delete();
				FileUtils.moveFileToDirectory(srcFile, destFile, true);
			}else {
				FileUtils.moveFileToDirectory(srcFile, destFile, true);
			}
		}
		
		
		redirectAttributes.addFlashAttribute("vo", vo);
		service.updateClassMember(vo);
		return "redirect:/classMain";
	}
	

	@RequestMapping(value = "/deleteClassMember")
	public String deleteClassMember(ClassRoomVo vo, HttpSession httpSession, RedirectAttributes redirectAttributes) throws Exception {
		vo.setCtcsSeq((String) httpSession.getAttribute("ctcsSeq"));
		vo.setCtcmSeq((String) httpSession.getAttribute("ctcmSeq"));
		service.deleteClassMember(vo);

		return "redirect:/main";
	}

	@RequestMapping(value = "/noticeBoard")
	public String classNoticeList(@ModelAttribute("vo") ClassRoomVo vo, ClassRoom dto, Model model, HttpSession httpSession) throws Exception {

		vo.setCtcsSeq((String) httpSession.getAttribute("ctcsSeq"));
		System.out.println("vo.getCtcsSeq :" + vo.getCtcsSeq());

		List<ClassRoom> memberList = service.selectListClassMember(vo);
		model.addAttribute("memberList", memberList);
		
		List<ClassRoom> list = service.selectListPost(vo);
		model.addAttribute("list", list);

		return "member/classroom/common/noticeBoard";
	}

	@RequestMapping(value = "/adminClassList"/*  */)
	public String adminClassList(@ModelAttribute("vo") ClassRoomVo vo, ClassRoom dto, Model model, HttpSession httpSession) throws Exception {
		System.out.println("UtilDateTime.nowLocalDateTime()" + UtilDateTime.nowLocalDateTime());
		System.out.println("UtilDateTime.nowDate()" + UtilDateTime.nowDate());
		System.out.println("UtilDateTime.nowString()" + UtilDateTime.nowString());

		vo.setShDateStart(vo.getShDateStart() == null ? UtilDateTime.calculateDayString(UtilDateTime.nowLocalDateTime(), Constants.DATE_INTERVAL) : UtilDateTime.addStringTime(vo.getShDateStart()));
		vo.setShDateEnd(vo.getShDateEnd() == null ? UtilDateTime.nowString() : UtilDateTime.addStringTime(vo.getShDateEnd()));

		vo.setShOptionDate(vo.getShOptionDate() == null ? 0 : vo.getShOptionDate());
		vo.setShDateStart(vo.getShDateStart() == null ? UtilDateTime.calculateDayString(UtilDateTime.nowLocalDateTime(), Constants.DATE_INTERVAL) : UtilDateTime.add00TimeString(vo.getShDateStart()));
		vo.setShDateEnd(vo.getShDateEnd() == null ? UtilDateTime.nowString() : UtilDateTime.addNowTimeString(vo.getShDateEnd()));

		int count = service.selectOneCount(vo);
		vo.setParamsPaging(count);
		if (count != 0) {
			List<ClassRoom> list = service.selectListClass(vo);
			model.addAttribute("list", list);

		} else {
			// by pass

		}

		return "xdmin/member/classroom/adminClassList";
	}

	@RequestMapping(value = "/adminClassView")
	public String adminClassView(@ModelAttribute("vo") ClassRoomVo vo, ClassRoom dto, Model model, HttpSession httpSession) throws Exception {
		ClassRoom item = service.selectOneClass(vo);
		model.addAttribute("item", item);

		List<ClassRoom> list = service.selectListClassMember(vo);
		model.addAttribute("list", list);

		return "xdmin/member/classroom/adminClassView";
	}

	@RequestMapping(value = "/deleteClass")
	public String deleteClass(ClassRoomVo vo, RedirectAttributes redirectAttributes) throws Exception {
		service.deleteClass(vo);

		return "redirect:/adminClassList";
	}

	@RequestMapping(value = "/deleteClassMulti")
	public String deleteClassMulti(ClassRoomVo vo, RedirectAttributes redirectAttributes) throws Exception {

		String[] checkboxSeqArray = vo.getCheckboxSeqArray();
		System.out.println("vo.getCheckboxSeqArray():" + vo.getCheckboxSeqArray());
		for (String checkboxSeq : checkboxSeqArray) {
			vo.setCtcsSeq(checkboxSeq);
			service.deleteClassMulti(vo);
		}

		return "redirect:/adminClassList";
	}

	@RequestMapping(value = "/classBoardUpload")
	public String postUpload(@ModelAttribute("vo") ClassRoomVo vo, ClassRoom dto, Model model, HttpSession httpSession) {
			
		return "member/classroom/common/classBoardUpload";
	}
	
	@RequestMapping(value = "/member/classroom/common/classPostInst")
	public String classPostInst(@ModelAttribute("vo") ClassRoomVo vo, ClassRoom dto, Model model, HttpSession httpSession) throws Exception {

		service.insertPost(dto);
		
		return "redirect:/classMain";

	}
	
	@RequestMapping(value="/postdelete.do")
	public String postdelete(ClassRoomVo vo ,RedirectAttributes redirect) throws Exception{
		service.deletePost(vo);
		return "redirect:/classMain";
	}
	

	@RequestMapping(value = "/classStorage")
	public String classStorage(@ModelAttribute("vo") ClassRoomVo vo, ClassRoom dto, Model model, HttpSession httpSession) throws Exception {

		vo.setCtcsSeq((String) httpSession.getAttribute("ctcsSeq"));
		System.out.println("vo.getCtcsSeq :" + vo.getCtcsSeq());

		List<ClassRoom> memberList = service.selectListClassMember(vo);
		model.addAttribute("memberList", memberList);

		List<ClassRoom> list = service.selectListStorage(vo);
		model.addAttribute("list", list);

		List<ClassRoom> list2 = service.selectListReserv(vo);
		model.addAttribute("list2", list2);

		return "member/classroom/common/classStorage";
	}

	@RequestMapping(value = "/classPostEdit")
	public String classPostEdit3(@ModelAttribute("vo") ClassRoomVo vo, ClassRoom dto, Model model, HttpSession httpSession) {

		return "member/classroom/common/classPostEdit";
	}

	@RequestMapping(value = "/classSetting")
	public String classSetting(@ModelAttribute("vo") ClassRoomVo vo, ClassRoom dto, Model model, HttpSession httpSession) {

		return "member/classroom/teacher/classSetting";
	}

	@RequestMapping(value = "/chat")
	public String chat(@ModelAttribute("vo") ClassRoomVo vo, ClassRoom dto, Model model, HttpSession httpSession) throws Exception {
		String seq = (String) httpSession.getAttribute("ctcsSeq");
		String memberSeq = (String) httpSession.getAttribute("ctcmSeq");
		String memberName = (String) httpSession.getAttribute("ctcmName");
		vo.setCtcmName(memberName);
		vo.setCtcsSeq(seq);
		vo.setCtcmSeq(memberSeq);
		HashMap<String, String> countMsg = new HashMap<String, String>();

		countMsg.put("ctcsSeq", seq);
		countMsg.put("ctmgReceiver", memberSeq);
		List<ClassRoom> msgCount = service.countMsg(countMsg);

		model.addAttribute("memberList", msgCount);

		return "chat/chat";
	}

	@RequestMapping(value = "/classMain")
	public String classMain(@ModelAttribute("vo") ClassRoomVo vo, ClassRoom dto, Model model, HttpSession httpSession) throws Exception {
		System.out.println("??????????????? ctcmSeq:" + vo.getCtcmSeq());
		System.out.println("??????????????? ctcsSeq:" + vo.getCtcsSeq());
		System.out.println("??????????????? ?????? ctcsSeq:" + (String)httpSession.getAttribute("ctcsSeq"));
		
		
		
		if(httpSession.getAttribute("ctcsSeq") == null) {
			httpSession.setAttribute("ctcsSeq", vo.getCtcsSeq());
		}else if(vo.getCtcsSeq() == null) {
			vo.setCtcsSeq((String)httpSession.getAttribute("ctcsSeq"));
		}

		// ???????????? ????????? ??????
		System.out.println("vo.getCtcsSeq :" + vo.getCtcsSeq());
		System.out.println("?????? ctcs ??? : " + httpSession.getAttribute("ctcsSeq"));
		vo.setMmSeq((String) httpSession.getAttribute("sessSeq"));
		vo.setCtcsSeq((String) httpSession.getAttribute("ctcsSeq"));

		System.out.println("vo.getMmSeq :" + vo.getMmSeq());
		System.out.println("vo.getCtcsSeq :" + vo.getCtcsSeq());

		ClassRoom rt = service.selectOneSidebar(vo);
		model.addAttribute("item", rt);

//		????????? ?????? ????????? ????????? ?????????????????? ??? ?????? => ???????????? include ???????????? ??????
		httpSession.setAttribute("ctcsYear", rt.getCtcsYear());
		httpSession.setAttribute("ctcsName", rt.getCtcsName());
		httpSession.setAttribute("ctcmSeq", rt.getCtcmSeq());
		httpSession.setAttribute("ctcmName", rt.getCtcmName());
		httpSession.setAttribute("teacherNy", rt.getCtcmTeacherNy());
		httpSession.setAttribute("ctPath", rt.getPath());
		httpSession.setAttribute("ctUuidName", rt.getUuidName());
		httpSession.setAttribute("ctcmProfile", rt.getCtcmProfile());
		httpSession.setAttribute("profilePath", IMG_DIRECTORY);

//		????????? ????????? ????????????
		List<ClassRoom> list = service.selectListPost(vo);
		model.addAttribute("list", list);

//		??????????????? ????????????
		List<ClassRoom> memberList = service.selectListClassMember(vo);
		model.addAttribute("memberList", memberList);

//		???????????? ????????? ???????????? && session??? binding
		List<ClassRoom> categories = service.selectCategory(vo);
		httpSession.setAttribute("categories",categories );
		
// 		????????? ????????????		
		List<ClassRoom> ytb = service.selectListClassPostUrl(vo);
		model.addAttribute("ytb", ytb);
		// ?????? ??????
		String today = LocalDate.now().toString();
		String now = LocalDateTime.now().toString();

		ClassRoom attendance = service.getClassId(vo); // mmseq??? ctcsseq??? ctcmseq??? ??????

		System.out.println("??????:" + today);
		System.out.println("???????????????" + attendance.getCtcmSeq());

		attendance.setCtadRegDateTime(now); // attendance??? ?????? ?????? ??????
		attendance.setAttendanceToday(today); // ???????????? ??????

		System.out.println("????????????:" + attendance.getCtadRegDateTime());
		System.out.println("?????????????????????:" + attendance.getCtcmSeq());
		System.out.println("????????????:" + attendance.getAttendanceToday());
		int todayEnterNum = service.today(attendance); // ?????? ?????? ?????? ??????
		System.out.println("????????? ?????????: " + todayEnterNum);

		if (todayEnterNum < 1 && rt.getCtcmTeacherNy() == 0) {
			service.attendance(attendance);
			System.out.println("???????????? ??????");
		} else {
			System.out.println("?????? ?????? ??????????????? ????????? ??????????????????.");
		}
		return "member/classroom/common/classMain";
	}

	@RequestMapping(value = "/classMemberList")
	public String classMemberList(@ModelAttribute("vo") ClassRoomVo vo, ClassRoom dto, Model model, HttpSession httpSession) throws Exception {

		vo.setCtcsSeq((String) httpSession.getAttribute("ctcsSeq"));
		System.out.println("vo.getCtcsSeq :" + vo.getCtcsSeq());

		List<ClassRoom> list = service.selectListClassMember(vo);
		model.addAttribute("list", list);

		return "member/classroom/common/classMemberList";
	}

	@RequestMapping(value = "/classMemberUele")
	public String classMemberUele(@ModelAttribute("vo") ClassRoomVo vo, ClassRoom dto, Model model, HttpSession httpSession, RedirectAttributes redirectAttributes) throws Exception {

		service.updateClassMemberDel(dto);

		vo.setCtcmSeq(dto.getCtcmSeq());
		vo.setCtcsSeq(dto.getCtcsSeq());
		System.out.println("getCtcmSeq : " + vo.getCtcmSeq());
		System.out.println("getCtcsSeq : " + vo.getCtcsSeq());

		redirectAttributes.addFlashAttribute("vo", vo);
		return "redirect:/classMemberList";
	}

	@RequestMapping(value = "/classInvitation")
	public String classInvitation(@ModelAttribute("vo") ClassRoomVo vo, ClassRoom dto, Model model, HttpSession httpSession) throws Exception {

		vo.setCtcsSeq((String) httpSession.getAttribute("ctcsSeq"));
		System.out.println("vo.getCtcsSeq :" + vo.getCtcsSeq());

		ClassRoom rt = service.selectOneClassInfo(vo);
		model.addAttribute("item", rt);

		return "member/classroom/teacher/classInvitation";
	}

	@RequestMapping(value = "member/class/student/learningprogress")
	public String learnpro(@ModelAttribute("vo") ClassRoomVo vo, ClassRoom dto, Model model, HttpSession httpSession) {

		return "member/classroom/student/classLearningProgress";
	}

	@RequestMapping(value = "member/class/common/postlist")
	public String postlist(@ModelAttribute("vo") ClassRoomVo vo, ClassRoom dto, Model model, HttpSession httpSession) throws Exception {

		vo.setCtcsSeq((String) httpSession.getAttribute("ctcsSeq"));
		System.out.println("vo.getCtcsSeq :" + vo.getCtcsSeq());

//		????????? ????????? ????????????
		List<ClassRoom> list = service.selectListPost(vo);
		model.addAttribute("list", list);

//		??????????????? ????????????
		List<ClassRoom> memberList = service.selectListClassMember(vo);
		model.addAttribute("memberList", memberList);
		System.out.println("memberList" + memberList);

//		????????? url
		List<ClassRoom> ytb = service.selectListClassPostUrl(vo);
		model.addAttribute("ytb", ytb);
		System.out.println("ytb" + ytb);

		return "member/classroom/common/classPostList";
	}

	@RequestMapping(value = "member/class/common/postdatalist")
	public String postdatalist(@ModelAttribute("vo") ClassRoomVo vo, ClassRoom dto, Model model, HttpSession httpSession) throws Exception {

		vo.setCtcsSeq((String) httpSession.getAttribute("ctcsSeq"));
		System.out.println("vo.getCtcsSeq :" + vo.getCtcsSeq());

//		????????? ????????? ????????????
		List<ClassRoom> list = service.selectListPost(vo);
		model.addAttribute("list", list);

//		??????????????? ????????????
		List<ClassRoom> memberList = service.selectListClassMember(vo);
		model.addAttribute("memberList", memberList);

		return "member/classroom/common/classPostDataList";
	}

	@RequestMapping(value = "member/class/common/postpicturelist")
	public String postpicturelist(@ModelAttribute("vo") ClassRoomVo vo, ClassRoom dto, Model model, HttpSession httpSession) throws Exception {

		vo.setCtcsSeq((String) httpSession.getAttribute("ctcsSeq"));
		System.out.println("vo.getCtcsSeq :" + vo.getCtcsSeq());

//		????????? ????????? ????????????
		List<ClassRoom> list = service.selectListPost(vo);
		model.addAttribute("list", list);

//		??????????????? ????????????
		List<ClassRoom> memberList = service.selectListClassMember(vo);
		model.addAttribute("memberList", memberList);

		return "member/classroom/common/classPostPictureList";
	}

	@RequestMapping(value = "member/class/teacher/homeworkreport")
	public String homeworkReport(@ModelAttribute("vo") ClassRoomVo vo, ClassRoom dto, Model model, HttpSession httpSession) throws Exception {
		dto.setCtcsSeq((String) httpSession.getAttribute("ctcsSeq"));
		vo.setCtcsSeq((String) httpSession.getAttribute("ctcsSeq"));
		List<ClassRoom> homeworkList = service.selectListHomework(vo); // ???????????? ????????? ?????? ??????
		List<ClassRoom> submitList = service.homeworkSubmit(dto);
		List<ClassRoom> writerList = service.selectListClassMember(vo); // ????????? ??????

		Map submitMap = new HashMap();
		for (int i = 0; i < writerList.size(); i++) {
			ClassRoom tmp = writerList.get(i);
			Map tmpMap = new HashMap();
			for (int j = 0; j < submitList.size(); j++) {
				ClassRoom submit = submitList.get(j);

				if (String.valueOf(submit.getCthsWriter()).equals(tmp.getCtcmSeq())) {

					tmpMap.put(submit.getCthpSeq(), submit.getCthsScore());
				}
			}
			submitMap.put(tmp.getCtcmName(), tmpMap);
		}

		System.out.println(submitMap.toString());

		List homeworkCountList = new ArrayList();

		for (int i = 0; i < writerList.size(); i++) {
			String name = writerList.get(i).getCtcmName();
			Map tmpMap = new HashMap();
			tmpMap = (Map) submitMap.get(name);
			for (int j = 0; j < homeworkList.size(); j++) {
				ClassRoom homework = homeworkList.get(j);
				String homeworkSeq = homework.getCthpSeq();
				if (!tmpMap.containsKey(homeworkSeq))
					tmpMap.put(homeworkSeq, -1);
			}

		}

		double homeworkCount = 0.0;
		for (int i = 0; i < homeworkList.size(); i++) {

			ClassRoom tmp = homeworkList.get(i);

			vo.setCthpSeq(tmp.getCthpSeq());
			homeworkCount = (double) service.selectOneSubmitCount(vo) / writerList.size();
			homeworkCountList.add(homeworkCount);

		}

		System.out.println(submitMap.toString());
		List<ClassRoom> scoreAvg = service.scoreAvg(vo);
		System.out.println(scoreAvg.get(0).getScoreAvg());
		model.addAttribute("scoreAvg", scoreAvg);
		model.addAttribute("submitMap", submitMap);
		model.addAttribute("homeworkList", homeworkList);
		model.addAttribute("homeworkCountList", homeworkCountList);

		return "member/classroom/teacher/classHomeworkReport";
	}

	@RequestMapping(value = "member/class/teacher/homeworklist")
	public String homeworkList(@ModelAttribute("vo") ClassRoomVo vo, ClassRoom dto, Model model, HttpSession httpSession) throws Exception {

		vo.setCtcsSeq((String) httpSession.getAttribute("ctcsSeq"));
		System.out.println("vo.getCtcsSeq :" + vo.getCtcsSeq());

		List<ClassRoom> memberList = service.selectListClassMember(vo);
		model.addAttribute("memberList", memberList);

		List<ClassRoom> list = service.selectListHomework(vo);
		model.addAttribute("list", list);

		return "member/classroom/common/classHomeworkList";
	}

	@RequestMapping(value = "member/class/common/classVideoList")
	public String videoList(@ModelAttribute("vo") ClassRoomVo vo, ClassRoom dto, Model model, HttpSession httpSession) throws Exception {

		vo.setCtcsSeq((String) httpSession.getAttribute("ctcsSeq"));
		System.out.println("vo.getCtcsSeq :" + vo.getCtcsSeq());

		List<ClassRoom> memberList = service.selectListClassMember(vo);
		model.addAttribute("memberList", memberList);

		List<ClassRoom> list = service.selectListClassPostUrl(vo);
		model.addAttribute("list", list);

		return "member/classroom/common/classVideoList";
	}

	@RequestMapping(value = "member/class/teacher/attendance")
	public String classattendance(@ModelAttribute("vo") ClassRoomVo vo, ClassRoom dto, Model model, HttpSession httpSession) throws Exception {
		System.out.println("????????? :" + httpSession.getAttribute("sessSeq"));
		String classSeq = (String) httpSession.getAttribute("ctcsSeq");
		vo.setCtcsSeq(classSeq);
		List<String> days = new ArrayList<String>();
		List<String> week = new ArrayList<String>();

		LocalDate today = LocalDate.now();
		DateTimeFormatter dtf = DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss");

		String now = LocalDateTime.now().format(dtf);
		List<ClassRoom> memberList = service.selectListClassMember(vo);
		model.addAttribute("memberList", memberList);
		String korean = "";

		for (int i = 4; i >= 0; i--) {
			days.add(String.valueOf(today.minusDays(i)));

			switch (today.minusDays(i).getDayOfWeek()) {
			case MONDAY:
				korean = "?????????";
				break;
			case TUESDAY:
				korean = "?????????";
				break;
			case WEDNESDAY:
				korean = "?????????";
				break;
			case THURSDAY:
				korean = "?????????";
				break;
			case FRIDAY:
				korean = "?????????";
				break;
			case SATURDAY:
				korean = "?????????";
				break;
			case SUNDAY:
				korean = "?????????";
				break;
			}
			week.add(korean);
		}

		String startDate = String.valueOf(today.minusDays(4));
		String endDate = String.valueOf(today.plusDays(1));

		Map<String, String> dates = new HashMap<String, String>();
		dates.put("startDate", startDate);
		dates.put("endDate", endDate);
		dates.put("classSeq", classSeq);
		List<ClassRoom> attendList = service.enterLog(dates);

		Map<String, LocalDateTime[]> memberMap = new HashMap<String, LocalDateTime[]>();
		String memberName = "";
		String attendName = "";

		LocalDateTime attendDate = null;
		LocalDate _attendDate = null;
		for (int i = 0; i < memberList.size(); i++) {
			memberName = memberList.get(i).getCtcmName();
			LocalDateTime[] _tmp = new LocalDateTime[5];
			for (int j = 0; j < attendList.size(); j++) {
				attendName = attendList.get(j).getCtcmName();
				if (memberName.equals(attendName)) {
					attendDate = LocalDateTime.parse(attendList.get(j).getCtadRegDateTime(), dtf);
					_attendDate = LocalDate.from(attendDate);
					boolean flag = false;
					int t = 0;
					while (flag == false && t < 5) {
						if (_attendDate.equals(today.minusDays(t))) {

							System.out.println("????????????: " + memberName + "??? ????????? ??????");

							_tmp[4 - t] = attendDate;
							/*
							 * for(int tt = 0 ; tt < _tmp.length ; tt++) System.out.println(_tmp[tt]);
							 */
							flag = true;
						} else
							++t;
					}

				} else {

				}

			}
			System.out.println("????????????: " + memberName + " ????????????:" + _tmp[0] + " , " + _tmp[1] + " , " + _tmp[2] + " , " + _tmp[3] + " , " + _tmp[4]);

			memberMap.put(memberName, _tmp);
		}

		int a = 0;
		for (Entry<String, LocalDateTime[]> element : memberMap.entrySet()) {
			System.out.println(element.getKey());
			LocalDateTime[] tmp = element.getValue();
			LocalDateTime _tmp = tmp[4];
			System.out.println("???????????? : " + _tmp);
			System.out.println();
			if (_tmp != null)
				a++;
			else {
			}
			;

		}

		int memberNum = memberList.size();

		String totalAtt = String.valueOf(a) + "/" + String.valueOf(memberNum);

		int attendRate = (int) (((double) a / memberNum) * 100);

		System.out.println("?????????:" + attendRate);

		System.out.println("?????????" + memberMap.get("?????????"));

		System.out.println("????????? :" + startDate);
		System.out.println("????????????:" + endDate);
		System.out.println("???????????????:" + classSeq);
		model.addAttribute("totalAtt", totalAtt);
		model.addAttribute("attendRate", attendRate);
		model.addAttribute("log", memberMap);
		model.addAttribute("day", days);
		model.addAttribute("week", week);
		model.addAttribute("now", now);
		model.addAttribute("memberList", memberList);
		model.addAttribute("attendList", attendList);
		return "member/classroom/teacher/classAttendance";
	}

	@RequestMapping(value = "member/class/common/postview")
	public String classPostView(@ModelAttribute("vo") ClassRoomVo vo, ClassRoom dto, Model model, HttpSession httpSession) throws Exception {
		vo.setCtcsSeq((String) httpSession.getAttribute("ctcsSeq"));
		System.out.println("vo.getCtcsSeq :" + vo.getCtcsSeq());
		service.hitUpdate(dto); // ????????? ??????

//		?????????
		ClassRoom rt = service.selectOneClassPost(vo);
		model.addAttribute("item", rt);

		ClassRoom ytb = service.selectOneClassPostUrl(vo);
		model.addAttribute("ytb", ytb);

//		???????????????
		List<ClassRoom> memberList = service.selectListClassMember(vo);
		model.addAttribute("memberList", memberList);

//		???????????????
		List<ClassRoom> replyList = service.selectListReply(vo);
		model.addAttribute("replyList", replyList);
// 		????????? ??????
		dto.setCtcmSeq((String) httpSession.getAttribute("ctcmSeq"));
		int totalLikes = service.countLike(dto);
		boolean checkLikeOrNot = false;
		model.addAttribute("countLike", totalLikes);
		System.out.println("vo.getCtptSeq():" + vo.getCtptSeq());

		System.out.println("checkLikes: " + service.checkLike(dto));
		if (service.checkLike(dto) == 1) {
			checkLikeOrNot = true;
		} else {
			checkLikeOrNot = false;
		}
		model.addAttribute("checkLikeOrNot", checkLikeOrNot);

		return "member/classroom/common/classPostView";
	}

	// ????????? ??????
	@RequestMapping(value = "member/class/common/replyInst")
	public String replyInst(@ModelAttribute("vo") ClassRoomVo vo, ClassRoom dto, Model model, HttpSession httpSession, RedirectAttributes redirectAttributes) throws Exception {

		vo.setCtcsSeq((String) httpSession.getAttribute("ctcsSeq"));
		System.out.println("vo.getCtcsSeq :" + vo.getCtcsSeq());

//		????????????
		service.insertReply(dto);

		System.out.println("dto.getCtrpWriter() : " + dto.getCtrpWriter());

		redirectAttributes.addFlashAttribute("vo", vo);
		return "redirect:/member/class/common/postview";
	}

	// ????????? ????????????
	@RequestMapping(value = "/replyUele")
	public String replyUele(@ModelAttribute("vo") ClassRoomVo vo, ClassRoom dto, Model model, HttpSession httpSession, RedirectAttributes redirectAttributes) throws Exception {

		vo.setCtcsSeq((String) httpSession.getAttribute("ctcsSeq"));
		System.out.println("vo.getCtcsSeq :" + vo.getCtcsSeq());

//		????????????
		service.updateReplyUele(dto);

//		vo.setCtrpSeq(dto.getCtrpSeq());
		System.out.println("vo.getCtrpSeq()1 : " + vo.getCtrpSeq());

		redirectAttributes.addFlashAttribute("vo", vo);
		return "redirect:/member/class/common/postview";
	}

//	??????????????? 
	@RequestMapping(value = "member/class/common/homeworkPostView")
	public String homeworkPostView(@ModelAttribute("dto") ClassRoom dto, @ModelAttribute("vo") ClassRoomVo vo, Model model, HttpSession httpSession) throws Exception {

		vo.setCtcsSeq((String) httpSession.getAttribute("ctcsSeq"));
		vo.setCthsWriter((String) httpSession.getAttribute("ctcmSeq"));

//		???????????????
		List<ClassRoom> memberList = service.selectListClassMember(vo);
		model.addAttribute("memberList", memberList);

//		homeworkPostView
		ClassRoom rt = service.selectOneHomeworkSubmit(vo);
		model.addAttribute("item", rt);

//		???????????????
		List<ClassRoom> replyList = service.selectListHomeworkSubmitReply(vo);
		model.addAttribute("replyList", replyList);

		System.out.println("dto.getCthsSeq() : " + dto.getCthsSeq());
		System.out.println("vo.getCthsSeq() : " + vo.getCthsSeq());
		System.out.println("vo.getCthpSeq() : " + vo.getCthpSeq());
		System.out.println("rt.getCthpSeq() : " + rt.getCthpSeq());

		return "member/classroom/common/classHomeworkPostView";
	}

//	??????????????? ????????????
	@RequestMapping(value = "/homeworkSubmitReplyInst2")
	public String homeworkSubmitReplyInst2(@ModelAttribute("vo") ClassRoomVo vo, ClassRoom dto, Model model, HttpSession httpSession, RedirectAttributes redirectAttributes) throws Exception {

		vo.setCtcsSeq((String) httpSession.getAttribute("ctcsSeq"));
		System.out.println("vo.getCtcsSeq :" + vo.getCtcsSeq());

		vo.setCthsSeq(dto.getCthsSeq());
//		????????????
		service.insertHomeworkSubmitReply(dto);

		System.out.println("dto.getCtrpWriter() : " + dto.getCtrsWriter());
		System.out.println("??????????");

		vo.setCthsSeq(dto.getCthsSeq());
		vo.setCthpSeq(dto.getCthpSeq());
		System.out.println("vo.getCthsSeq() : " + vo.getCthsSeq());
		System.out.println("vo.getCthpSeq() : " + vo.getCthpSeq());

		redirectAttributes.addFlashAttribute("vo", vo);
		return "redirect:/member/class/common/homeworkPostView";
	}

//	???????????? ????????????
	@RequestMapping(value = "member/class/common/submitScoreUpdt")
	public String submitScoreUpdt(@ModelAttribute("vo") ClassRoomVo vo, ClassRoom dto, Model model, RedirectAttributes redirectAttributes, HttpSession httpSession) throws Exception {

		service.updateHomeworkSubmitScore(dto);

		vo.setCthpSeq(dto.getCthpSeq());
		vo.setCthsSeq(dto.getCthsSeq());
		System.out.println("cthsSeq : " + vo.getCthsSeq());
		System.out.println("cthpSeq : " + vo.getCthpSeq());
		redirectAttributes.addFlashAttribute("vo", vo);

		return "redirect:/member/class/common/homeworkview";
	}

//	????????????
	@RequestMapping(value = "member/class/common/homeworkview")
	public String postHomeworkview(@ModelAttribute("vo") ClassRoomVo vo, ClassRoom dto, Model model, HttpSession httpSession) throws Exception {

		vo.setMmSeq((String) httpSession.getAttribute("sessSeq"));
		vo.setCtcsSeq((String) httpSession.getAttribute("ctcsSeq"));

		ClassRoom rt2 = service.selectOneSidebar(vo);
		model.addAttribute("item", rt2);

//		homeworkView
		ClassRoom rt = service.selectOneClassHomework(vo);
		model.addAttribute("item", rt);

//		????????????
		List<ClassRoom> memberList = service.selectListClassMember(vo);
		model.addAttribute("memberList", memberList);

//		selectListHomeworkSubmit : ?????? ????????? ????????? ?????? ??????
		List<ClassRoom> submitList = service.selectListHomeworkSubmit(vo);
		model.addAttribute("submitList", submitList);

//		???????????????
//		List<ClassRoom> replyList = service.selectListHomeworkReply(vo);
//		model.addAttribute("replyList", replyList);

//		?????? ?????? ???
		int count = service.selectOneMemberCount(vo);
		vo.setTotalMembers(count);

//		?????? ????????? ?????? ???
		int countS = service.selectOneSubmitCount(vo);
		vo.setSubmitMembers(countS);

		vo.setCthsWriter((String) httpSession.getAttribute("ctcmSeq"));
		System.out.println("vo.getCthsWriter() : " + vo.getCthsWriter());
		System.out.println("vo.getCthpSeq() : " + vo.getCthpSeq());

		httpSession.setAttribute("teacherNy", rt2.getCtcmTeacherNy());
		System.out.println("httpSession.setAttribute(\"ctcsName\", rt2.getCtcmTeacherNy()) : " + rt2.getCtcmTeacherNy());

//		homeworkPostView(????????????)
//		??????
//		????????? ?????? ????????????
		ClassRoom rt3 = service.selectOneHomeworkSubmitStudent(vo);
		model.addAttribute("itemSubmit", rt3);

		return "member/classroom/common/classHomeworkView";

	}

//	??????????????? ?????? ??????
	@RequestMapping(value = "/homeworkReplyInst")
	public String homeworkReplyInst(@ModelAttribute("vo") ClassRoomVo vo, ClassRoom dto, Model model, HttpSession httpSession, RedirectAttributes redirectAttributes) throws Exception {

		vo.setCtcsSeq((String) httpSession.getAttribute("ctcsSeq"));
		System.out.println("vo.getCtcsSeq :" + vo.getCtcsSeq());

		ClassRoom rt = service.selectOneHomeworkSubmitStudent(vo);
		model.addAttribute("itemSubmit", rt);

//		????????????
		service.insertHomeworkReply(dto);

//		vo.setCthsSeq(dto.getCthsSeq());
//		vo.setCthpSeq(dto.getCthpSeq());
		System.out.println("dto.getCtrpWriter()?????? : " + dto.getCtrhWriter());
		System.out.println("vo.getCthpSeq()?????? : " + vo.getCthpSeq());

		redirectAttributes.addFlashAttribute("vo", vo);
		return "redirect:/member/class/common/homeworkview";
	}

//  ??????????????? ????????????
	@RequestMapping(value = "/homeworkReplyUele")
	public String homeworkReplyUele(@ModelAttribute("vo") ClassRoomVo vo, ClassRoom dto, Model model, HttpSession httpSession, RedirectAttributes redirectAttributes) throws Exception {

		vo.setCtcsSeq((String) httpSession.getAttribute("ctcsSeq"));
		System.out.println("vo.getCtcsSeq :" + vo.getCtcsSeq());

//		????????????
		service.updateHomeworkReplyUele(dto);

//		vo.setCthpSeq(dto.getCthpSeq());
		System.out.println("vo.getCthpSeq()2 : " + vo.getCthpSeq());

		redirectAttributes.addFlashAttribute("vo", vo);
		return "redirect:/member/class/common/homeworkview";
	}

//	??????????????? ????????????
	@RequestMapping(value = "/homeworkSubmitReplyInst")
	public String homeworkSubmitReplyInst(@ModelAttribute("vo") ClassRoomVo vo, ClassRoom dto, Model model, HttpSession httpSession, RedirectAttributes redirectAttributes) throws Exception {

		vo.setCtcsSeq((String) httpSession.getAttribute("ctcsSeq"));
		System.out.println("vo.getCtcsSeq :" + vo.getCtcsSeq());

//		????????????
		service.insertHomeworkSubmitReply(dto);

		System.out.println("dto.getCtrpWriter() : " + dto.getCtrsWriter());
		System.out.println("??????????");

//		vo.setCthsSeq(dto.getCthsSeq());
//		vo.setCthpSeq(dto.getCthpSeq());
		System.out.println("vo.getCthsSeq() : " + vo.getCthsSeq());
		System.out.println("vo.getCthpSeq() : " + vo.getCthpSeq());

		redirectAttributes.addFlashAttribute("vo", vo);
		return "redirect:/classHomeworkPostView_student";
	}

//  ??????????????? ????????????
	@RequestMapping(value = "/homeworkSubmitReplyUele")
	public String homeworkSubmitReplyUele(@ModelAttribute("vo") ClassRoomVo vo, ClassRoom dto, Model model, HttpSession httpSession, RedirectAttributes redirectAttributes) throws Exception {

		vo.setCtcsSeq((String) httpSession.getAttribute("ctcsSeq"));
		System.out.println("vo.getCtcsSeq :" + vo.getCtcsSeq());

//		????????????
		service.updateHomeworkSubmitReplyUele(dto);

//		vo.setCtrsSeq(dto.getCtrsSeq());
		System.out.println("vo.getCthsSeq()1 : " + vo.getCthsSeq());

		redirectAttributes.addFlashAttribute("vo", vo);
		return "redirect:/classHomeworkPostView_student";
	}

//	
//	????????????(?????????)
	@RequestMapping(value = "/classHomeworkUpload")
	public String classHomeworkUploaded(@ModelAttribute("vo") ClassRoomVo vo, ClassRoom dto, Model model, HttpSession httpSession) throws Exception {

		vo.setCtcsSeq((String) httpSession.getAttribute("ctcsSeq"));
		System.out.println("vo.getCtcsSeq :" + vo.getCtcsSeq());

		return "/member/classroom/teacher/classHomeworkUpload";
	}

// 
	@RequestMapping(value = "/classHomeworkUploadInst")
	public String classHomeworkUploadInst(@ModelAttribute("vo") ClassRoomVo vo, ClassRoom dto, Model model, RedirectAttributes redirectAttributes) throws Exception {

		service.insertHomeworkPost(dto);

		System.out.println("dto.getCthpSeq() : " + dto.getCthpSeq());
		System.out.println("dto.getCtcsSeq() : " + dto.getCtcsSeq());

		vo.setCthpSeq(dto.getCthpSeq());

		redirectAttributes.addFlashAttribute("vo", vo);
		return "redirect:/member/class/common/homeworkview";
	}

//	????????????(??????)
	@RequestMapping(value = "/classHomeworkSubmitUpload")
	public String classHomeworkSubmitUpload(@ModelAttribute("vo") ClassRoomVo vo, ClassRoom dto, Model model, HttpSession httpSession) throws Exception {

		vo.setCtcsSeq((String) httpSession.getAttribute("ctcsSeq"));
		System.out.println("vo.getCtcsSeq :" + vo.getCtcsSeq());
		System.out.println("vo.getCthpSeq :" + vo.getCthpSeq());

//		homeworkView
		ClassRoom rt = service.selectOneClassHomework(vo);
		model.addAttribute("item", rt);

		return "/member/classroom/student/classHomeworkSubmitUpload";
	}

//	????????????(??????)
	@RequestMapping(value = "/homeworkSubmitInst")
	public String homeworkSubmitInst(@ModelAttribute("vo") ClassRoomVo vo, ClassRoom dto, Model model, HttpSession httpSession, RedirectAttributes redirectAttributes) throws Exception {

		service.insertHomeworkSubmit(dto);

		vo.setCtcsSeq((String) httpSession.getAttribute("ctcsSeq"));
		System.out.println("vo.getCtcsSeq :" + vo.getCtcsSeq());
		System.out.println("dto.getCthpSeq() : " + dto.getCthpSeq());

		vo.setCthsSeq(dto.getCthsSeq());
		redirectAttributes.addFlashAttribute("vo", vo);
		return "redirect:/classHomeworkPostView_student";
	}

//	????????? ????????? ?????? ??????
	@RequestMapping(value = "/classHomeworkPostView_student")
	public String classHomeworkPostView_student(@ModelAttribute("vo") ClassRoomVo vo, ClassRoom dto, Model model, HttpSession httpSession) throws Exception {

		vo.setCtcsSeq((String) httpSession.getAttribute("ctcsSeq"));
		vo.setCthsWriter((String) httpSession.getAttribute("ctcmSeq"));

		List<ClassRoom> memberList = service.selectListClassMember(vo);
		model.addAttribute("memberList", memberList);

		ClassRoom rt = service.selectOneHomeworkSubmitStudent(vo);
		model.addAttribute("itemSubmit", rt);

//		???????????????
		List<ClassRoom> replyList = service.selectListHomeworkSubmitReply(vo);
		model.addAttribute("replyList", replyList);

		return "member/classroom/student/classHomeworkPostView_student";
	}

//	????????? ????????? ?????? ??????	
	@RequestMapping(value = "/classHomeworkSubmitEdit")
	public String classHomeworkSubmitEdit(@ModelAttribute("vo") ClassRoomVo vo, ClassRoom dto, Model model, HttpSession httpSession) throws Exception {

		vo.setCtcsSeq((String) httpSession.getAttribute("ctcsSeq"));
		vo.setCthsWriter((String) httpSession.getAttribute("ctcmSeq"));

		ClassRoom rt = service.selectOneHomeworkSubmitStudent(vo);
		model.addAttribute("itemSubmit", rt);

		return "member/classroom/student/classHomeworkSubmitEdit";
	}

//	
	@RequestMapping(value = "/classHomeworkSubmitEditUpdt")
	public String classHomeworkSubmitEditUpdt(@ModelAttribute("vo") ClassRoomVo vo, ClassRoom dto, Model model, RedirectAttributes redirectAttributes, HttpSession httpSession) throws Exception {

		service.updateHomeworkSubmit(dto);

		vo.setCthpSeq(dto.getCthpSeq());
		vo.setCthsSeq(dto.getCthsSeq());
		System.out.println("cthsSeq : " + vo.getCthsSeq());
		System.out.println("cthpSeq : " + vo.getCthpSeq());
		redirectAttributes.addFlashAttribute("vo", vo);
		return "redirect:/classHomeworkPostView_student";
	}

	@RequestMapping(value = "member/class/common/postedit")
	public String classPostEdit(@ModelAttribute("vo") ClassRoomVo vo, ClassRoom dto, Model model, HttpSession httpSession) throws Exception {

		return "member/classroom/common/classPostEdit";
	}

	@RequestMapping(value = "member/class/common/postedit2")
	public String classPostEdit2(@ModelAttribute("vo") ClassRoomVo vo, ClassRoom dto, Model model, HttpSession httpSession) {

		return "member/classroom/common/classPostEdit2";
	}

	@RequestMapping(value = "member/class/common/classGrade")
	public String classGrade(@ModelAttribute("vo") ClassRoomVo vo, ClassRoom dto, Model model, HttpSession httpSession) {

		return "member/classroom/common/classGrade";
	}

	@RequestMapping(value = "member/class/common/classGraded")
	public String classGraded(@ModelAttribute("vo") ClassRoomVo vo, ClassRoom dto, Model model, HttpSession httpSession) throws Exception {

//		System.out.println("?????? graded");
//		vo.setMmSeq((String) httpSession.getAttribute("sessSeq"));
//		vo.setCtcsSeq((String) httpSession.getAttribute("ctcsSeq"));
//		System.out.println("vo.getMmSeq :" + vo.getMmSeq());
//		System.out.println("vo.getCtcsSeq :" + vo.getCtcsSeq());
//
//		ClassRoom rt = service.selectOneHomeworkSubmitStudent(vo);
//		model.addAttribute("itemSubmit", rt);
//		
		return "member/classroom/common/classGraded";
	}

	@RequestMapping(value = "member/class/common/classGradeStandby")
	public String classGradeStandby(@ModelAttribute("vo") ClassRoomVo vo, ClassRoom dto, Model model, HttpSession httpSession) {

		return "member/classroom/common/classGradeStandby";
	}

	@ResponseBody
	@RequestMapping(value = "/modLike")
	public Map checkLike(@RequestBody ClassRoom dto, Model model, HttpSession httpSession) throws Exception {

		System.out.println("????????? ?????? ??????  ctcmSeq : " + dto.getCtcmSeq());
		System.out.println("?????????seq : " + dto.getCtptSeq());

		Map<String, Integer> checkAndTotal = new HashMap();

		if (service.checkLike(dto) == 0) {
			service.addLike(dto);
		} else {
			service.deleteLike(dto);
		}
		int checkLike = service.checkLike(dto);

		int totalLikes = service.countLike(dto);

		checkAndTotal.put("check", checkLike);
		checkAndTotal.put("total", totalLikes);

		return checkAndTotal;
	}

	
	
	public static String upload(MultipartHttpServletRequest mpr) throws Exception {
		Iterator<String> fileNames = mpr.getFileNames();
		
		String fileName = fileNames.next();
		MultipartFile mFile = mpr.getFile(fileName);
		
		String ogFileName = mFile.getOriginalFilename();
		
		File file = new File(IMG_DIRECTORY + sep + "temp" + sep +fileName);
		System.out.println("mfile??? ???????????? :" + mFile.getSize());
		if(mFile.getSize() !=0) {
			if(!file.exists()) {
				file.getParentFile().mkdirs();
				mFile.transferTo(new File(IMG_DIRECTORY + sep + "temp" + sep + ogFileName));
			}
		}
		return ogFileName;
	}
}