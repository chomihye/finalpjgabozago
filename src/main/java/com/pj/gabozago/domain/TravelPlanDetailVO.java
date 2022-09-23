package com.pj.gabozago.domain;

import lombok.Data;
import lombok.NoArgsConstructor;

@Data

public class TravelPlanDetailVO {
	
	private Integer travelPlanIdx;
	private Integer day;
	private String placeType;	
	private Integer reservationIdx;	//예약번호 ?,,,
	private String placeIdx;		// * 
	private Integer placeSeq;
	private Integer latitude;
	private Integer longitude;
	private String img;
	

	
//	

}//end class 
