package com.pj.gabozago.domain;

import java.util.Date;

import lombok.Value;

@Value
public class CommunityVO {

	
	private Integer idx;
	private String img;
	private String title;
	private String content;
	private Date insertTs;
	private Date updateTs;
	
	
}// end class
