package com.pj.gabozago.domain;

import java.util.Date;

import lombok.Value;


@Value
public class PointHistoryVO {

	private Integer idx;
	private Integer memberIdx;
	private Integer pointAmount;
	private String pointReason;
	private Character isPlus;
	private Date insertTs;
	
} // end class
