package com.pj.gabozago.domain;

import java.util.List;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@AllArgsConstructor
@NoArgsConstructor
@Data
public class TravelPlanDTO {
	
	public TravelPlanDTO(Integer idx, Integer memberIdx, String startDate, String endDate, String isPublic, Integer largeAreaIdx, Integer days) {
		
		this.idx = idx;
		this.memberIdx = memberIdx;
		this.startDate = startDate;
		this.endDate = endDate;
		this.isPublic = isPublic;
		this.largeAreaIdx = largeAreaIdx;
		this.days = days;
	}
	
	
	private Integer idx;
	private Integer memberIdx;
	private String startDate;     
	private String endDate;
	private String isPublic;
	private Integer largeAreaIdx;
	private Integer days;
	
	private List<TravePlanlDetailDTO> detailDto;
	
	
	

	
	
	
	
	
	
	
	
	
	
//	private String isPublic;
	
	

}//end class 
