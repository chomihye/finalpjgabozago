package com.pj.gabozago.domain;

import lombok.Data;

@Data
public class LoginDTO {
	
	private String email;
	private String password;
	private Boolean rememberMe;
	private Boolean saveId;
	
}// end class