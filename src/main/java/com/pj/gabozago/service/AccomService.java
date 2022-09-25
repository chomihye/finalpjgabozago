package com.pj.gabozago.service;

import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

import com.pj.gabozago.domain.AccomDTO;
import com.pj.gabozago.domain.AccomReservationDTO;
import com.pj.gabozago.domain.AccomRoomDTO;
import com.pj.gabozago.domain.Criteria;
import com.pj.gabozago.domain.MemberDTO;
import com.pj.gabozago.domain.MemberVO;
import com.pj.gabozago.domain.WishlistAccomDTO;
import com.pj.gabozago.exception.DAOException;
import com.pj.gabozago.exception.ServiceException;


public interface AccomService {
	

	//숙소 전체목록 조회
	public abstract List<AccomDTO> getList(Criteria cri) throws ServiceException;
	public abstract List<AccomDTO> getListWithMember(Criteria cri, MemberVO member) throws ServiceException;
	
	//숙소 이름 상세 페이지에 반영
	public abstract Map<String, Object> getOneAccomDetail(AccomDTO accom) throws ServiceException;

	//숙소 하위 방 목록 조회
	public abstract List<LinkedHashMap<String, Object>> getRoomList(AccomDTO accom) throws ServiceException;
	//숙소 하위 리뷰 목록 조회
	public abstract List<LinkedHashMap<String, Object>> getHotelReviewList(AccomDTO accom) throws ServiceException;
	//숙소 리뷰 평균
	public abstract Map<String, Object> getHotelAvgReview(AccomDTO accom) throws ServiceException;

	//숙소 방 한개당 상세 정보 조회
	public abstract Map<String, Object> getOneRoomDetail(AccomDTO accom) throws ServiceException;

	//숙소 검색결과 목록 조회
	public abstract List<AccomDTO> getSearchedList(AccomDTO accom) throws ServiceException; //비로그인
 	public abstract List<AccomDTO> getSearchedListWithMember(AccomDTO accom) throws ServiceException; //로그인

	//로그인한 회원 정보 결제 페이지에 출력
	public abstract Map<String, Object> getOneMemberInfo(MemberVO member) throws ServiceException;
	
	//결제 페이지에 선택한 숙소 정보 가져오기
	public abstract Map<String, Object> getOneRoomInfo(AccomRoomDTO room) throws ServiceException;

	
	
	
	//위시리스트
	public abstract Map<String, Object> setHotelLike(WishlistAccomDTO wishaccom) throws ServiceException, DAOException;
	
	
	// 특정 회원의 현재 포인트를 가져오는 메소드
	public abstract Integer getUserCurrentPoint(MemberVO member) throws ServiceException;
	
	// 총 레코드 건수를 반환하는 메소드(페이징 처리에 필요)
	public abstract int getTotal(AccomDTO accom) throws ServiceException;
	
	
	
	
	


	


	
	
	
	

	

	
	
	
	
	
	
	
}//end interface
