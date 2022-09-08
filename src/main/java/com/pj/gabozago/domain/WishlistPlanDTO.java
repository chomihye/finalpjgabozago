package com.pj.gabozago.domain;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;


@AllArgsConstructor
@NoArgsConstructor
@Data
public class WishlistPlanDTO {

	private Integer idx;
	private Integer memberIdx;
	private Integer travelPlanIdx;
	
} // end class
