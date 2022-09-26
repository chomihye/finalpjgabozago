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
@RequestMapping("/board") 
public class BoardController {
	
	@RequestMapping(path = {"", "/notice"})
	public String noticemain() {
		
		return "board/notice";
	} // notice
	
	@GetMapping("/notice/read")
	public String noticeread() {

		return "board/notice/read";
	} // noticeread
	
	@GetMapping("/faq")
	public String faqlist() {

		return "board/faq";
	} // faq
	
	@GetMapping("/qna")
	public String qnalist() {

		return "board/qna";
	} // qna
	
	@GetMapping("/qna/secret")
	public String qnasrect() {

		return "board/qna/secret";
	} //qnasecret
	
	@GetMapping("/qna/read")
	public String qnaqread() {

		return "board/qna/read";
	} // qnaread
	
	@GetMapping("/qna/read2")
	public String qnaqread2() {

		return "board/qna/read2";
	} // qnaread
	
	@GetMapping("/qna/write")
	public String qnaqwrite() {

		return "board/qna/write";
	} // qnawrite
	
	@GetMapping("/community")
	public String communitymain() {

		return "board/community";
	} // communitymain
	
	@GetMapping("/community/tag")
	public String communitytag() {

		return "board/community/tag";
	} // communityarea
	
	@GetMapping("/community/write")
	public String communitywrite() {

		return "board/community/write";
	} // communitywrite
	
	@GetMapping("/community/read")
	public String communityread() {

		return "board/community/read";
	} // communityread
	
}// end class
