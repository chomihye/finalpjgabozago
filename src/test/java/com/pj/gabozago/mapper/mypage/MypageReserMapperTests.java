package com.pj.gabozago.mapper.mypage;

import static org.junit.jupiter.api.Assertions.assertNotNull;

import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;
import java.util.Objects;
import java.util.concurrent.TimeUnit;

import org.junit.jupiter.api.BeforeAll;
import org.junit.jupiter.api.DisplayName;
import org.junit.jupiter.api.MethodOrderer.OrderAnnotation;
import org.junit.jupiter.api.Order;
import org.junit.jupiter.api.Test;
import org.junit.jupiter.api.TestInstance;
import org.junit.jupiter.api.TestInstance.Lifecycle;
import org.junit.jupiter.api.TestMethodOrder;
import org.junit.jupiter.api.Timeout;
import org.junit.jupiter.api.extension.ExtendWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit.jupiter.SpringExtension;

import com.pj.gabozago.domain.AccomPaymentVO;
import com.pj.gabozago.domain.AccomReservationDTO;
import com.pj.gabozago.domain.AccomReviewDTO;
import com.pj.gabozago.domain.AccomReviewVO;
import com.pj.gabozago.domain.Criteria;
import com.pj.gabozago.domain.MemberVO;
import com.pj.gabozago.domain.RefundVO;
import com.pj.gabozago.exception.DAOException;
import com.pj.gabozago.mapper.AdminReservMapper;
import com.pj.gabozago.mapper.MypageReserMapper;

import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.extern.log4j.Log4j2;


@Log4j2
@NoArgsConstructor

@ExtendWith(SpringExtension.class)
@ContextConfiguration(locations = "file:src/main/webapp/WEB-INF/spring/**/*-context.xml")

@TestInstance(Lifecycle.PER_CLASS)
@TestMethodOrder(OrderAnnotation.class)
public class MypageReserMapperTests {
	
	
	@Setter(onMethod_ = {@Autowired})
	private MypageReserMapper mapper;
	
	@Setter(onMethod_ = {@Autowired})
	private AdminReservMapper adminMapper;
	
	
	@BeforeAll
	void beforeAll() {
		log.trace("BeforeAll() invoked.");
		
		assertNotNull(this.mapper);
		log.info("\t+ this.mapper : {}", this.mapper);
	} // beforeAll
	
	
	@Test
	@Order(1)
	@DisplayName("1. testSelectUserReserList")
	@Timeout(value = 15, unit = TimeUnit.SECONDS)
	void testSelectUserReserList() throws DAOException {
		log.trace("testSelectUserReserList() invoked.");
		
		Criteria cri = new Criteria();
		cri.setAmount(10);
		
		MemberVO member = new MemberVO(53, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);

		List<LinkedHashMap<String, Object>> list = this.mapper.selectUserReserList(cri, member);
		
		Objects.requireNonNull(list);
		list.forEach(log::info);
	} // testSelectUserReserList
	
	
	@Test
	@Order(2)
	@DisplayName("2. testUpdateStatusCaToUcrn")
	@Timeout(value = 15, unit = TimeUnit.SECONDS)
	void testUpdateStatusCaToUcrn() throws DAOException {
		log.trace("testUpdateStatusCaToUcrn() invoked.");
		
		MemberVO member = new MemberVO(53, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);

		this.mapper.updateStatusCaToUcrn(member);
	} // testUpdateStatusCaToUcrn
	
	
	@Test
	@Order(3)
	@DisplayName("3. testSelectOneReserDetail")
	@Timeout(value = 15, unit = TimeUnit.SECONDS)
	void testSelectOneReserDetail() throws DAOException {
		log.trace("testSelectOneReserDetail() invoked.");
		
		AccomReservationDTO reser = new AccomReservationDTO();
		reser.setIdx(202203060001l);
		
		MemberVO member = new MemberVO(53, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);

		this.mapper.selectOneReserDetail(reser, member);
	} // testSelectOneReserDetail
	
	
	@Test
	@Order(4)
	@DisplayName("4. testSelectPaymentInfo")
	@Timeout(value = 15, unit = TimeUnit.SECONDS)
	void testSelectPaymentInfo() throws DAOException {
		log.trace("testSelectPaymentInfo() invoked.");
		
		AccomReservationDTO reser = new AccomReservationDTO();
		reser.setIdx(201912250001l);

		AccomPaymentVO vo = this.mapper.selectPaymentInfo(reser);
		log.info(">>>>>>>>>>>>>>>>>>>>>>>> vo : {}", vo);
	} // testSelectPaymentInfo
	
	
	@Test
	@Order(5)
	@DisplayName("5. testInsertRefund")
	@Timeout(value = 15, unit = TimeUnit.SECONDS)
	void testInsertRefund() throws DAOException {
		log.trace("testInsertRefund() invoked.");
		
		AccomReservationDTO reser = new AccomReservationDTO();
		reser.setIdx(201912250001l);

		AccomPaymentVO vo = this.mapper.selectPaymentInfo(reser);  

		this.mapper.insertRefund(vo);
	} // testInsertRefund
	
	
	@Test
	@Order(6)
	@DisplayName("6. testInsertRefundPointHistory")
	@Timeout(value = 15, unit = TimeUnit.SECONDS)
	void testInsertRefundPointHistory() throws DAOException {
		log.trace("testInsertRefundPointHistory() invoked.");
		
		AccomReservationDTO reser = new AccomReservationDTO();
		reser.setIdx(201912250001l);

		AccomPaymentVO vo = this.mapper.selectPaymentInfo(reser); 

		this.mapper.insertRefundPointHistory(vo);  
	} // testInsertRefundPointHistory
	
	
	@Test
	@Order(7)
	@DisplayName("7. testUpdateMemberPoint")
	@Timeout(value = 15, unit = TimeUnit.SECONDS)
	void testUpdateMemberPoint() throws DAOException {
		log.trace("testUpdateMemberPoint() invoked.");
		
		AccomReservationDTO reser = new AccomReservationDTO();
		reser.setIdx(201912250001l);

		AccomPaymentVO vo = this.mapper.selectPaymentInfo(reser); 

		this.mapper.updateMemberPoint(vo);  
	} // testUpdateMemberPoint
	
	
	@Test
	@Order(8)
	@DisplayName("8. testUpdateReserStatus")
	@Timeout(value = 15, unit = TimeUnit.SECONDS)
	void testUpdateReserStatus() throws DAOException {
		log.trace("testUpdateReserStatus() invoked.");
		
		AccomReservationDTO reser = new AccomReservationDTO();
		reser.setIdx(202209170001l);

		this.mapper.updateReserStatus(reser);  
	} // testUpdateReserStatus

	
	@Test
	@Order(9)
	@DisplayName("9. testSelectRefundInfo")
	@Timeout(value = 15, unit = TimeUnit.SECONDS)
	void testSelectRefundInfo() throws DAOException {
		log.trace("testSelectRefundInfo() invoked.");
		
		AccomReservationDTO reser = new AccomReservationDTO();
		reser.setIdx(201912250001l);

		RefundVO vo = this.mapper.selectRefundInfo(reser);
		log.info(">>>>>>>>>>>>>>>>>>>>>>>> vo : {}", vo);
	} // testSelectRefundInfo
	
	
	@Test
	@Order(10)
	@DisplayName("10. testSelectAccomInfo")
	@Timeout(value = 15, unit = TimeUnit.SECONDS)
	void testSelectAccomInfo() throws DAOException {
		log.trace("testSelectAccomInfo() invoked.");
		
		AccomReservationDTO reser = new AccomReservationDTO();
		reser.setIdx(202207300001l);
		
		MemberVO member = new MemberVO(53, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);

		Map<String, Object> map = this.mapper.selectAccomInfo(reser, member);
		log.info(">>>>>>>>>>>>>>>>>>>>>>>> map : {}", map);
	} // testSelectAccomInfo
	
	
	@Test
	@Order(11)
	@DisplayName("11. testInsertNewReview")
	@Timeout(value = 15, unit = TimeUnit.SECONDS)
	void testInsertNewReview() throws DAOException {
		log.trace("testInsertNewReview() invoked.");
		
		AccomReviewDTO review = new AccomReviewDTO(null, 201912250001l, 53, 30, 5, 5, 5, null);

		this.mapper.insertNewReview(review);
	} // testInsertNewReview
	
	
	@Test
	@Order(12)
	@DisplayName("12. testUpdateReserStatusAfterReview")
	@Timeout(value = 15, unit = TimeUnit.SECONDS)
	void testUpdateReserStatusAfterReview() throws DAOException {
		log.trace("testUpdateReserStatusAfterReview() invoked.");
		
		AccomReviewDTO review = new AccomReviewDTO(null, 201912250001l, 53, 30, 5, 5, 5, null);

		this.mapper.updateReserStatusAfterReview(review);
	} // testUpdateReserStatusAfterReview
	
	
	@Test
	@Order(13)
	@DisplayName("13. testInsertReviewPointHistory")
	@Timeout(value = 15, unit = TimeUnit.SECONDS)
	void testInsertReviewPointHistory() throws DAOException {
		log.trace("testInsertReviewPointHistory() invoked.");
		
		AccomReviewDTO review = new AccomReviewDTO(null, 201912250001l, 53, 30, 5, 5, 5, null);

		this.mapper.insertReviewPointHistory(review);
	} // testInsertReviewPointHistory
	
	
	@Test
	@Order(13)
	@DisplayName("13. testUpdateMemberPointAfterReview")
	@Timeout(value = 15, unit = TimeUnit.SECONDS)
	void testUpdateMemberPointAfterReview() throws DAOException {
		log.trace("testUpdateMemberPointAfterReview() invoked.");
		
		AccomReviewDTO review = new AccomReviewDTO(null, 201912250001l, 53, 30, 5, 5, 5, null);

		this.mapper.updateMemberPoint(review);
	} // testUpdateMemberPointAfterReview
	
	
	@Test
	@Order(14)
	@DisplayName("14. testSelectDuplicationReview")
	@Timeout(value = 15, unit = TimeUnit.SECONDS)
	void testSelectDuplicationReview() throws DAOException {
		log.trace("testSelectDuplicationReview() invoked.");
		
		AccomReviewDTO review = new AccomReviewDTO(null, 201912250001l, null, null, null, null, null, null);

		AccomReviewVO vo = this.mapper.selectDuplicationReview(review);
		log.info("==================================== vo : {}", vo);
	} // testSelectDuplicationReview
	
	
	@Test
	@Order(15)
	@DisplayName("15. testUpdateStatusUcrnToUcrn")
	@Timeout(value = 15, unit = TimeUnit.SECONDS)
	void testUpdateStatusUcrnToUcrn() throws DAOException {
		log.trace("testUpdateStatusUcrnToUcrn() invoked.");
		
		MemberVO member = new MemberVO(53, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);

		this.mapper.updateStatusUcrnToUcry(member);
	} // testUpdateStatusUcrnToUcrn
	
	
//	@Test
//	@Order(16)
//	@DisplayName("16. testSelectReservInfo")
//	@Timeout(value = 10, unit = TimeUnit.SECONDS)
//	void testSelectReservInfo() throws DAOException {
//		log.trace("testSelectReservInfo() invoked.");
//		
//		Criteria cri = new Criteria();
//		cri.setAmount(10);
//		cri.setCurrPage(3);
//		
//		List<Map<String, Object>> list = this.adminMapper.selectReservInfo(cri);
//		list.forEach(log::info);
//		
//	} // testSelectReservInfo
	
	
} // end class
