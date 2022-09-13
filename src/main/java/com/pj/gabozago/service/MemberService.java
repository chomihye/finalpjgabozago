package com.pj.gabozago.service;

import java.sql.Timestamp;

import com.pj.gabozago.domain.JoinDTO;
import com.pj.gabozago.domain.LoginDTO;
import com.pj.gabozago.domain.LoginVO;
import com.pj.gabozago.domain.MemberVO;
import com.pj.gabozago.exception.MemberException;
import com.pj.gabozago.exception.ServiceException;

public interface MemberService {

	// 멤버 회원가입
	public abstract boolean create(JoinDTO dto) throws ServiceException;
	
	// 로그인
	public abstract MemberVO login(LoginDTO dto) throws ServiceException;
	
	public abstract boolean modifyUserWithRememberMe(Integer idx, String rememberMe, Timestamp rememberAge) throws ServiceException;
	
	public abstract MemberVO findUserByRememberMe(String rememberMe) throws ServiceException;
	
	// 휴대폰 번호로 아이디 찾기
	public abstract String findUserIdByPhone(String phone) throws ServiceException;
	
	// 이메일로 비밀번호 찾기(유효 회원 확인)
	public abstract String findUserPwByEmail(String email) throws ServiceException;
	
	// 휴대폰 번호로 비밀번호 찾기(유효 회원 확인)
	public abstract String findUserPwByPhone(String phone) throws ServiceException;

}// end interface
