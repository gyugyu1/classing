package com.cacao.classting.code;

import java.util.List;

import javax.annotation.Resource;
import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;


@Repository
public class CodeDao {

	@Inject
	@Resource(name="sqlSession")
	private SqlSession sqlSession;
	
	private static String namespace = "com.cacao.classting.code.CodeMpp";
	
	public List<Code> selectListForCache(){List<Code> list = sqlSession.selectList(namespace + ".selectListForCache",""); return list;}

}
