package com.pj.gabozago.mapper;

import java.util.List;
import java.util.Map;

import com.pj.gabozago.domain.AccomDTO;
import com.pj.gabozago.domain.AccomRoomDTO;
import com.pj.gabozago.domain.AccomRoomVO;
import com.pj.gabozago.domain.AccomVO;
import com.pj.gabozago.domain.TravelLargeDTO;
import com.pj.gabozago.exception.DAOException;
import com.pj.gabozago.exception.ServiceException;


// 이 자바 인터페이스가 영속성 계층의 DAO 역할을 할,
// 마이바티스의 Mapper Interface로서의 역할 수행하도록 구현
public interface AccomMapper {
	

	// 전체 목록을 반환
	public abstract List<AccomDTO> getList() throws DAOException;
	
	// 숙소 단일 정보 반환
	public abstract Map<String, Object> getOneAccomDetail(AccomDTO accom) throws DAOException;
	

	
	
} // end interface
