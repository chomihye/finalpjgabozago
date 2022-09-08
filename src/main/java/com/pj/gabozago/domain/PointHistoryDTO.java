package com.pj.gabozago.domain;

import java.util.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;


@AllArgsConstructor
@NoArgsConstructor
@Data
public class PointHistoryDTO {

	private Integer idx;
	private Integer memberIdx;
	private Integer pointAmount;
	private String pointReason;
	private Character isPlus;
	private Date insertTs;
	
} // end class
