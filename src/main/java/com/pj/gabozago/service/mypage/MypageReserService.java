package com.pj.gabozago.service.mypage;

import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

import org.springframework.dao.DuplicateKeyException;

import com.pj.gabozago.domain.AccomReservationDTO;
import com.pj.gabozago.domain.AccomReviewDTO;
import com.pj.gabozago.domain.AccomReviewVO;
import com.pj.gabozago.domain.Criteria;
import com.pj.gabozago.domain.MemberDTO;
import com.pj.gabozago.domain.RefundVO;
import com.pj.gabozago.exception.DAOException;
import com.pj.gabozago.exception.ServiceException;


public interface MypageReserService {		// 숙소예약내역 페이지를 위한 서비스 객체

	
	// 총 레코드 건수를 반환하는 메소드(페이징 처리에 필요)
	public abstract int getTotal(Criteria cri, MemberDTO member) throws ServiceException;
		
		
	// 특정 회원의 숙소예약내역 리스트를 가져오는 메소드
	public abstract List<LinkedHashMap<String, Object>> getUserReserList(Criteria cri, MemberDTO member) throws ServiceException;
	
	
	// 예약내역 불러올 때, 예약상태 체크
	// 체크인날짜가 지났으면 DB에 예약상태를 CA -> UCRN로 변경
	// 체크아웃 날짜로부터 1년이 지났으면 DB에 예약상태를 UCRN -> UCRY로 변경
	public abstract void modifyReserStatus(MemberDTO member) throws ServiceException;
	
	
	// 특정 숙소예약내역 detail 페이지 정보 불러오는 메소드
	public abstract Map<String, Object> getOneReserDetail(AccomReservationDTO reser) throws ServiceException;
	
	
	// 숙소예약내역 취소(환불) 처리 메소드(트랜잭션 처리)
	public abstract RefundVO cancelReservaion(AccomReservationDTO reser) throws ServiceException;
	
	
	// 이미 취소되어있는 환불정보 불러오는 메소드
	public abstract RefundVO getRefundInfo(AccomReservationDTO reser) throws ServiceException;
	
	
	// 화면에 보여줄 용도의 리뷰페이지 숙소정보만 가져오는 메소드(사진, 숙소이름, 룸타입)
	public abstract Map<String, Object> getAccomInfo(AccomReservationDTO reser) throws ServiceException;
	
	
	// 새로운 리뷰 등록 처리 메소드(트랜잭션 처리)
	public abstract void registerNewReview(AccomReviewDTO review) throws ServiceException;
	
	
	// 같은 예약번호로 이미 등록된 리뷰가 있는지 체크
	public abstract AccomReviewVO checkDuplicationReview(AccomReviewDTO review) throws ServiceException;
		
	
} // end interface
