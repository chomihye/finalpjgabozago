package com.pj.gabozago.mapper;

import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

import com.pj.gabozago.domain.AccomDTO;
import com.pj.gabozago.domain.AccomRoomDTO;
import com.pj.gabozago.domain.MemberDTO;
import com.pj.gabozago.domain.MemberVO;
import com.pj.gabozago.domain.WishlistAccomDTO;
import com.pj.gabozago.exception.DAOException;


// 이 자바 인터페이스가 영속성 계층의 DAO 역할을 할,
// 마이바티스의 Mapper Interface로서의 역할 수행하도록 구현
public interface AccomMapper {
	

	// 전체 목록을 반환
	public abstract List<AccomDTO> getList() throws DAOException;
	public abstract List<AccomDTO> getListWithMember(MemberVO member) throws DAOException;
	
	// 숙소 상세 정보 반환
	public abstract Map<String, Object> getOneAccomDetail(AccomDTO accom) throws DAOException;

	//숙소의 방 리스트
	public abstract List<LinkedHashMap<String, Object>> selectRoomList(AccomDTO accom) throws DAOException;

	//숙소 방의 상세 정보 
	public abstract Map<String, Object> selectRoomDetail(AccomDTO accom) throws DAOException;

	//숙소 검색 결과 조회
	public abstract List<AccomDTO> selectSearchedAccomList(AccomDTO accom) throws DAOException;

	//로그인한 회원 정보 결제 페이지에 출력
	public abstract Map<String, Object> selectOneMemberInfo(MemberVO member) throws DAOException;

	//결제 페이지에 선택한 숙소 정보 가져오기
	public abstract Map<String, Object> selectOneRoomInfo(AccomRoomDTO room) throws DAOException;

	//위시리스트
	public abstract Object insertHotelLike(WishlistAccomDTO wishaccom) throws DAOException;
	

	
	
} // end interface
