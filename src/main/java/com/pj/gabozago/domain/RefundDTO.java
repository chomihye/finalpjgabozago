package com.pj.gabozago.domain;

import java.util.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@AllArgsConstructor
@NoArgsConstructor
@Data
public class RefundDTO {
	
	private Integer idx;
	private Integer paymentIdx;
	private Integer refundPrice;
	private Integer refundPoint;
	private Date insertTs;
	
}
