package com.cacao.classting.code;

import java.util.ArrayList;
import java.util.List;

import javax.annotation.PostConstruct;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;


@Service
public class CodeServiceImpl implements CodeService {

	@Autowired
	CodeDao dao;
	
	@PostConstruct
	public void selectListForCache() {
		
		List<Code> codeListFromDb = (ArrayList<Code>) dao.selectListForCache();
		
		Code.cachedCodeArrayList.clear();
		Code.cachedCodeArrayList.addAll(codeListFromDb);
		System.out.println("cachedCodeArrayList : "+Code.cachedCodeArrayList.size() + " cached");
		
	}
	
	public static List<Code> selectListCachedCode(String ifcgSeq) throws Exception{
		List<Code> rt = new ArrayList<Code>();
		for(Code codeRow : Code.cachedCodeArrayList) {
			if(codeRow.getIfcgSeq().equals(ifcgSeq)) {
				rt.add(codeRow);
			}else {
				//by pass
			}
		}
		return rt;
	}

}
