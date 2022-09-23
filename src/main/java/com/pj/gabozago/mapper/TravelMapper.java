package com.pj.gabozago.mapper;


import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.pj.gabozago.domain.TravePlanlCreateVO;
import com.pj.gabozago.domain.TravePlanlDetailDTO;
import com.pj.gabozago.domain.TravelPlanDTO;
import com.pj.gabozago.domain.TravelPlanVO;
import com.pj.gabozago.exception.DAOException;


public interface TravelMapper {
	
	//tbl_travel_plan에 insert
	public abstract Integer insertPlanSelectKey(TravelPlanDTO dto) throws DAOException;
	
	//tbl_travel_plan_detail에 insert
	public abstract Integer insertPlanDetail(TravePlanlDetailDTO dto) throws DAOException;
	
	//일정 GET 
	public abstract List<TravePlanlCreateVO> selectList(@Param("idx") Integer idx) throws DAOException;
	
	
	
		
	
		

}//end interface 
