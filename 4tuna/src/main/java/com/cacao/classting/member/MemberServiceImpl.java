package com.cacao.classting.member;

import java.util.HashMap;
import java.util.List;

import org.apache.commons.lang3.RandomStringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.cacao.classting.common.util.UtilDateTime;
import com.cacao.classting.common.util.UtilUpload;


@Service
public class MemberServiceImpl implements MemberService{

	@Autowired
	MemberDao dao;

	@Override
	public Member selectOneLogin(Member dto) throws Exception {
		return dao.selectOneLogin(dto);
	}

	@Override
	public int insert(Member dto) throws Exception {
		
		dto.setRegDateTime(UtilDateTime.nowDate());
		dto.setRegDateTimeSvr(UtilDateTime.nowDate());
		dto.setModDateTime(UtilDateTime.nowDate());
		dto.setModDateTimeSvr(UtilDateTime.nowDate());
		
		dao.insert(dto);
		
		if(!dto.getFile0().isEmpty()) {
			
			String pathModule = this.getClass().getSimpleName().toString().toLowerCase().replace("serviceimpl", "");
			UtilUpload.uploadMember(dto.getFile0(), pathModule, dto);
		
			     dto.setTableName("ctMemberUploaded");
			     dto.setType(0);
			     dto.setDefaultNy(1);
			     dto.setSort(0);
			     dto.setDelNy(0);
			     dto.setPseq(dto.getMmSeq());
			     
			     dao.insertUploaded(dto);
					
			} else {
//		
				dto.setTableName("ctMemberUploaded");
			    dto.setType(0);
			    dto.setDefaultNy(1);
			    dto.setSort(0);
				dto.setOriginalName("profile2.png");
				dto.setUuidName("profile2.png");
				dto.setExt("png");
				dto.setSize(33177);
				dto.setDelNy(0);
				dto.setPath("/resources/uploaded/common/");
				dto.setPseq(dto.getMmSeq());
				dao.insertUploaded(dto);
			
			}
		return 1;
		
		
	}
	
	@Override
	public int insert(HashMap map) throws Exception {
		
		map.put("setRegDateTime", UtilDateTime.nowDate());
		dao.insert(map);
		return 1;
	}
	

	@Override
	public int update(Member dto) throws Exception {
		
		 dao.update(dto);
		  
	     String pathModule = this.getClass().getSimpleName().toString().toLowerCase().replace("serviceimpl", "");
	     UtilUpload.uploadMember(dto.getFile0(), pathModule, dto);
	     
	     dto.setTableName("ctMemberUploaded");
	     dto.setType(0);
	     dto.setDefaultNy(1);
	     dto.setSort(0);
	     dto.setDelNy(0);
	     dto.setPseq(dto.getMmSeq());
	     
	     dao.updateUploaded(dto);
	     
	     return 1;
	}

	@Override
	public Member selectOne(MemberVo vo) throws Exception {
		return dao.selectOne(vo);
	}

	@Override
	public int insertClass(Member dto) throws Exception {
		
		dto.setRegDateTime(UtilDateTime.nowDate());
		dto.setRegDateTimeSvr(UtilDateTime.nowDate());
		dto.setModDateTime(UtilDateTime.nowDate());
		dto.setModDateTimeSvr(UtilDateTime.nowDate());
		

		dto.setCtcsCode(RandomStringUtils.randomAlphanumeric(6).toUpperCase());
		dao.insertClass(dto);
		return 1;
	}

	@Override
	public int insertClassMember(Member dto) throws Exception {
		
		
		dao.insertClassMember(dto);
//		if(!dto.getFile0().isEmpty()) {
//		
//			String pathModule = this.getClass().getSimpleName().toString().toLowerCase().replace("serviceimpl", "");
//			UtilUpload.uploadMember(dto.getFile0(), pathModule, dto);
//			
//		     dto.setTableName("ctClassMemberUploaded");
//		     dto.setType(0);
//		     dto.setDefaultNy(1);
//		     dto.setSort(0);
//		     dto.setDelNy(0);
//		     dto.setPseq(dto.getCtcmSeq());
//		     
//		     dao.insertUploaded(dto);
//				
//		} else {
//			
//			dto.setTableName("ctClassMemberUploaded");
//		    dto.setType(0);
//		    dto.setDefaultNy(1);
//		    dto.setSort(0);
//			dto.setOriginalName("profile2.png");
//			dto.setUuidName("profile2.png");
//			dto.setExt("png");
//			dto.setSize(33177);
//			dto.setDelNy(0);
//			dto.setPath("/resources/uploaded/common/");
//			dto.setPseq(dto.getCtcmSeq());
//			dao.insertUploaded(dto);
//		}
		return 1;
	}

	@Override
	public Member selectOneClass(MemberVo vo) throws Exception {
		return dao.selectOneClass(vo);
	}

	@Override
	public List<Member> selectListClass(MemberVo vo) throws Exception {
		return dao.selectListClass(vo);
	}


//	@Override
//	public List<Member> selectListMemberUploaded(MemberVo vo) throws Exception {
//		return dao.selectListMemberUploaded(vo);
//	}
//
//	@Override
//	public int insertUploaded(Member dto) throws Exception {
//		return 0;
//	}
//
//	@Override
//	public int updateUploaded(Member dto) throws Exception {
//		return 0;
//	}

	@Override
	public List<Member> selectListMember(MemberVo vo) throws Exception {
		return dao.selectListMember(vo);
	}

	@Override
	public int deleteMember(MemberVo vo) throws Exception {
		
		return dao.deleteMember(vo);
	}

	@Override
	public Member selectOneMember(MemberVo vo) throws Exception {
		
		return dao.selectOneMember(vo);
	}
	
	@Override
	public int insertMember(Member dto) throws Exception {
		dto.setRegDateTime(UtilDateTime.nowDate());
		dto.setRegDateTimeSvr(UtilDateTime.nowDate());
		dto.setModDateTime(UtilDateTime.nowDate());
		dto.setModDateTimeSvr(UtilDateTime.nowDate());
		dao.insertMember(dto);
		return 1;
	}

	@Override
	public int updateMember(Member dto) throws Exception {
		
		
		
		 dao.updateMember(dto);
		  
	     String pathModule = this.getClass().getSimpleName().toString().toLowerCase().replace("serviceimpl", "");
	     UtilUpload.uploadMember(dto.getFile0(), pathModule, dto);
	     
	     dto.setTableName("ctMemberUploaded");
	     dto.setType(0);
	     dto.setDefaultNy(1);
	     dto.setSort(0);
	     dto.setDelNy(0);
	     dto.setPseq(dto.getMmSeq());
	     
	     dao.updateUploaded(dto);
		return 1;
	}
	
	@Override
	public int selectOneCountMember(MemberVo vo) throws Exception {
		
		return dao.selectOneCountMember(vo);
	}

	@Override
	public List<Member> selectListId(MemberVo vo) throws Exception {
		return dao.selectListId(vo);
	}

	@Override
	public List<Member> selectListNotice(MemberVo vo) throws Exception {
		return dao.selectListNotice(vo);
	}

	@Override
	public int deleteMemberMulti(MemberVo vo) throws Exception {
		return dao.deleteMemberMulti(vo);
	}

	@Override
	public Member selectOneClassCode(MemberVo vo) throws Exception {
		return dao.selectOneClassCode(vo);
	}

	@Override
	public List<Member> selectListPassword(MemberVo vo) throws Exception {
		return dao.selectListPassword(vo);
	}

	@Override
	public List<Member> selectListMemberUploaded(MemberVo vo) throws Exception {
		return dao.selectListMemberUploaded(vo);
	}

	@Override
	public int updateClassMember(Member dto) throws Exception {
		
		dao.updateClassMember(dto);
		if(!dto.getFile0().isEmpty()) {
			
				String pathModule = this.getClass().getSimpleName().toString().toLowerCase().replace("serviceimpl", "");
				UtilUpload.uploadMember(dto.getFile0(), pathModule, dto);
				
			     dto.setTableName("ctClassMemberUploaded");
			     dto.setType(0);
			     dto.setDefaultNy(1);
			     dto.setSort(0);
			     dto.setDelNy(0);
			     dto.setPseq(dto.getCtcmSeq());
			     
			     dao.insertUploaded(dto);
					
			} else {
				
				dto.setTableName("ctClassMemberUploaded");
			    dto.setType(0);
			    dto.setDefaultNy(1);
			    dto.setSort(0);
				dto.setOriginalName("profile2.png");
				dto.setUuidName("profile2.png");
				dto.setExt("png");
				dto.setSize(33177);
				dto.setDelNy(0);
				dto.setPath("/resources/uploaded/common/");
				dto.setPseq(dto.getCtcmSeq());
				dao.insertUploaded(dto);
			}
		return 1;
	}

	@Override
	public Member selectOneClassMember(MemberVo vo) throws Exception {
		return dao.selectOneClassMember(vo);
	}
	

}
