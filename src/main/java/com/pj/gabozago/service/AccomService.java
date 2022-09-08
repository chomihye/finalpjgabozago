package com.pj.gabozago.service;

import java.util.List;
import java.util.Map;

import org.springframework.ui.Model;

import com.pj.gabozago.domain.AccomDTO;
import com.pj.gabozago.domain.AccomRoomDTO;
import com.pj.gabozago.domain.AccomVO;
import com.pj.gabozago.exception.ServiceException;


public interface AccomService {
	

	//숙소 전체목록보기
	public abstract List<AccomDTO> getList() throws ServiceException;
	
	//숙소 이름 상세 페이지에 반영
	//public abstract Map<String, Object> getOneAccomDetail(AccomDTO accom) throws ServiceException;
	
	public abstract List<AccomDTO> getdetailList(AccomDTO accom) throws ServiceException;

	


	
	
	
	

	

	
	
	
	
	
	
	
}//end interface
