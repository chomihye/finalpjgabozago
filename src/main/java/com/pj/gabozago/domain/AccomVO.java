package com.pj.gabozago.domain;

import lombok.Data;


@Data
public class AccomVO {
	
	private Integer idx;
	private String accomName;
	private Integer largeAreaIdx;
//	private String address;
//	private String latitude;
//	private String longitude;
//	private Date insertTs;
//	private Date updateTs;

	
	private TravelLargeVO travellargeVO;
	private AccomRoomVO accomroomVO;
	private AccomImagesVO accomimagesVO;
}
