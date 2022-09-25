package com.pj.gabozago.mapper;

import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import com.pj.gabozago.domain.AccomPaymentVO;
import com.pj.gabozago.domain.AccomReservationDTO;
import com.pj.gabozago.domain.AccomReviewDTO;
import com.pj.gabozago.domain.AccomReviewVO;
import com.pj.gabozago.domain.Criteria;
import com.pj.gabozago.domain.MemberVO;
import com.pj.gabozago.domain.RefundVO;
import com.pj.gabozago.exception.DAOException;


public interface MypageReserMapper {		// 숙박예약내역 페이지 관련 mapper
	
	
	// 해당 회원의 숙소예약 리스트를 가져오는 메소드
	public abstract List<LinkedHashMap<String, Object>> selectUserReserList(@Param("cri") Criteria cri, @Param("member") MemberVO member) throws DAOException;
	
	// 예약내역 불러올 때, 체크인날짜가 지났으면 DB에 예약상태를 CA -> UCRN로 변경하는 메소드
	public abstract void updateStatusCaToUcrn(MemberVO member) throws DAOException;
	
	// 예약내역 불러올 때, 체크아웃 날짜로부터 1년이 지났으면 DB에 예약상태를 UCRN -> UCRY로 변경하는 메소드
	public abstract void updateStatusUcrnToUcry(MemberVO member) throws DAOException;
	
	// 특정 숙소예약내역 detail 페이지 정보 불러오는 메소드
	public abstract Map<String, Object> selectOneReserDetail(@Param("reser") AccomReservationDTO reser, @Param("member") MemberVO member) throws DAOException;
	
	// 예약취소 전 해당 예약내역의 결제정보를 불러오는 메소드 => cancelReservaion 서비스 트랜잭션 시작
	@Select("SELECT idx, reservation_idx, member_idx, order_price, use_point, payment_price, payment_type, insert_ts, update_ts \r\n"
			+ "FROM tbl_payment WHERE reservation_idx = #{idx}")
	public abstract AccomPaymentVO selectPaymentInfo(AccomReservationDTO reser) throws DAOException;
	
	// refund 테이블에 환불정보 추가
	@Insert("INSERT INTO tbl_refund (payment_idx, refund_price, refund_point) VALUES (#{idx}, #{paymentPrice}, #{usePoint})")
	public abstract void insertRefund(AccomPaymentVO vo) throws DAOException;
	
	// 결제취소 후 point_history 테이블에 포인트 환불내역 추가
	@Insert("INSERT INTO tbl_point_history (member_idx, point_amount, point_reason, is_plus) \r\n"
			+ "VALUES (#{memberIdx}, #{usePoint}, '결제취소 포인트 환불', 'Y')")
	public abstract void insertRefundPointHistory(AccomPaymentVO vo) throws DAOException;
	
	// 예약취소 후 member 테이블에 포인트 변경
	public abstract void updateMemberPoint(AccomPaymentVO vo) throws DAOException;
	
	// 예약취소 후 reservation 테이블에서 예약상태변경(CA -> CD)
	@Update("UPDATE tbl_reservation SET status = 'CD' WHERE idx = #{idx}")
	public abstract void updateReserStatus(AccomReservationDTO reser) throws DAOException;
	
	// 환불정보 불러오는 메소드 => cancelReservaion 서비스 트랜잭션 끝
	public abstract RefundVO selectRefundInfo(AccomReservationDTO reser) throws DAOException;
	
	// 화면에 보여줄 용도의 리뷰페이지 숙소정보만 가져오는 메소드(사진, 숙소이름, 룸타입)
	public abstract Map<String, Object> selectAccomInfo(@Param("reser") AccomReservationDTO reser, @Param("member") MemberVO member) throws DAOException;
	
	// 리뷰 등록시 review 테이블에 insert => registerNewReview 서비스 트랜잭션 시작
	public abstract void insertNewReview(AccomReviewDTO review) throws DAOException;
	
	// 예약정보 테이블 status 값 변경
	@Update("UPDATE tbl_reservation SET status = 'UCRY' WHERE idx = #{reservationIdx}")
	public abstract void updateReserStatusAfterReview(AccomReviewDTO review) throws DAOException;
	
	// 리뷰등록 후 point_history 테이블에 포인트 적립내역 추가
	@Insert("INSERT INTO tbl_point_history (member_idx, point_amount, point_reason, is_plus) \r\n"
			+ "VALUES (#{memberIdx}, 500, '숙박 리뷰 작성', 'Y')")
	public abstract void insertReviewPointHistory(AccomReviewDTO review) throws DAOException;
	
	// 리뷰등록 후 member 테이블에 포인트 변경 => registerNewReview 서비스 트랜잭션 끝
	public abstract void updateMemberPoint(AccomReviewDTO review) throws DAOException;
	
	// 같은 예약번호로 이미 등록된 리뷰가 있는지 체크
	public abstract AccomReviewVO selectDuplicationReview(AccomReviewDTO review) throws DAOException;
	
	
} // end interface
