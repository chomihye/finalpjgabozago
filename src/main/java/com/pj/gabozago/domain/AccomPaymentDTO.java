package com.pj.gabozago.domain;

import java.util.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;


@AllArgsConstructor
@NoArgsConstructor
@Data
public class AccomPaymentDTO {
	
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
