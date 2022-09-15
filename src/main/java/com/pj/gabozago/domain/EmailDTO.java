package com.pj.gabozago.domain;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.Value;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class EmailDTO {
	private String subject;
	private String content;
	private String receiver;
}// end class
