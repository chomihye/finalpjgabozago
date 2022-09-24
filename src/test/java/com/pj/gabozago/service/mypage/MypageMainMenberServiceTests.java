package com.pj.gabozago.service.mypage;

import java.util.LinkedHashMap;
import java.util.List;
import java.util.Objects;
import java.util.concurrent.TimeUnit;

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

import com.pj.gabozago.domain.MemberVO;
import com.pj.gabozago.exception.ServiceException;
import com.pj.gabozago.service.MessageService;

import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.extern.log4j.Log4j2;


@Log4j2
@NoArgsConstructor

@ExtendWith(SpringExtension.class)
@ContextConfiguration(locations = "file:src/main/webapp/WEB-INF/spring/**/*-context.xml")

@TestInstance(Lifecycle.PER_CLASS)
@TestMethodOrder(OrderAnnotation.class)
public class MypageMainMenberServiceTests {
	
	
	@Setter(onMethod_ = {@Autowired})
	private MypageMainMemberService service;
	
	@Setter(onMethod_= {@Autowired})
	private MessageService messageService;
	
	
//	@BeforeAll
//	void beforeAll() {
//		log.trace("BeforeAll() invoked.");
//		
//		assertNotNull(this.service);
//		log.info("\t+ this.service : {}", this.service);
//	} // beforeAll
	
	
	@Test
	@Order(1)
	@DisplayName("1. testGetReserOrderOfUseDate")
	@Timeout(value = 10, unit = TimeUnit.SECONDS)
	void testGetReserOrderOfUseDate() throws ServiceException {
		log.trace("testGetReserOrderOfUseDate() invoked.");
		
		MemberVO member = new MemberVO(53, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
		
		List<LinkedHashMap<String, Object>> list = this.service.getReserOrderOfUseDate(member);
		
		Objects.requireNonNull(list);
		list.forEach(log::info);
	} // testGetReserOrderOfUseDate
	
	
	// 랜덤 번호 만들기
	@Test
	@Order(2)
	@DisplayName("2. testGetRandomNumber")
	@Timeout(value = 10, unit = TimeUnit.SECONDS)
	void testGetRandomNumber() throws ServiceException {
		log.trace("testGetRandomNumber() invoked.");
		
		Double doubleNum = ((Math.random()) * (999999 - 111111 + 1)) + 111111;
		int intNum = doubleNum.intValue();
		String randomNumber = String.valueOf(intNum);
		
//		this.messageService.sendMessageforModifyPhone("010-8904-0777", randomNumber);		// 메시지 보내는 메소드
		
		log.info("======================= 랜덤넘버 : [{}]", randomNumber);
	} // testGetRandomNumber
	
	
//	// 휴대폰 인증 관련
//	@Test
//	@Order(3)
//	@DisplayName("3. testCheckDoublePhone")
//	@Timeout(value = 10, unit = TimeUnit.SECONDS)
//	void testCheckDoublePhone() throws ServiceException {
//		log.trace("testCheckDoublePhone() invoked.");
//		
//		boolean isDouble = this.service.checkDoublePhone("010-8904-0777");
//		log.info(">>>>>>>>>>>>>>>>> isDouble : {}", isDouble);
//	} // testCheckDoublePhone
	
} // end class
