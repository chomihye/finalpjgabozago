package com.pj.gabozago.service.mypage;

import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DuplicateKeyException;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.pj.gabozago.domain.AccomPaymentVO;
import com.pj.gabozago.domain.AccomReservationDTO;
import com.pj.gabozago.domain.AccomReviewDTO;
import com.pj.gabozago.domain.AccomReviewVO;
import com.pj.gabozago.domain.Criteria;
import com.pj.gabozago.domain.MemberDTO;
import com.pj.gabozago.domain.RefundVO;
import com.pj.gabozago.exception.DAOException;
import com.pj.gabozago.exception.ServiceException;
import com.pj.gabozago.mapper.MypageReserMapper;

import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.extern.log4j.Log4j2;


@Log4j2
@NoArgsConstructor

@Service
//숙소예약내역 페이지를 위한 서비스 객체
public class MypageReserServiceImpl implements MypageReserService {

	
	@Setter(onMethod_ = {@Autowired})
	private MypageReserMapper mapper;
	
	
	// 총 레코드 건수를 반환하는 메소드(페이징 처리에 필요)
	@Override
	public int getTotal(Criteria cri, MemberDTO member) throws ServiceException {
		log.trace("getTotal() invoked.");
		
		try { return this.mapper.countTotalAmount(cri, member); } 
		catch (DAOException e) { throw new ServiceException(e); }
	} // getTotal
	
	
	// 특정 회원의 숙소예약내역 리스트를 가져오는 메소드
	@Override
	public List<LinkedHashMap<String, Object>> getUserReserList(Criteria cri, MemberDTO member) throws ServiceException {
		log.trace("getUserReserList() invoked.");
		
		try { return this.mapper.selectUserReserList(cri, member); } 
		catch (DAOException e) { throw new ServiceException(e); }
	}  // getUserReserList
	

	// 예약내역 불러올 때, 예약상태 체크(트랜잭션 필요하지 않음)
	@Override
	public void modifyReserStatus(MemberDTO member) throws ServiceException {
		try { 
			this.mapper.updateStatusCaToUcrn(member); 
			this.mapper.updateStatusUcrnToUcry(member);
		} catch (DAOException e) { 
			throw new ServiceException(e); 
		}
	} // modifyStatusCaToUcrn


	// 특정 숙소예약내역 detail 페이지 정보 불러오는 메소드
	@Override
	public Map<String, Object> getOneReserDetail(AccomReservationDTO reser) throws ServiceException {
		try { return this.mapper.selectOneReserDetail(reser); } 
		catch (DAOException e) { throw new ServiceException(e); }
	} // getOneReserDetail


	// 숙소예약내역 취소(환불) 처리 메소드(트랜잭션 처리)
	@Transactional
	@Override
	public RefundVO cancelReservaion(AccomReservationDTO reser) throws ServiceException {
		try { 
			AccomPaymentVO vo = this.mapper.selectPaymentInfo(reser); 	// (1) 결제정보 select
			this.mapper.insertRefund(vo);								// (2) 환불정보 insert (***)
			this.mapper.insertRefundPointHistory(vo);					// (3) 포인트 환불내역 insert (***)
			this.mapper.updateMemberPoint(vo); 							// (4) 회원테이블 포인트 update
			this.mapper.updateReserStatus(reser);						// (5) reservation 테이블 예약상태 update (***)
			return this.mapper.selectRefundInfo(reser);					// (6) 최종으로 환불정보 반환
		} catch (DAOException e) { 
			throw new ServiceException(e); 
		} // try-catch
	} // cancelReservaion


	// 이미 취소되어있는 환불정보 불러오는 메소드
	@Override
	public RefundVO getRefundInfo(AccomReservationDTO reser) throws ServiceException {
		try { return this.mapper.selectRefundInfo(reser); } 
		catch (DAOException e) { throw new ServiceException(e); }
	} // getRefundInfo


	// 화면에 보여줄 용도의 리뷰페이지 숙소정보만 가져오는 메소드(사진, 숙소이름, 룸타입)
	@Override
	public Map<String, Object> getAccomInfo(AccomReservationDTO reser) throws ServiceException {
		try { return this.mapper.selectAccomInfo(reser); } 
		catch (DAOException e) { throw new ServiceException(e); }
	} // getAccomInfo


	// 새로운 리뷰 등록 처리 메소드(트랜잭션 처리)
	@Transactional
	@Override
	public void registerNewReview(AccomReviewDTO review) throws ServiceException {
		try { 
			this.mapper.insertNewReview(review);  				// (1) 리뷰 테이블 insert (***)
			this.mapper.updateReserStatusAfterReview(review);   // (2) reservation 테이블 예약상태 update (***)
			this.mapper.insertReviewPointHistory(review); 		// (3) 리뷰작성 포인트 적립 insert (***)
			this.mapper.updateMemberPoint(review); 				// (4) 회원테이블 포인트 update
		} catch (DAOException e) { 
			throw new ServiceException(e); 
		} // try-catch
	} // registerNewReview


	// 같은 예약번호로 이미 등록된 리뷰가 있는지 체크
	@Override
	public AccomReviewVO checkDuplicationReview(AccomReviewDTO review) throws ServiceException {
		try { return this.mapper.selectDuplicationReview(review); } 
		catch (DAOException e) { throw new ServiceException(e); }
	} // checkDuplicationReview

	
} // end class
