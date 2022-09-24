package com.pj.gabozago.mapper.mypage;

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
import com.pj.gabozago.exception.DAOException;
import com.pj.gabozago.mapper.MypageWishlistMapper;

import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.extern.log4j.Log4j2;


@Log4j2
@NoArgsConstructor

@ExtendWith(SpringExtension.class)
@ContextConfiguration(locations = "file:src/main/webapp/WEB-INF/spring/**/*-context.xml")

@TestInstance(Lifecycle.PER_CLASS)
@TestMethodOrder(OrderAnnotation.class)
public class MypageWishlistMapperTests {
	
	
	@Setter(onMethod_ = {@Autowired})
	private MypageWishlistMapper mapper;
	
	
	@BeforeAll
	void beforeAll() {
		log.trace("BeforeAll() invoked.");
		
		assertNotNull(this.mapper);
		log.info("\t+ this.mapper : {}", this.mapper);
	} // beforeAll
	
	
	@Test
	@Order(1)
	@DisplayName("1. testSelectAccomWishlist")
	@Timeout(value = 10, unit = TimeUnit.SECONDS)
	void testSelectAccomWishlist() throws DAOException {
		log.trace("testSelectAccomWishlist() invoked.");
		
		Criteria cri = new Criteria();
		cri.setAmount(10);
		cri.setCurrPage(2);
		
		MemberVO member = new MemberVO(53, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
		
		List<LinkedHashMap<String, Object>> list = this.mapper.selectAccomWishlist(cri, member);
		
		Objects.requireNonNull(list);
		list.forEach(log::info);
	} // testSelectAccomWishlist
	
	
	@Test
	@Order(2)
	@DisplayName("2. testCountTotalAmountOfAccom")
	@Timeout(value = 10, unit = TimeUnit.SECONDS)
	void testCountTotalAmountOfAccom() throws DAOException {
		log.trace("testCountTotalAmountOfAccom() invoked.");
		
		Criteria cri = new Criteria();
		cri.setAmount(10);
//		cri.setCurrPage(2);
		
		MemberVO member = new MemberVO(53, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
		
		Integer num = this.mapper.countTotalAmountOfAccom(cri, member);
		
		log.info(">>>>>>>>>>>>>>>> 총 레코드 갯수 : {}", num);
	} // testCountTotalAmountOfAccom

	
	@Test
	@Order(3)
	@DisplayName("3. testSelectPlanWishlist")
	@Timeout(value = 10, unit = TimeUnit.SECONDS)
	void testSelectPlanWishlist() throws DAOException {
		log.trace("testSelectPlanWishlist() invoked.");
		
		Criteria cri = new Criteria();
		cri.setAmount(10);
//		cri.setCurrPage(2);
		
		MemberVO member = new MemberVO(53, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
		
		List<LinkedHashMap<String, Object>> list = this.mapper.selectPlanWishlist(cri, member);
		
		list.forEach(log::info);
	} // testSelectPlanWishlist
	
	
	@Test
	@Order(4)
	@DisplayName("4. testSelectPlanDetail")
	@Timeout(value = 10, unit = TimeUnit.SECONDS)
	void testSelectPlanDetail() throws DAOException {
		log.trace("testSelectPlanDetail() invoked.");
		
		List<LinkedHashMap<String, Object>> list = this.mapper.selectPlanDetail("185", 7);
		
		list.forEach(log::info);
	} // testSelectPlanDetail
	
	
	@Test
	@Order(5)
	@DisplayName("5. testDeleteAccomWishlist")
	@Timeout(value = 10, unit = TimeUnit.SECONDS)
	void testDeleteAccomWishlist() throws DAOException {
		log.info("testDeleteAccomWishlist() invoked.");
		
		String idx = "532";
		
		this.mapper.deleteAccomWishlist(idx);
	} // testDeleteAccomWishlist
	
	
} // end class
