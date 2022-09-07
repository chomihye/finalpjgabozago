package com.pj.gabozago.domain;

import java.util.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@AllArgsConstructor
@NoArgsConstructor
@Data
public class AccomRoomDTO {
	
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
