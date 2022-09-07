package com.pj.gabozago.domain;

import lombok.Value;


@Value
public class AccomRoomVO {
	
	private Integer idx;
	private Integer accomIdx;
	private String roomName;
	private String roomDesc;
	private String checkIn;
	private String checkOut;
	private Integer defaultCount;
	private Integer maxCount;
	private Integer roomArea;
	private String roomOption;
	private Integer price;
	private Integer maxPrice;
	private Integer minPrice;

}
