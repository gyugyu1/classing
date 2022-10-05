package com.cacao.classting.code;

import java.util.ArrayList;
import java.util.List;

import com.cacao.classting.code.Code;

public class Code {
	
//	infrCodeGroup
	private String ifcgSeq;
	
//	infrCode
	private String ifcdSeq;
	private String ifcdName;
	private Integer ifcdDelNy;
	private Integer ifcdOrder;
	
	public static List<Code> cachedCodeArrayList = new ArrayList<Code>();
	
	public String getIfcgSeq() {
		return ifcgSeq;
	}
	public void setIfcgSeq(String ifcgSeq) {
		this.ifcgSeq = ifcgSeq;
	}
	public String getIfcdSeq() {
		return ifcdSeq;
	}
	public void setIfcdSeq(String ifcdSeq) {
		this.ifcdSeq = ifcdSeq;
	}
	public String getIfcdName() {
		return ifcdName;
	}
	public void setIfcdName(String ifcdName) {
		this.ifcdName = ifcdName;
	}
	public Integer getIfcdDelNy() {
		return ifcdDelNy;
	}
	public void setIfcdDelNy(Integer ifcdDelNy) {
		this.ifcdDelNy = ifcdDelNy;
	}
	public Integer getIfcdOrder() {
		return ifcdOrder;
	}
	public void setIfcdOrder(Integer ifcdOrder) {
		this.ifcdOrder = ifcdOrder;
	}
	
	
	
}
