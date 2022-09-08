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

import com.pj.gabozago.domain.WishlistAccomVO;
import com.pj.gabozago.domain.WishlistPlanVO;
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
	@DisplayName("1. testSelectOneWishlistAccom")
	@Timeout(value = 10, unit = TimeUnit.SECONDS)
	void testSelectOneWishlistAccom() throws DAOException {
		log.trace("testSelectOneWishlistAccom() invoked.");
		
		List<WishlistAccomVO> list = this.mapper.selectOneWishlistAccom();
		
		Objects.requireNonNull(list);
		list.forEach(log::info);
	} // testSelectOneWishlistAccom
	
	
	@Test
	@Order(1)
	@DisplayName("1. testSelectOneWishlistPlan")
	@Timeout(value = 10, unit = TimeUnit.SECONDS)
	void testSelectOneWishlistPlan() throws DAOException {
		log.trace("testSelectOneWishlistPlan() invoked.");
		
		List<WishlistPlanVO> list = this.mapper.selectOneWishlistPlan();
		
		Objects.requireNonNull(list);
		list.forEach(log::info);
	} // testSelectOneWishlistPlan

	
} // end class
