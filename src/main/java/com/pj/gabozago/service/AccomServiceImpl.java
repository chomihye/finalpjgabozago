package com.pj.gabozago.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.pj.gabozago.domain.AccomDTO;
import com.pj.gabozago.domain.AccomRoomDTO;
import com.pj.gabozago.domain.AccomRoomVO;
import com.pj.gabozago.domain.AccomVO;
import com.pj.gabozago.exception.DAOException;
import com.pj.gabozago.exception.ServiceException;
import com.pj.gabozago.mapper.AccomMapper;

import lombok.Setter;
import lombok.extern.log4j.Log4j2;



@Log4j2

@Service
public class AccomServiceImpl
	implements AccomService {
	
	@Setter(onMethod_= @Autowired)
	private AccomMapper mapper;

	
	// 핵심비지니스로직: DB 게시판 테이블을 조회하여,
	// 게시글 전체목록을 얻어내고, 이 목록데이터를 호출자에 반환
	@Override
	public List<AccomDTO> getList() throws ServiceException {
		log.trace("getList() invoked.");
			
		try {
			log.info(mapper.getList());
			return mapper.getList();	
		}
		catch (DAOException e) { throw new ServiceException(e); } // try-catch
	}

//	@Override
//	public Map<String, Object> getOneAccomDetail(AccomDTO accom) throws ServiceException {
//		try {
//			return mapper.getOneAccomDetail(accom);
//		}
//		catch (DAOException e) { 
//			throw new ServiceException(e); 
//		} // try-catch
//	}
	
	@Override
	public List<AccomDTO> getdetailList(AccomDTO accom) throws ServiceException {
		try {
			
			return mapper.getdetailList(accom);	
		}
		catch (DAOException e) { throw new ServiceException(e); } // try-catch
	}
	
	






	
} // end class
