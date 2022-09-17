package com.pj.gabozago.service;

import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

import com.pj.gabozago.domain.AccomDTO;
import com.pj.gabozago.domain.AccomRoomDTO;
import com.pj.gabozago.domain.MemberDTO;
import com.pj.gabozago.domain.MemberVO;
import com.pj.gabozago.domain.WishlistAccomDTO;
import com.pj.gabozago.exception.DAOException;
import com.pj.gabozago.exception.ServiceException;


public interface AccomService {
	

	//숙소 전체목록 조회
	public abstract List<AccomDTO> getList() throws ServiceException;
	public abstract List<AccomDTO> getListWithMember(MemberVO member) throws ServiceException;
	
	//숙소 이름 상세 페이지에 반영
	public abstract Map<String, Object> getOneAccomDetail(AccomDTO accom) throws ServiceException;

	//숙소 하위 방 목록 조회
	public abstract List<LinkedHashMap<String, Object>> getRoomList(AccomDTO accom) throws ServiceException;

	//숙소 방 한개당 상세 정보 조회
	public abstract Map<String, Object> getOneRoomDetail(AccomDTO accom) throws ServiceException;

	//숙소 검색결과 목록 조회
	public abstract List<AccomDTO> getSearchedList(AccomDTO accom) throws ServiceException;

	//로그인한 회원 정보 결제 페이지에 출력
	public abstract Map<String, Object> getOneMemberInfo(MemberVO member) throws ServiceException;
	
	//결제 페이지에 선택한 숙소 정보 가져오기
	public abstract Map<String, Object> getOneRoomInfo(AccomRoomDTO room) throws ServiceException;

	//위시리스트
	public abstract Map<String, Object> setHotelLike(WishlistAccomDTO wishaccom) throws ServiceException, DAOException;
	


	


	
	
	
	

	

	
	
	
	
	
	
	
}//end interface
