package com.pj.gabozago.domain;

import java.util.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@AllArgsConstructor
@NoArgsConstructor
@Data
public class AccomReservationDTO {
	
	private Long idx;
	private Integer memberIdx;
	private Integer accomRoomIdx;
	private Integer largeAreaIdx;
	private String checkInDate;
	private String checkOutDate;
	private Integer adultCount;
	private Integer childCount;
	private String status;	
	private Integer seq;
	private Date insertTs;
	private Date updateTs;
}
