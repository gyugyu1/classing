package com.cacao.classting.member;

import java.util.HashMap;
import java.util.List;

public interface MemberService {
	
	public Member selectOne(MemberVo vo) throws Exception;
	public int insert(Member dto) throws Exception;
	public int insert(HashMap map) throws Exception;
	public int update(Member dto) throws Exception;
	public Member selectOneLogin(Member dto) throws Exception;
	public List<Member> selectListId(MemberVo vo) throws Exception;
	public List<Member> selectListPassword(MemberVo vo) throws Exception;
	public List<Member> selectListMemberUploaded(MemberVo vo) throws Exception;
	
	public int insertClass(Member dto) throws Exception;
	public int insertClassMember(Member dto) throws Exception;
	public Member selectOneClass(MemberVo vo) throws Exception;
	public Member selectOneClassCode(MemberVo vo) throws Exception;
	public List<Member> selectListClass(MemberVo vo) throws Exception;

	public int updateClassMember(Member dto) throws Exception;
	public Member selectOneClassMember(MemberVo vo) throws Exception;

	public List<Member> selectListNotice(MemberVo vo) throws Exception;
	
//admin
	
	public List<Member> selectListMember(MemberVo vo) throws Exception;

	public int deleteMember(MemberVo vo) throws Exception;

	public Member selectOneMember(MemberVo vo) throws Exception;
	
	public int selectOneCountMember(MemberVo vo) throws Exception;

	public int insertMember(Member dto) throws Exception;

	public int updateMember(Member dto) throws Exception;
	
	int deleteMemberMulti(MemberVo vo) throws Exception;
}