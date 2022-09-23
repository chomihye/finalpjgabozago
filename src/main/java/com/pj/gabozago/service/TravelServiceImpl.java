package com.pj.gabozago.service;

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



	@Override
	public void destroy() throws Exception {
		
	}

} // end class
