package com.pj.gabozago.domain;



import java.util.List;

import lombok.Data;
import lombok.Value;

@Data
public class TravelPlanVO {
	//일정 생성 후 받아오는 VO 
	//일정 생성 후 travel_plan_idx를 파라미터로 보내면 
	//travel_plan >> (idx), start date, end date 
	//travel_plan_detail asc 정렬해서 >> day, place_idx, place_seq, latitude, longitude, img 
	
	private Integer idx;
	private Integer memberIdx;
	private String startDate;     
	private String endDate;
	private String isPublic;
	private Integer largeAreaIdx;
	
	
	private TravelPlanDetailVO travelplanDetailVO;
	

}//end class
