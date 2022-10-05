package com.cacao.classting.zoom;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class ZoomServiceImpl implements ZoomService {

	@Autowired
	ZoomDao dao;
	
	
}
