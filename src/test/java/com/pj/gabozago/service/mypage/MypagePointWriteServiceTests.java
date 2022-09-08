package com.pj.gabozago.service.mypage;

import static org.junit.jupiter.api.Assertions.assertNotNull;

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
import com.pj.gabozago.domain.MemberDTO;
import com.pj.gabozago.domain.PointHistoryVO;
import com.pj.gabozago.exception.DAOException;
import com.pj.gabozago.exception.ServiceException;
import com.pj.gabozago.mapper.MypagePointWriteMapper;

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
	private MypagePointWriteService service;
	
	
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
		
		MemberDTO member = new MemberDTO();
		member.setIdx(53);
		
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
		
		MemberDTO member = new MemberDTO();
		member.setIdx(53);
		
		int point = this.service.getUserCurrentPoint(member);
		
		Objects.requireNonNull(point);
		log.info("\t+ current point : {}", point);
	} // testGetUserCurrentPoint

	
} // end class
