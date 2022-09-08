package com.pj.gabozago.domain;

import lombok.Data;


@Data
// 페이징 처리를 위한 3가지 기준정보를 가지는 클래스
public class Criteria {
	
	// 현재 페이지 번호(기본값 1페이지)
	private int currPage = 1;
	
	// 페이지당 보여줄 게시물 갯수(기본값 5개씩)
	private int amount = 5;
	
	// 한 페이지에서 보여줄 pagination의 길이
	private int pagesPerPage = 5;

} // end class
