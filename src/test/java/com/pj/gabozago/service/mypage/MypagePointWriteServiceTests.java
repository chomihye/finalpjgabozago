package com.pj.gabozago.service.mypage;

import static org.junit.jupiter.api.Assertions.assertNotNull;

import java.util.LinkedHashMap;
import java.util.List;
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

import com.pj.gabozago.domain.Criteria;
import com.pj.gabozago.domain.MemberVO;
import com.pj.gabozago.domain.PointHistoryVO;
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
public class MypagePointWriteServiceTests {
	
	
	@Setter(onMethod_ = {@Autowired})
	private MypagePlanPointWriteService service;
	
	
	@BeforeAll
	void beforeAll() {
		log.trace("BeforeAll() invoked.");
		
		assertNotNull(this.service);
		log.info("\t+ this.service : {}", this.service);
	} // beforeAll
	
	
	@Test
	@Order(1)
	@DisplayName("1. testGetUserPointList")
	@Timeout(value = 10, unit = TimeUnit.SECONDS)
	void testGetUserPointList() throws ServiceException {
		log.trace("testGetUserPointList() invoked.");
		
		Criteria cri = new Criteria();
		cri.setAmount(10);
		
		MemberVO member = new MemberVO(53, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
		
		List<PointHistoryVO> list = this.service.getUserPointList(cri, member);
		
		Objects.requireNonNull(list);
		list.forEach(log::info);
	} // testGetUserPointList
	
	
	@Test
	@Order(2)
	@DisplayName("2. testGetUserCurrentPoint")
	@Timeout(value = 10, unit = TimeUnit.SECONDS)
	void testGetUserCurrentPoint() throws ServiceException {
		log.trace("testGetUserCurrentPoint() invoked.");
		
		MemberVO member = new MemberVO(61, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
		
		int point = this.service.getUserCurrentPoint(member);
		
		Objects.requireNonNull(point);
		log.info("\t+ current point : {}", point);
	} // testGetUserCurrentPoint
	
	
	@Test
	@Order(3)
	@DisplayName("3. testGetPlanList")
	@Timeout(value = 10, unit = TimeUnit.SECONDS)
	void testGetPlanList() throws ServiceException {
		log.trace("testGetPlanList() invoked.");
		
		Criteria cri = new Criteria();
		cri.setAmount(4);
		
		MemberVO member = new MemberVO(53, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
		
		List<LinkedHashMap<String, Object>> list = this.service.getPlanList(cri, member);
		
		list.forEach(log::info);
	} // testGetPlanList

	
} // end class
