package com.pj.gabozago.domain;

import java.util.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;


@AllArgsConstructor
@NoArgsConstructor
@Data
public class AccomReviewDTO {

	private Integer idx;
	private Long reservationIdx;
	private Integer memberIdx;
	private Integer accomRoomIdx;
	private Integer grade1;
	private Integer grade2;
	private Integer grade3;
	private Date insertTs;
	
} // end class
