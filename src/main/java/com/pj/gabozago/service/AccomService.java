package com.pj.gabozago.service;

import java.util.List;

import com.pj.gabozago.domain.AccomDTO;
import com.pj.gabozago.domain.AccomRoomDTO;
import com.pj.gabozago.domain.AccomVO;
import com.pj.gabozago.exception.ServiceException;


public interface AccomService {
	

	//숙소 리스트
	public abstract List<AccomVO> getList() throws ServiceException;
	
	
	
	

	

	
	
	
	
	
	
	
}//end interface
