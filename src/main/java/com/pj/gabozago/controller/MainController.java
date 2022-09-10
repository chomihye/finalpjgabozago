package com.pj.gabozago.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;


import lombok.NoArgsConstructor;
import lombok.extern.log4j.Log4j2;


@Log4j2
@NoArgsConstructor

@Controller 
@RequestMapping("/") 
public class MainController {
	

	@GetMapping("/main")
	public String main() {
		
		return "/main/main";
	}
	
	@GetMapping("/agreement")
	public String agreement() {

		return "/common/agreement";
	}
	
	@GetMapping("/privatePolicy")
	public String privatePolicy() {

		return "/common/privatePolicy";
	}
	
//	@GetMapping("/search/result")
//	public String searchResult() {
//
////		검색 결과 화면
//	}
	
	
	
}// end class
