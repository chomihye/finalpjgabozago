package com.pj.gabozago.mapper.mypage;

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
public class MypagePointWriteMapperTests {
	
	
	@Setter(onMethod_ = {@Autowired})
	private MypagePointWriteMapper mapper;
	
	
	@BeforeAll
	void beforeAll() {
		log.trace("BeforeAll() invoked.");
		
		assertNotNull(this.mapper);
		log.info("\t+ this.mapper : {}", this.mapper);
	} // beforeAll
	
	
	@Test
	@Order(1)
	@DisplayName("1. testSelectUserPointList")
	@Timeout(value = 10, unit = TimeUnit.SECONDS)
	void testSelectUserPointList() throws DAOException {
		log.trace("testSelectUserPointList() invoked.");
		
		Criteria cri = new Criteria();
		cri.setAmount(10);		// 한페이지당 데이터 10개씩 보여주기
//		cri.setCurrPage(1);
//		cri.setMemberIdx(53);
		
		MemberDTO member = new MemberDTO();
		member.setIdx(53);
		
		List<PointHistoryVO> list = this.mapper.selectUserPointList(cri, member);
		
		Objects.requireNonNull(list);
		list.forEach(log::info);
	} // testSelectUserPointList

	
	@Test
	@Order(2)
	@DisplayName("2. testSelectUserCurrentPoint")
	@Timeout(value = 10, unit = TimeUnit.SECONDS)
	void testSelectUserCurrentPoint() throws DAOException {
		log.trace("testSelectUserCurrentPoint() invoked.");
		
		MemberDTO member = new MemberDTO();
		member.setIdx(53);
		
		Integer point = this.mapper.selectUserCurrentPoint(member);
		
		Objects.requireNonNull(point);
		log.info("\t+ current point : {}", point);
	} // testSelectUserCurrentPoint
	
	
	@Test
	@Order(3)
	@DisplayName("3. testCountTotalAmount")
	@Timeout(value = 10, unit = TimeUnit.SECONDS)
	void testCountTotalAmount() throws DAOException {
		log.trace("testCountTotalAmount() invoked.");
		
		Criteria cri = new Criteria();
		
		MemberDTO member = new MemberDTO();
		member.setIdx(53);
		
		Integer num = this.mapper.countTotalAmount(cri, member);
		
		Objects.requireNonNull(num);
		log.info("\t+ 총 레코드 건수 : {}", num);
	} // testCountTotalAmount
	
	
} // end class
