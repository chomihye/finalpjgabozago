package com.pj.gabozago.domain;

import java.util.Date;

import lombok.Value;

@Value
public class NoticeVO {

	private Integer idx;
	private Integer writerIdx;
	private String title;
	private String content;
	private Integer viewCount;
	private Date insertTs;
	private Date updateTs;
	
} // end class
