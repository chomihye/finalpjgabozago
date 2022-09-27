package com.pj.gabozago.mapper;

import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;

import com.pj.gabozago.domain.AccomDTO;
import com.pj.gabozago.domain.AccomPaymentDTO;
import com.pj.gabozago.domain.AccomReservationDTO;
import com.pj.gabozago.domain.AccomRoomDTO;
import com.pj.gabozago.domain.Criteria;
import com.pj.gabozago.domain.MemberDTO;
import com.pj.gabozago.domain.MemberVO;
import com.pj.gabozago.domain.WishlistAccomDTO;
import com.pj.gabozago.exception.DAOException;


// 이 자바 인터페이스가 영속성 계층의 DAO 역할을 할,
// 마이바티스의 Mapper Interface로서의 역할 수행하도록 구현
public interface AccomMapper {
	
	//헤더 검색 기능
	public abstract List<AccomDTO> selectSearchKeyword(@Param("cri") Criteria cri,@Param("keyword")String keyword) throws DAOException;

	//헤더 검색 결과 총 레코드 건수 반환
	public abstract Integer getTotalKeywordSearch(@Param("keyword")String keyword,AccomDTO accom) throws DAOException;
	
//	-----------------------------------------------------------------------------------------------------------
	

	// 전체 목록을 반환
	public abstract List<AccomDTO> getList(@Param("cri") Criteria cri) throws DAOException;
	public abstract List<AccomDTO> getListWithMember(@Param("cri") Criteria cri, @Param("member") MemberVO member) throws DAOException;
	
	//숙소 검색 결과 조회
	public abstract List<AccomDTO> selectSearchedAccomList(AccomDTO accom) throws DAOException;
	public abstract List<AccomDTO> selectSearchedAccomListWithMember(AccomDTO accom) throws DAOException;
	
	// 총 레코드 건수를 반환하는 메소드(페이징 처리에 필요)
	public abstract Integer getTotalHotelCount(AccomDTO accom) throws DAOException;
	
	// 숙소 상세 정보 반환
	public abstract Map<String, Object> getOneAccomDetail(AccomDTO accom) throws DAOException;

	//숙소의 방 리스트
	public abstract List<LinkedHashMap<String, Object>> selectRoomList(AccomDTO accom) throws DAOException;
	
	//숙소의 후기 목록
	public abstract List<LinkedHashMap<String, Object>> selectHotelReviewList(AccomDTO accom) throws DAOException;
	
	//숙소 리뷰 평균
	public abstract Map<String, Object> selectHotelAvgReview(AccomDTO accom) throws DAOException;
	
	//숙소 방의 상세 정보 
	public abstract Map<String, Object> selectRoomDetail(AccomDTO accom) throws DAOException;

	//로그인한 회원 정보 결제 페이지에 출력
	public abstract Map<String, Object> selectOneMemberInfo(MemberVO member) throws DAOException;

	//결제 페이지에 선택한 숙소 정보 가져오기
	public abstract Map<String, Object> selectOneRoomInfo(AccomRoomDTO room) throws DAOException;

	//위시리스트
	public abstract Map<String, Object> selectHotelLike(WishlistAccomDTO wishaccom) throws DAOException; // 기존 좋아요 유무 확인
	public abstract Integer selectCountHotelLike(WishlistAccomDTO wishaccom) throws DAOException; // 기존 좋아요 갯수 확인
	public abstract Integer insertHotelLike(WishlistAccomDTO wishaccom) throws DAOException; // 좋아요 등록
	public abstract Integer deleteHotelLike(WishlistAccomDTO wishaccom) throws DAOException; // 좋아요 삭제
	
	// 특정 회원의 member 테이블에 현재 포인트를 점검하는 메소드
	public abstract void updateMemberPoint(MemberVO member) throws DAOException;
		
	// 특정 회원의 현재 포인트를 가져오는 메소드
	@Select("SELECT point FROM tbl_member WHERE idx = #{idx}")
	public abstract Integer selectUserCurrentPoint(MemberVO member);
	
	//오늘 마지막 예약정보 조회
	public abstract Integer getLastSeq() throws DAOException;
		
	//예약정보 DB에 저장
	public abstract Integer insertReservation(AccomReservationDTO reservation) throws DAOException;
		
	//결제정보 DB에 저장
	public abstract Integer insertPayment(AccomPaymentDTO payment) throws DAOException;
	
	
	
} // end interface
