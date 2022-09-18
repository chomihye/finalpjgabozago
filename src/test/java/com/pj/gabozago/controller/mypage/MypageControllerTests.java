package com.pj.gabozago.controller.mypage;

import static org.junit.jupiter.api.Assertions.assertNotNull;

import java.io.UnsupportedEncodingException;
import java.security.NoSuchAlgorithmException;
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
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit.jupiter.SpringExtension;
import org.springframework.test.context.web.WebAppConfiguration;
import org.springframework.test.web.servlet.MockMvc;
import org.springframework.test.web.servlet.MockMvcBuilder;
import org.springframework.test.web.servlet.RequestBuilder;
import org.springframework.test.web.servlet.request.MockMvcRequestBuilders;
import org.springframework.test.web.servlet.setup.MockMvcBuilders;
import org.springframework.ui.ModelMap;
import org.springframework.web.context.WebApplicationContext;

import com.pj.gabozago.common.UUIDGenerator;

import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.extern.log4j.Log4j2;


@Log4j2
@NoArgsConstructor

@ExtendWith(SpringExtension.class)
@ContextConfiguration(locations = "file:src/main/webapp/WEB-INF/spring/**/*-context.xml")

@WebAppConfiguration

@TestInstance(Lifecycle.PER_CLASS)
@TestMethodOrder(OrderAnnotation.class)
public class MypageControllerTests {

	
	// Controller 테스트 시에는, Spring Beans Container 자체를 주입받아야 한다.
	@Setter(onMethod_ = {@Autowired})
	private WebApplicationContext ctx;
	
	
	@BeforeAll
	public void beforeAll() {
		log.trace("beforeAll() invoked.");
		
		assertNotNull(ctx);
		log.info("\t+ this.ctx : {}", this.ctx);
	} // beforeAll
	
	
	@Test
	@Order(1)
	@DisplayName("1. testGetMyPointList")
	@Timeout(value = 10, unit = TimeUnit.SECONDS)
	public void testGetMyPointList() throws Exception {		// 해당 회원의 마이포인트를 총 조회하는 메소드 테스트
		log.trace("testGetMyPointList() invoked.");
		
		// MockMvc 객체 만들기
		MockMvcBuilder mockMvcBuilder = MockMvcBuilders.webAppContextSetup(ctx);
		MockMvc mockMvc = mockMvcBuilder.build();
		
		// request 객체 만들기
		RequestBuilder reqBuilder = MockMvcRequestBuilders.get("/mypage/point");	// get or post 방식(URI)
		
		// ModelMap => LinkedHashMap<String, ArrayList>
		ModelMap modelMap =
				mockMvc.
					perform(reqBuilder).	// 스프링 프레임워크에 request 메시지를 보내는 메소드
					andReturn().			// 결과값을 리턴한다. 
					getModelAndView().		// 모델과 뷰의 이름을 받겠다.
					getModelMap();			// 모델을 받겠다.
		
		modelMap.forEach((t, u)->{			// key, value
			log.info("\t+ t : {}", t);
			log.info("\t+ u : {}", u);
		}); // forEach
		
		// 자원해제 : Map객체 clear + Map객체가 저장한 참조변수값을 null로 변경
		//			(빨리 garbage collection 되도록 하기 위함)
		modelMap.clear();	
		modelMap = null;	
		
	} // testGetMyPointList
	
	
	@Test
	@Order(2)
	@DisplayName("2. testLoadReservationPage")
	@Timeout(value = 10, unit = TimeUnit.SECONDS)
	public void testLoadReservationPage() throws Exception {	
		log.trace("testLoadReservationPage() invoked.");
		
		// MockMvc 객체 만들기
		MockMvcBuilder mockMvcBuilder = MockMvcBuilders.webAppContextSetup(ctx);
		MockMvc mockMvc = mockMvcBuilder.build();
		
		// request 객체 만들기
		RequestBuilder reqBuilder = MockMvcRequestBuilders.get("/mypage/reservation");	// get or post 방식(URI)
		
		// ModelMap => LinkedHashMap<String, ArrayList>
		ModelMap modelMap =
				mockMvc.
					perform(reqBuilder).	// 스프링 프레임워크에 request 메시지를 보내는 메소드
					andReturn().			// 결과값을 리턴한다. 
					getModelAndView().		// 모델과 뷰의 이름을 받겠다.
					getModelMap();			// 모델을 받겠다.
		
		modelMap.forEach((t, u)->{			// key, value
			log.info("\t+ t : {}", t);
			log.info("\t+ u : {}", u);
		}); // forEach
		
		// 자원해제 : Map객체 clear + Map객체가 저장한 참조변수값을 null로 변경
		//			(빨리 garbage collection 되도록 하기 위함)
		modelMap.clear();	
		modelMap = null;	
		
	} // testLoadReservationPage
	
	
	@Test
	@Order(3)
	@DisplayName("3. testGetRegisterReview")
	@Timeout(value = 10, unit = TimeUnit.SECONDS)
	public void testGetRegisterReview() throws Exception {	
		log.trace("testGetRegisterReview() invoked.");
		
		// MockMvc 객체 만들기
		MockMvcBuilder mockMvcBuilder = MockMvcBuilders.webAppContextSetup(ctx);
		MockMvc mockMvc = mockMvcBuilder.build();
		
		// request 객체 만들기
		RequestBuilder reqBuilder = MockMvcRequestBuilders.post("/mypage/reservation/review");	// get or post 방식(URI)
		
		// ModelMap => LinkedHashMap<String, ArrayList>
		ModelMap modelMap =
				mockMvc.
					perform(reqBuilder).	// 스프링 프레임워크에 request 메시지를 보내는 메소드
					andReturn().			// 결과값을 리턴한다. 
					getModelAndView().		// 모델과 뷰의 이름을 받겠다.
					getModelMap();			// 모델을 받겠다.
		
		// 자원해제 : Map객체 clear + Map객체가 저장한 참조변수값을 null로 변경
		//			(빨리 garbage collection 되도록 하기 위함)
		modelMap.clear();	
		modelMap = null;	
		
	} // testGetRegisterReview
	
	
	
} // end class