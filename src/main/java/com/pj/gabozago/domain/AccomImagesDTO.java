package com.pj.gabozago.domain;

import java.util.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@AllArgsConstructor
@NoArgsConstructor
@Data
public class AccomImagesDTO {
	
	private Integer idx;
	private String fileName;
	private Integer accomRoomIdx;
	
}
