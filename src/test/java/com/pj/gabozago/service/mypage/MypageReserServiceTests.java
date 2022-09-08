package com.pj.gabozago.service.mypage;

import static org.junit.jupiter.api.Assertions.assertNotNull;

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

import com.pj.gabozago.domain.AccomReservationDTO;
import com.pj.gabozago.domain.AccomReviewDTO;
import com.pj.gabozago.domain.AccomReviewVO;
import com.pj.gabozago.domain.Criteria;
import com.pj.gabozago.domain.MemberDTO;
import com.pj.gabozago.domain.PointHistoryVO;
import com.pj.gabozago.domain.RefundVO;
import com.pj.gabozago.exception.ServiceException;

import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.extern.log4j.Log4j2;


@Log4j2
@NoArgsConstructor

@ExtendWith(SpringExtension.class)
@ContextConfiguration(locations = "file:src/main/webapp/WEB-INF/spring/**/*-context.xml")

@TestInstance(Lifecycle.PER_CLASS)
@TestMethodOrder(OrderAnnotation.class)
public class MypageReserServiceTests {
	
	
	@Setter(onMethod_ = {@Autowired})
	private MypageReserService service;
	
	
	@BeforeAll
	void beforeAll() {
		log.trace("BeforeAll() invoked.");
		
		assertNotNull(this.service);
		log.info("\t+ this.service : {}", this.service);
	} // beforeAll
	
	
	@Test
	@Order(1)
	@DisplayName("1. testModifyReserStatus")
	@Timeout(value = 10, unit = TimeUnit.SECONDS)
	void testModifyReserStatus() throws ServiceException {
		log.trace("testModifyReserStatus() invoked.");
		
		MemberDTO member = new MemberDTO();
		member.setIdx(53);
		
		this.service.modifyReserStatus(member);
	} // testModifyReserStatus
	
	
	@Test
	@Order(2)
	@DisplayName("2. testGetOneReserDetail")
	@Timeout(value = 10, unit = TimeUnit.SECONDS)
	void testGetOneReserDetail() throws ServiceException {
		log.trace("testGetOneReserDetail() invoked.");
		
		AccomReservationDTO dto = new AccomReservationDTO();
		dto.setIdx(202203060001l);
		
		Map<String, Object> map = this.service.getOneReserDetail(dto);
		log.info(">>>>>>>>>>>>>>>>>>>>>>> map : {}", map);
	} // testGetOneReserDetail
	
	
	@Test
	@Order(2)
	@DisplayName("2. testCancelReservaion")
	@Timeout(value = 10, unit = TimeUnit.SECONDS)
	void testCancelReservaion() throws ServiceException {
		log.trace("testCancelReservaion() invoked.");

		AccomReservationDTO reser = new AccomReservationDTO();
		reser.setIdx(202202090001l);
		
		RefundVO vo = this.service.cancelReservaion(reser);
		log.info(">>>>>>>>>>>>>>>>>>>>>>>>>> vo : {}", vo);
	} // testCancelReservaion
	
	
	@Test
	@Order(3)
	@DisplayName("3. testRegisterNewReview")
	@Timeout(value = 10, unit = TimeUnit.SECONDS)
	void testRegisterNewReview() throws ServiceException {
		log.trace("testRegisterNewReview() invoked.");

		AccomReviewDTO review = new AccomReviewDTO(null, 202001200001l, 53, 50, 5, 5, 5, null);
		
		this.service.registerNewReview(review);
	} // testRegisterNewReview
	
	
	@Test
	@Order(4)
	@DisplayName("4. testCheckDuplicationReview")
	@Timeout(value = 10, unit = TimeUnit.SECONDS)
	void testCheckDuplicationReview() throws ServiceException {
		log.trace("testCheckDuplicationReview() invoked.");

		AccomReviewDTO review = new AccomReviewDTO(null, 201912250001l, null, null, null, null, null, null);
		
		AccomReviewVO vo = this.service.checkDuplicationReview(review);
		
		log.info("==================================== vo : {}", vo);
	} // testCheckDuplicationReview

	
} // end class
