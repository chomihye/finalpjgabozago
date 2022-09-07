package com.pj.gabozago.domain;

import java.sql.Date;

import lombok.Data;
import lombok.Value;


@Value
public class AccomVO {
	
	private Integer idx;
	private String accomName;
	private Integer largeAreaIdx;
	private String address;
	private String latitude;
	private String longitude;
	private Date insertTs;
	private Date updateTs;
}
