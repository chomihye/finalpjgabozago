package com.pj.gabozago.domain;

import java.sql.Date;

import com.fasterxml.jackson.annotation.JsonIgnoreProperties;

import lombok.Data;

@JsonIgnoreProperties(ignoreUnknown = true)
@Data
public class KakaoDTO {

	private Integer idx;

	private String email;
	private String name;

	private String password;
	private String nickname;

	private String phone;
	private String birthday;
	private String provider = "kakao";
	private String uidnum; // uidnum
	private Integer point;
	private Date insertTs;
	private Date updateTs;   
	private String isSecession;	
	private String profilePath;

}// end class
