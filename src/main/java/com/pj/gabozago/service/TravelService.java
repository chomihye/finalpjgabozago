package com.pj.gabozago.service;

import java.util.LinkedHashMap;
import java.util.List;

import com.pj.gabozago.domain.TravePlanlCreateVO;
import com.pj.gabozago.domain.TravePlanlDetailDTO;
import com.pj.gabozago.domain.TravelPlanDTO;
import com.pj.gabozago.domain.TravelPlanVO;
import com.pj.gabozago.exception.ServiceException;

//DAO와 다름. 게시판의 요구사항을 처리하는 인터페이스이다.
//인터페이스로 구현해야 한다.
public interface TravelService {
	
	//1. 계획 저장 
	public abstract boolean creat(TravelPlanDTO dto) throws ServiceException;
	
	//2. 계획 세부 저장 
	public abstract boolean creatDetail(TravePlanlDetailDTO dto) throws ServiceException;
	
	//3. 계획 조회 
	public abstract List<TravePlanlCreateVO> getList(Integer idx) throws ServiceException;
		
	//4.인기 일정 조회
	public abstract List<LinkedHashMap<String, Object>> getBestPlan() throws ServiceException;


} // end interface 
