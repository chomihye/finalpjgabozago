package com.pj.gabozago.domain;

import java.util.Date;
import java.util.List;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@AllArgsConstructor
@NoArgsConstructor
@Data
public class AccomDTO {
	
	private Integer idx;
	private String accomName;
	private Integer largeAreaIdx;
	private String address;
	private String latitude;
	private String longitude;
	private Date insertTs;
	private Date updateTs;
	
	
	private TravelLargeDTO travellargeDTO;
	private AccomRoomDTO accomroomDTO;
	private AccomImagesDTO accomimagesDTO;
	
	
}
