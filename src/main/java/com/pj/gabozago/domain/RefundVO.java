package com.pj.gabozago.domain;

import java.util.Date;

import lombok.Value;

@Value
public class RefundVO {

	private Integer idx;
	private Integer paymentIdx;
	private Integer refundPrice;
	private Integer refundPoint;
	private Date insertTs;
	
}// end class
