package com.pj.gabozago.domain;

import java.util.Date;

import lombok.Value;


@Value
public class AccomReviewVO {

	private Integer idx;
	private Long reservationIdx;
	private Integer memberIdx;
	private Integer accomRoomIdx;
	private Integer grade1;
	private Integer grade2;
	private Integer grade3;
	private Date insertTs;
	
} // end class
