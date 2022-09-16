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

import com.pj.gabozago.domain.Criteria;
import com.pj.gabozago.domain.MemberDTO;
import com.pj.gabozago.domain.MemberVO;
import com.pj.gabozago.domain.PointHistoryVO;
import com.pj.gabozago.exception.DAOException;
import com.pj.gabozago.mapper.MypageMainMemberMapper;

import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.extern.log4j.Log4j2;


@Log4j2
@NoArgsConstructor

@ExtendWith(SpringExtension.class)
@ContextConfiguration(locations = "file:src/main/webapp/WEB-INF/spring/**/*-context.xml")

@TestInstance(Lifecycle.PER_CLASS)
@TestMethodOrder(OrderAnnotation.class)
public class MypageMainMemberMapperTests {
	
	
	@Setter(onMethod_ = {@Autowired})
	private MypageMainMemberMapper mapper;
	
	
	@BeforeAll
	void beforeAll() {
		log.trace("BeforeAll() invoked.");
		
		assertNotNull(this.mapper);
		log.info("\t+ this.mapper : {}", this.mapper);
	} // beforeAll
	
	
	@Test
	@Order(1)
	@DisplayName("1. testSelectReserOrderOfUseDate")
	@Timeout(value = 10, unit = TimeUnit.SECONDS)
	void testSelectReserOrderOfUseDate() throws DAOException {
		log.trace("testSelectReserOrderOfUseDate() invoked.");
		
		MemberVO member = new MemberVO(53, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
		
		List<LinkedHashMap<String, Object>> list = this.mapper.selectReserOrderOfUseDate(member);
		
		Objects.requireNonNull(list);
		list.forEach(log::info);
	} // testSelectReserOrderOfUseDate
	
	
	@Test
	@Order(2)
	@DisplayName("2. testDeleteMember")
	@Timeout(value = 10, unit = TimeUnit.SECONDS)
	void testDeleteMember() throws DAOException {
		log.trace("testDeleteMember() invoked.");
		
		MemberVO member = new MemberVO(69, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
		
		Boolean isDelete = this.mapper.deleteMember(member);
		log.info("================================== : {}", isDelete);
	} // testDeleteMember
	
	
	@Test
	@Order(3)
	@DisplayName("3. testSelectMemberProfile")
	@Timeout(value = 10, unit = TimeUnit.SECONDS)
	void testSelectMemberProfile() throws DAOException {
		log.info("testSelectMemberProfile() invoked.");
		
		MemberVO member = new MemberVO(53, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
		
		MemberVO member2 = this.mapper.selectMemberInfo(member);
		
		log.info(">>>>>>>>>>>> member2 : {}", member2);
	} // testSelectMemberProfile
	
	
	@Test
	@Order(4)
	@DisplayName("4. testSelectMemberProfile")
	@Timeout(value = 10, unit = TimeUnit.SECONDS)
	void testUpdateMemberInfo() throws DAOException {
		log.info("testSelectMemberProfile() invoked.");
		
		MemberDTO member = new MemberDTO();
		member.setIdx(53);
		member.setName("배은정");
		member.setPassword("$2a$10$vENgpT/Av13G6Kfoo393sOJUqe/iIgWsidAwJtT3ZQFIqNn78Qt3O");
		member.setNickname("Baen");
		member.setPhone("010-8904-0777");
		member.setProfileImg("");
		
		this.mapper.updateMemberInfo(member);
		MemberVO vo = this.mapper.selectMemberInfo(new MemberVO(53, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null));
		
		log.info(">>>>>>>>>>>> vo : {}", vo);
	} // testSelectMemberProfile

	
} // end class
