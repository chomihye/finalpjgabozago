package com.pj.gabozago.domain;

import java.sql.Timestamp;
import java.util.Date;

import lombok.Data;

@Data
public class MemberDTO {

	private Integer idx;
	private String email;
	private String password;
	private String name;
	private String nickname;
	private String phone;
	private String birthday;
	private String provider;
	private String uidNum;
	private String profileImg;
	private Integer point;
	private String rememberMe;
	private Timestamp rememberAge;
	private Date insertTs;
	private Date updateTs;
	private String isSecession;
	
}// end class
