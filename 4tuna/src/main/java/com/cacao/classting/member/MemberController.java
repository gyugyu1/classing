package com.cacao.classting.member;

import java.io.File;
import java.util.Enumeration;
import java.util.HashMap;
import java.util.List;
import java.util.Locale;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.apache.commons.io.FileUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.cacao.classting.classroom.ClassRoomController;
import com.cacao.classting.code.CodeServiceImpl;
import com.cacao.classting.common.constants.Constants;
import com.cacao.classting.common.util.UtilDateTime;

@Controller
public class MemberController {
	static String userDir= System.getProperty("user.dir");
	static String defaultDir = userDir.substring(0,userDir.length()-3);
	
	
	@Autowired
	MemberServiceImpl service;
	
	@RequestMapping(value = "/")
	public String a9xlab() {
		
		return "/index/index";
	}
//	@RequestMapping(value = "/index")
//	public String index() {
//		
//		return "index/index";
//	}
	
	@RequestMapping(value = "/main")
	public String main(@ModelAttribute("vo") MemberVo vo, Member dto, Model model, HttpSession httpSession) throws Exception  {
		
		vo.setMmSeq((String) httpSession.getAttribute("sessSeq") );
		System.out.println("이미지경로:" + ClassRoomController.IMG_DIRECTORY);
		
		
		List<Member> list = service.selectListClass(vo);
		model.addAttribute("list", list);
		
		List<Member> listNotice = service.selectListNotice(vo);
		model.addAttribute("listNotice", listNotice);
		
		System.out.println("httpSession.getAttribute(\"sessTeacher\") : "+httpSession.getAttribute("sessTeacher"));
		System.out.println("httpSession.getAttribute(\"sessPath\") : " + httpSession.getAttribute("sessPath"));
		System.out.println("httpSession.getAttribute(\"sessUuidName\") : " + httpSession.getAttribute("sessUuidName"));
		return "member/main";
	}
	@RequestMapping(value = "/classCodeSearch")
	public String classCodeSearch(@ModelAttribute("vo") MemberVo vo, Member dto, Model model, RedirectAttributes redirectAttributes, HttpSession httpSession) throws Exception {
		
		Member rt = service.selectOneClassCode(vo);	//입력받은 코드로 클래스 찾기
		model.addAttribute("item", rt);
	
		dto.setCtcsSeq(rt.getCtcsSeq()); //70번 insert할때 필요함

		service.insertClassMember(dto);
		
		vo.setCtcsSeq(dto.getCtcsSeq());
		redirectAttributes.addFlashAttribute("vo", vo);
		return "redirect:/classCode";
	}

	@RequestMapping(value = "/classCode")
	public String classCode(@ModelAttribute("vo") MemberVo vo, Member dto, Model model, HttpSession httpSession) throws Exception  {
		
		Member rt = service.selectOneClassCode(vo);	//클래스정보 가져옴
		model.addAttribute("item", rt);

		//클래스 가입시 들어갔던 기본값을 불러오기위한 set
		dto.setMmSeq((String) httpSession.getAttribute("sessSeq"));
		dto.setCtcsSeq(rt.getCtcsSeq());
		vo.setMmSeq(dto.getMmSeq());
		vo.setCtcsSeq(dto.getCtcsSeq());

		Member rt2 = service.selectOneClassMember(vo);
		model.addAttribute("itemMember", rt2);
		
		vo.setCtcmSeq(rt2.getCtcmSeq());
		System.out.println(vo.getCtcmSeq());
		return "member/classCode";
	}
	
	@RequestMapping(value = "/classCodeMemberUpdt")
	public String classCodeMemberUpdt(@ModelAttribute("vo") MemberVo vo, Member dto, Model model,RedirectAttributes redirectAttributes, HttpSession httpSession) throws Exception  {
		
		dto.setPseq(dto.getCtcmSeq());
		service.updateClassMember(dto);
		
		redirectAttributes.addFlashAttribute("vo", vo);
		return "redirect:/main";
	}

	@RequestMapping(value = "/login_xdmin")
	public String login_xdmin() throws Exception{
		
		return "xdmin/member/login_xdmin";
	}
	@RequestMapping(value = "/memberForm_xdmin")
	public String memberForm_xdmin() throws Exception{
		
		return "xdmin/member/memberForm_xdmin";
	}
	@RequestMapping(value = "/memberForm_main")
	public String memberForm_main(@ModelAttribute("vo") MemberVo vo, Model model) throws Exception {
		model.addAttribute("CodeLogin", CodeServiceImpl.selectListCachedCode("7"));
		return "member/memberForm_main";
	}
	
	@RequestMapping(value = "/memberForm_user")
	public String memberForm_user(@ModelAttribute("vo") MemberVo vo, Member dto, Model model) throws Exception{
		
		
		return "member/memberForm_user";
	}
	
	
	//회원가입
	@RequestMapping(value = "/memberInst")
	public String memberInst(Member dto, MemberVo vo, Model model, RedirectAttributes redirectAttributes, MultipartHttpServletRequest mr) throws Exception {
		
		String mmprofile = ClassRoomController.upload(mr);
		
		HashMap<String, Object> map = new HashMap<String, Object>();
		Enumeration enu = mr.getParameterNames();
		while(enu.hasMoreElements()) {
			String name = (String) enu.nextElement();
			String value = mr.getParameter(name);
			map.put(name,value);
		}
		
		String mmId = (String) map.get("mmId");
		
		
		if(mmprofile != null && mmprofile.length() !=0) {
			map.put("mmProfile", mmprofile);
		}
		
		try {
			if(mmprofile != null && mmprofile.length() !=0) {
				File srcFile = new File(ClassRoomController.IMG_DIRECTORY+ ClassRoomController.sep + "temp" + ClassRoomController.sep + mmprofile);
				File descFile = new File(ClassRoomController.IMG_DIRECTORY+ ClassRoomController.sep + "member" + ClassRoomController.sep + mmId);
				FileUtils.moveFileToDirectory(srcFile, descFile, true);
			}
		} catch (Exception e) {
			if(mmprofile != null && mmprofile.length() !=0) {
				System.out.println("업로드에러:" + e.getMessage());
				File srcFile = new File(ClassRoomController.IMG_DIRECTORY + ClassRoomController.sep + "temp" + ClassRoomController.sep + mmprofile);
				srcFile.delete(); // 에러 발생할시 임시폴더에 있던 파일 삭제
			}
		}
		
		
		
		service.insert(map);

		vo.setPseq(dto.getMmSeq());
		System.out.println("vo.getPseq(): "+vo.getPseq() );
		
		redirectAttributes.addFlashAttribute("vo",vo);
		return "redirect:/";
	}
	@RequestMapping(value = "/memberInfo")
	public String memberInfo(@ModelAttribute("vo") MemberVo vo, Member dto, Model model, HttpSession httpSession) throws Exception {

		System.out.println("httpSession.getAttribute(\"sessSeq\"): " + httpSession.getAttribute("sessSeq"));
		vo.setMmSeq((String) httpSession.getAttribute("sessSeq") );
		
		Member rt = service.selectOne(vo);
		model.addAttribute("item", rt);
		
		List<Member> uploadList = service.selectListMemberUploaded(vo);
		model.addAttribute("uploadList", uploadList);
		
		
		
		System.out.println("httpSession.getAttribute(sessPath) : "+httpSession.getAttribute("sessPath"));
		System.out.println("httpSession.getAttribute(sessUuidName) : "+httpSession.getAttribute("sessUuidName"));
		
		return "member/memberInfo";
	}
	
	@RequestMapping(value = "/memberInfoEdit")
	public String memberInfoEdit(@ModelAttribute("vo") MemberVo vo, Member dto, Model model, HttpSession httpSession) throws Exception{
		
		System.out.println("httpSession.getAttribute(\"sessSeq\"): " + httpSession.getAttribute("sessSeq"));
		vo.setMmSeq((String) httpSession.getAttribute("sessSeq") );
		
		Member rt = service.selectOne(vo);
		model.addAttribute("rt", rt);
		
		return "member/memberInfoEdit";
	}
	@RequestMapping(value = "/memberUpdt")
	public String memberUpdt(@ModelAttribute("vo") MemberVo vo, Member dto, Model model, RedirectAttributes redirectAttributes,HttpSession httpSession) throws Exception{

		service.update(dto);
		httpSession.setAttribute("sessUuidName", dto.getUuidName());
		httpSession.setAttribute("sessPath", dto.getPath());
		System.out.println("httpSession.getAttribute(\"sessSeq\") update맞냐: " + httpSession.getAttribute("sessSeq"));
		System.out.println("httpSession.getAttribute(\"sessSeq\") update맞냐: " + httpSession.getAttribute("sessPath"));
		System.out.println("httpSession.getAttribute(\"sessSeq\") update맞냐: " + httpSession.getAttribute("sessUuidName"));
		
		vo.setMmSeq((String) httpSession.getAttribute("sessSeq") );
		redirectAttributes.addFlashAttribute("vo",vo);
		
		return "redirect:/memberInfo";
	}
	
//	아이디찾기
	@RequestMapping(value = "/findId")
	public String findId(@ModelAttribute("vo") MemberVo vo, Member dto, Model model) throws Exception{
		
		List<Member> list = service.selectListId(vo);
		model.addAttribute("list", list);
		
		return "member/findId";
	}
	
	@ResponseBody
	@RequestMapping(value = "member/getId")
	public Map<String, Object> getId(MemberVo vo, Member dto, HttpSession httpSession, Model model) throws Exception {
		Map<String, Object> returnMap = new HashMap<String, Object>();
		
		List<Member> idList = service.selectListId(vo);
		model.addAttribute("idList", idList);
		
		returnMap.put("idList", idList);
		returnMap.put("rt", "success");
		
		return returnMap;
	}
//	비번찾기
	@RequestMapping(value = "/findPwd")
	public String findPwd(@ModelAttribute("vo") MemberVo vo, Member dto, Model model) throws Exception{
		
		List<Member> pwdList = service.selectListPassword(vo);
		model.addAttribute("pwdList", pwdList);
		
		return "member/findPwd";
	}
	@ResponseBody
	@RequestMapping(value = "member/getPassword")
	public Map<String, Object> getPassword(MemberVo vo, Member dto, HttpSession httpSession, Model model) throws Exception {
		Map<String, Object> returnMap = new HashMap<String, Object>();
		
		List<Member> pwdList = service.selectListPassword(vo);
		model.addAttribute("pwdList", pwdList);
		
		returnMap.put("pwdList", pwdList);
		returnMap.put("rt", "success");
		
		return returnMap;
	}
//	클래스생성
	
	@RequestMapping(value = "/classForm")
	public String classForm() throws Exception{
		
		return "member/classroom/teacher/classForm";
	}
	
	@RequestMapping(value = "/classForm2")
	public String classForm2() throws Exception{

		
		return "member/classroom/teacher/classForm2";
	}
	
	@RequestMapping(value = "/classInst")
	public String classInst(@ModelAttribute("vo") MemberVo vo, Member dto, Model model, RedirectAttributes redirectAttributes, HttpSession httpSession) throws Exception {
		
		service.insertClass(dto);
		
		vo.setMmSeq((String) httpSession.getAttribute("sessSeq") );
		vo.setCtcsSeq(dto.getCtcsSeq());
		
		System.out.println("httpSession.getAttribute(\"sessSeq\") : " + httpSession.getAttribute("sessSeq"));
		System.out.println("vo.getCtcsSeq() inst: " +vo.getCtcsSeq());
		System.out.println("dto.getCtcsSeq() inst: " +dto.getCtcsSeq());
		
		redirectAttributes.addFlashAttribute("vo",vo);
		return "redirect:/classForm3";
	}
	
	
	@RequestMapping(value = "/classForm3", method = RequestMethod.GET)
	public String classForm3(@ModelAttribute("vo") MemberVo vo, Model model, Member dto, HttpSession httpSession) throws Exception{
		
		Member rt = service.selectOneClass(vo);
		model.addAttribute("item", rt);
		
		vo.setMmSeq((String) httpSession.getAttribute("sessSeq") );
		System.out.println("httpSession.getAttribute(\"sessSeq\") : " + httpSession.getAttribute("sessSeq"));

		
		return "member/classroom/teacher/classForm3";
	}
	@RequestMapping(value = "/classMemberInst")
	public String classMemberInst(Member dto, MemberVo vo, Model model, RedirectAttributes redirectAttributes, HttpSession httpSession) throws Exception {
		
		service.insertClassMember(dto);

		vo.setMmSeq((String) httpSession.getAttribute("sessSeq") );
		System.out.println("httpSession.getAttribute(\"sessSeq\") : " + httpSession.getAttribute("sessSeq"));
		System.out.println("dto.getCtcsSeq() : " +vo.getCtcsSeq());
		
		
		redirectAttributes.addFlashAttribute("vo",vo);
		return "redirect:/main";
	}
	
	
	
	@RequestMapping(value = "/classList")
	public String classList(@ModelAttribute("vo") MemberVo vo, Member dto, Model model, HttpSession httpSession) throws Exception {
		
		vo.setMmSeq((String) httpSession.getAttribute("sessSeq") );
		System.out.println("httpSession.getAttribute(\"sessSeq\") : " + httpSession.getAttribute("sessSeq"));
		
		List<Member> list = service.selectListClass(vo);
		model.addAttribute("list", list);
		
		return "member/classList";
	}
	
	
//	기본로그인
	@ResponseBody
	@RequestMapping(value = "member/loginProc", method = { RequestMethod.GET, RequestMethod.POST })
	public Map<String, Object> loginProc(Member dto, HttpSession httpSession) throws Exception {
		Map<String, Object> returnMap = new HashMap<String, Object>();
		
		Member rtMember = service.selectOneLogin(dto);
		
		if(rtMember != null) {
//			rtMember = service.selectOneLogin(dto);
			if(rtMember.getMmSeq() != null) {
				httpSession.setMaxInactiveInterval(60 * Constants.SESSION_MINUTE);
				
				httpSession.setAttribute("sessSeq", rtMember.getMmSeq());
				httpSession.setAttribute("sessSeq", rtMember.getMmSeq());
				httpSession.setAttribute("sessId", rtMember.getMmId());
				httpSession.setAttribute("sessName", rtMember.getMmName());
				httpSession.setAttribute("sessTeacher", rtMember.getMmTeacherNy());
				httpSession.setAttribute("sessPath", rtMember.getPath());
				httpSession.setAttribute("sessUuidName", rtMember.getUuidName());
				httpSession.setAttribute("ssesProfile", rtMember.getMmProfile());
				returnMap.put("rt", "success");
			} else {
				returnMap.put("rt", "fail");
			}
		} else {
			returnMap.put("rt", "fail");
		}
		return returnMap;
	}

	@ResponseBody	//	로그아웃
	@RequestMapping(value = "/member/logoutProc")
	public Map<String, Object> logoutProc(HttpSession httpSession) throws Exception {
		Map<String, Object> returnMap = new HashMap<String, Object>();
		httpSession.invalidate();
		returnMap.put("rt", "success");
		return returnMap;
	}
	
	//페북 로그인
		@ResponseBody
		@RequestMapping(value = "/member/FBLgProc")
		public Map<String, Object> FBLgProc(@RequestParam("mmName")String name, Member dto, HttpSession httpSession) throws Exception {
			Map<String, Object> returnMap = new HashMap<String, Object>();
			
			System.out.println("페북"+name);
			httpSession.setAttribute("sessName", name);
			httpSession.setAttribute("sessId","페이스북 회원입니다");
			httpSession.setAttribute("sessSeq","페이스북 회원입니다");
			
			returnMap.put("item", "success");
			
			return returnMap;	
		}
	
	
		// admin member
				@RequestMapping(value = "/adminMemberView") 
				public String adminMemberView(@ModelAttribute("vo") MemberVo vo, Model model) throws Exception  {
					  Member item = service.selectOne(vo);
					  model.addAttribute("item", item);
					return "xdmin/member/adminMemberView";
				}
				
				@RequestMapping(value = "/adminMemberEdit")
				public String adminMemberEdit(MemberVo vo, Model model)throws Exception  {
						
					 Member item = service.selectOne(vo);
					  
					  model.addAttribute("item", item);
					
					
					return "xdmin/member/adminMemberEdit";
				}
				
				@RequestMapping(value = "/adminMemberForm")
				public String adminMemberForm(@ModelAttribute("vo") MemberVo vo, Model model) throws Exception  {
					
					
					return "xdmin/member/adminMemberForm";
				}
				
				
				
				@RequestMapping(value = "/updateMember")
				public String updateMember(Member dto) throws Exception  {
					service.updateMember(dto);
					
					return "redirect:/adminMemberList";
				}
				
				@RequestMapping(value = "/insertMember")
				public String insertMember(Member dto) throws Exception  {
					service.insertMember(dto);
					
					return "redirect:/adminMemberList";
				}

				@RequestMapping(value = "/deleteMember") 
				public String deleteMember(MemberVo vo , RedirectAttributes redirectAttributes ) throws Exception {
					  service.deleteMember(vo);
						
					  
					  return "redirect:/adminMemberList";
				  }
				
				@RequestMapping(value = "/adminMemberList" /*method = RequestMethod.GET*/)
				public String adminMemberList(@ModelAttribute("vo") MemberVo vo, Model model) throws Exception {
					vo.setShDateStart(vo.getShDateStart() == null ? UtilDateTime.calculateDayString(UtilDateTime.nowLocalDateTime(), Constants.DATE_INTERVAL) : UtilDateTime.addStringTime(vo.getShDateStart()));
					vo.setShDateEnd(vo.getShDateEnd() == null ? UtilDateTime.nowString() : UtilDateTime.addStringTime(vo.getShDateEnd()));

					
					vo.setShOptionDate(vo.getShOptionDate() == null ? 0 : vo.getShOptionDate());
					vo.setShDateStart(vo.getShDateStart() == null ? UtilDateTime.calculateDayString(UtilDateTime.nowLocalDateTime(), Constants.DATE_INTERVAL) : UtilDateTime.add00TimeString(vo.getShDateStart()));
					vo.setShDateEnd(vo.getShDateEnd() == null ? UtilDateTime.nowString() : UtilDateTime.addNowTimeString(vo.getShDateEnd()));
					
					int count = service.selectOneCountMember(vo);
					vo.setParamsPaging(count);
					if(count !=0) {
						List<Member> list = service.selectListMember(vo);
						model.addAttribute("list", list);
					
					}
					else {
					//by pass	
						
					}
				
					return "xdmin/member/adminMemberList";
				}
	
				@RequestMapping(value = "/deleteMemberMulti") public String
				  deleteMemberMulti(MemberVo vo, RedirectAttributes redirectAttributes) throws Exception {

					  String[] checkboxSeqArray = vo.getCheckboxSeqArray();
					  System.out.println("vo.getCheckboxSeqArray():" + vo.getCheckboxSeqArray());
					  for(String checkboxSeq : checkboxSeqArray) {
						  vo.setMmSeq(checkboxSeq);
						  service.deleteMemberMulti(vo);
					  }
					  
					   
					  
					  
					  return "redirect:/adminMemberList";
				  }
	
	//------------------------------------------------------------------------------------------------------------
		
	@RequestMapping(value = "/test", method = RequestMethod.GET)
	public String test(Locale locale, Model model) {
				
		return "member/include/classCommon";
	}
	@RequestMapping(value = "/basetemplate", method = RequestMethod.GET)
	public String baseTemplate() {
		
		return "member/include/classBaseTemplate";
		
	}
	@RequestMapping(value = "/include", method = RequestMethod.GET)
	public String include() {
		
		return "member/include/classCommon";
	}
	
	@RequestMapping(value = "/side", method = RequestMethod.GET)
	public String side() {
		
		return "member/include/classSidebar";
	}
	
	@RequestMapping(value = "/nav", method = RequestMethod.GET)
	public String nav() {
		
		return "member/include/classNavbar";
	}
}