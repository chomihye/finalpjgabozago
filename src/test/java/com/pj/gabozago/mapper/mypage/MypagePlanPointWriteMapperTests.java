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

import com.pj.gabozago.domain.CommunityVO;
import com.pj.gabozago.domain.Criteria;
import com.pj.gabozago.domain.MemberVO;
import com.pj.gabozago.domain.PointHistoryVO;
import com.pj.gabozago.exception.DAOException;
import com.pj.gabozago.mapper.MypagePlanPointWriteMapper;

import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.extern.log4j.Log4j2;


@Log4j2
@NoArgsConstructor

@ExtendWith(SpringExtension.class)
@ContextConfiguration(locations = "file:src/main/webapp/WEB-INF/spring/**/*-context.xml")

@TestInstance(Lifecycle.PER_CLASS)
@TestMethodOrder(OrderAnnotation.class)
public class MypagePlanPointWriteMapperTests {
	
	
	@Setter(onMethod_ = {@Autowired})
	private MypagePlanPointWriteMapper mapper;
	
	
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
		
		MemberVO member = new MemberVO(53, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
		
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
		
		MemberVO member = new MemberVO(53, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
		
		Integer point = this.mapper.selectUserCurrentPoint(member);
		
		Objects.requireNonNull(point);
		log.info("\t+ current point : {}", point);
	} // testSelectUserCurrentPoint
	
	
	@Test
	@Order(4)
	@DisplayName("4. testUpdateMemberPoint")
	@Timeout(value = 10, unit = TimeUnit.SECONDS)
	void testUpdateMemberPoint() throws DAOException {
		log.trace("testUpdateMemberPoint() invoked.");
		
		MemberVO member = new MemberVO(61, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
		
		this.mapper.updateMemberPoint(member);
	} // testUpdateMemberPoint
	
	
	@Test
	@Order(5)
	@DisplayName("5. testSelectPlanList")
	@Timeout(value = 10, unit = TimeUnit.SECONDS)
	void testSelectPlanList() throws DAOException {
		log.trace("testSelectPlanList() invoked.");
		
		Criteria cri = new Criteria();
		cri.setAmount(4);
		
		MemberVO member = new MemberVO(53, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
		
		List<LinkedHashMap<String, Object>> list = this.mapper.selectPlanList(cri, member);
		list.forEach(log::info);
	} // testSelectPlanList
	
	
	@Test
	@Order(6)
	@DisplayName("6. testSelectWriteList")
	@Timeout(value = 10, unit = TimeUnit.SECONDS)
	void testSelectWriteList() throws DAOException {
		log.trace("testSelectWriteList() invoked.");
		
		Criteria cri = new Criteria();
		cri.setAmount(10);
		
		MemberVO member = new MemberVO(53, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
		
		List<CommunityVO> list = this.mapper.selectWriteList(cri, member);
		list.forEach(log::info);
	} // testSelectWriteList
	
	
	@Test
	@Order(8)
	@DisplayName("8. testSelectCommentList")
	@Timeout(value = 10, unit = TimeUnit.SECONDS)
	void testSelectCommentList() throws DAOException {
		log.trace("testSelectCommentList() invoked.");
		
		Criteria cri = new Criteria();
		cri.setAmount(10);
		
		MemberVO member = new MemberVO(53, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
		
		List<LinkedHashMap<String, Object>> list = this.mapper.selectCommentList(cri, member);
		list.forEach(log::info);
	} // testSelectCommentList
	
	
} // end class
