package com.pj.gabozago.exception;

//영속성 계층의 모든 종류의 DAO 구현에서 발생하는 예외를 의미
public class DAOException extends Exception {
	
	private static final long serialVersionUID = 1L;

	public DAOException(String message) {
		super(message);
	}//constructor
	
	public DAOException(Exception e) {
		super(e);
	}
} //end class
