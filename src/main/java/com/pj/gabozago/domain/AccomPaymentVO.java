package com.pj.gabozago.domain;

import java.util.Date;

import lombok.Value;


@Value
public class AccomPaymentVO {
	
	private Integer idx;
	private Long reservationIdx;
	private Integer memberIdx;
	private Integer orderPrice; 
	private Integer usePoint;
	private Integer paymentPrice;
	private String paymentType;
	private Date insertTs;
	private Date updateTs;
}
