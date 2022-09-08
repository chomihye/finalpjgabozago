package com.pj.gabozago.domain;

import java.util.Date;


import lombok.Value;


@Value
public class AccomReservationVO {
	
	private Long idx;
	private Integer memberIdx;
	private Integer accomRoomIdx;
	private Integer largeAreaIdx;
	private String checkInDate;
	private String checkOutDate;
	private Integer adultCount;
	private Integer childCount;
	private String status;	
	private Date insertTs;
	private Date updateTs;
}
