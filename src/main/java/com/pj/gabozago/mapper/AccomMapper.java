package com.pj.gabozago.mapper;

import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

import com.pj.gabozago.domain.AccomDTO;
import com.pj.gabozago.exception.DAOException;


// 이 자바 인터페이스가 영속성 계층의 DAO 역할을 할,
// 마이바티스의 Mapper Interface로서의 역할 수행하도록 구현
public interface AccomMapper {
	

	// 전체 목록을 반환
	public abstract List<AccomDTO> getList() throws DAOException;
	
	// 숙소 상세 정보 반환
	public abstract Map<String, Object> getOneAccomDetail(AccomDTO accom) throws DAOException;

	//숙소의 방 리스트
	public abstract List<LinkedHashMap<String, Object>> selectRoomList(AccomDTO accom) throws DAOException;

	//숙소 방의 상세 정보 
	public abstract Map<String, Object> selectRoomDetail(AccomDTO accom) throws DAOException;

	//숙소 검색 결과 조회
	public abstract List<AccomDTO> selectSearchedAccomList(AccomDTO accom) throws DAOException;
	

	
	
} // end interface
