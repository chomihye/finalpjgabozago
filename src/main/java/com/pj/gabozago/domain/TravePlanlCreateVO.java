package com.pj.gabozago.domain;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@AllArgsConstructor
@NoArgsConstructor
@Data
public class TravePlanlCreateVO {
	
	//일정 생성 후 받아오는 VO 
	//일정 생성 후 travel_plan_idx를 파라미터로 보내면 
	//travel_plan >> (idx), start date, end date 
	//travel_plan_detail asc 정렬해서 >> day, place_idx, place_seq, latitude, longitude, img 
	private String start_date;   //   
	private String end_date;     //
	private Integer days;
	private Integer day;
	private String place_name;	  //
	private Integer place_seq;     //
	private Double latitude;
	private Double longitude;
	private String img;
	

}//end class 
