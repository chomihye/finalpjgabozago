package com.pj.gabozago.domain;

import java.util.List;

import org.springframework.stereotype.Component;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@AllArgsConstructor
@NoArgsConstructor
@Data
public class TravePlanlDetailDTO {
	
	private Integer idx;
	private Integer travelPlanIdx;
	private Integer day;
	private String placeType;       // T : 관광지 , A : 숙소 
	private Long reservationIdx;	//예약번호 ?,,,
	private String placeName;		// null o >> A : 숙소 
	private Integer placeSeq;
	private Double latitude;
	private Double longitude;
	private String img;
	
}//end class 
