package com.pj.gabozago.common;


public final class SharedScopeKeys {		// model 공유영역에 담을 key의 이름을 상수로 지정하는 클래스(관리의 편리성을 위함)

	public static final String USER_KEY = "__MEMBER__"; // 로그인에 성공한 멤버 정보를 Session Scope에 올리는 키
	public static final String LOGIN_KEY = "__LOGIN_KEY__"; 
	public static final String RESULT_KEY = "__RESULT__";
	public static final String EXCEPTION_KEY = "__EXCEPTION__";
	public static final String REMEMBER_ME_KEY = "__REMEMBER_ME__";
	public static final String LIST_KEY = "__LIST__";
	public static final String MAP_KEY = "__MAP__";
	public static final String PAGINATION_KEY = "__PAGINATION__";
	public static final String QUERY_KEY = "__QUERY__";
	public static final String EMAIL_KEY = "__EMAIL__";
	public static final String PASSWORD_SENT_KEY = "__PW_INFO__";
	public static final String ORIGINAL_URI_KEY = "__URI__";
	
} // end class
