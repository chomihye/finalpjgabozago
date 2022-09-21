package com.pj.gabozago.domain;

import java.sql.Date;

import com.fasterxml.jackson.annotation.JsonIgnoreProperties;

import lombok.Data;

@JsonIgnoreProperties(ignoreUnknown = true)
@Data
public class NaverDTO {

	private Integer idx;
	private String email;
	private String password;
	private String name;
	private String nickname;
	private String mobile;
	private String birthday;
	private String provider = "naver";
	private String id; // uidnum
	private Integer point;
	private Date insertTs;
	private Date updateTs;   
	private String isSecession;
	private String profilePath;
	
	private String birthyear;
	
}// end class
