package com.pj.gabozago.service;

import java.util.ArrayList;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Objects;


import org.springframework.beans.factory.DisposableBean;
import org.springframework.beans.factory.InitializingBean;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.pj.gabozago.domain.TravePlanlCreateVO;
import com.pj.gabozago.domain.TravePlanlDetailDTO;
import com.pj.gabozago.domain.TravelPlanDTO;
import com.pj.gabozago.domain.TravelPlanVO;
import com.pj.gabozago.exception.DAOException;
import com.pj.gabozago.exception.ServiceException;
import com.pj.gabozago.mapper.TravelMapper;

import lombok.Setter;
import lombok.extern.log4j.Log4j2;



@Log4j2

@Service("TravelServiceImpl")
public class TravelServiceImpl
	implements TravelService, InitializingBean, DisposableBean {
	
	@Setter(onMethod_= @Autowired)
	private TravelMapper mapper;
	
	
	@Override
	public boolean creat(TravelPlanDTO dto) throws ServiceException {
		log.trace("creat() invoked.");
		
		try { 
			return mapper.insertPlanSelectKey(dto) == 1; } 
		catch (DAOException e) { throw new ServiceException(e);}
	} // creat
	

	
	@Override
	public boolean creatDetail(TravePlanlDetailDTO dto) throws ServiceException {
		log.trace("creatDetail() invoked.");
		
		try { return mapper.insertPlanDetail(dto) == 1; } 
		catch (DAOException e) { throw new ServiceException(e);}
	}//creatDetail


	@Override
	public List<TravePlanlCreateVO> getList(Integer idx) throws ServiceException {
		log.trace("getList() invoked.");
		
		try { return mapper.selectList(idx); } 
		catch (DAOException e) { throw new ServiceException(e);}
	}//read
	
	
	@Override
	public void afterPropertiesSet() throws Exception {	// 전처리(Pre-processing)
		log.trace("afterPropertiesSet() invoked.");
		
		// 필드에 의존성 주입이 정상적인지 체크
		Objects.requireNonNull(this.mapper);			// 1st. method
		assert this.mapper != null;						// 2nd. method
		
		log.info("\t+ this.mapper: {}", this.mapper);
	}//afterPropertiesSet

	
//	others Plan ------------------------------------
	@Override
	public List<LinkedHashMap<String, Object>> getBestPlan() throws ServiceException {

		log.trace("getBestPlan() invoked.");
		
		try { 
			List<LinkedHashMap<String, Object>> finalList = new ArrayList<LinkedHashMap<String,Object>>();		// 최종데이터
			List<LinkedHashMap<String, Object>> tempList = this.mapper.selectBestList(); 		// 임시데이터
			
			for(int i = 0 ; i < tempList.size() ; i++) {
				LinkedHashMap<String, Object> finalMap = new LinkedHashMap<String, Object>();

				int idx = Integer.parseInt(String.valueOf(tempList.get(i).get("IDX")));
				int days = Integer.parseInt(String.valueOf(tempList.get(i).get("DAYS")));
				
				finalMap.put("itemNumber", i+1);
				finalMap.put("idx", idx);
				finalMap.put("largeAreaName", tempList.get(i).get("LARGE_AREA_NAME"));
				finalMap.put("nickname", tempList.get(i).get("NICKNAME"));
				finalMap.put("likes", tempList.get(i).get("LIKES"));
				finalMap.put("days", days);
				
				List<Integer> eachDays = new ArrayList<Integer>();
				
				for(int j = 1 ; j <= days ; j++) {
					List<LinkedHashMap<String, Object>> tempPlanDetail = this.mapper.selectPlanDetail(idx, j);
					finalMap.put("DAY" + j, tempPlanDetail);
					eachDays.add(j);
				} // inner-for
				
				finalMap.put("eachDays", eachDays);
				finalList.add(finalMap);	
			} // outer-for
			
			return finalList;
		} catch (DAOException e) { 
			throw new ServiceException(e); 
		} // try-catch
		
	}


	@Override
	public void destroy() throws Exception {
		
	}

} // end class
