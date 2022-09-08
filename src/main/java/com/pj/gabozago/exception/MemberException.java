package com.pj.gabozago.exception;

public class MemberException extends Exception { 

	private static final long serialVersionUID = 1L; 
	
	public MemberException(String message) {
		super(message);
	}// constructor
	
	public MemberException(Exception e) {
		super(e);
	}// constructor
}
