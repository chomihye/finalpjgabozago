package com.pj.gabozago.mapper;

import java.sql.Timestamp;

import org.apache.ibatis.annotations.Param;

import com.pj.gabozago.domain.JoinDTO;
import com.pj.gabozago.domain.LoginDTO;
import com.pj.gabozago.domain.LoginVO;
import com.pj.gabozago.domain.MemberVO;
import com.pj.gabozago.exception.MemberException;

public interface MemberMapper {

	// 새로운 멤버 회원가입 시 저장
	public abstract Integer insert(JoinDTO dto) throws MemberException;
	
	public abstract MemberVO selectUser(LoginDTO dto) throws MemberException;
	
	// ** 테스트 중
	// public abstract LoginVO selectUserByEmail(LoginDTO dto) throws MemberException;
	
	public abstract Integer updateUserWithRememberMe(@Param("idx")Integer idx, @Param("rememberMe") String rememberMe, @Param("rememberAge")Timestamp rememberAge) throws MemberException;
	
	public abstract MemberVO selectUserByRememberMe(String rememberMe) throws MemberException;
	
	// 아이디 찾기
	public abstract String selectUserIdByPhone(String phone) throws MemberException;
	
	// 비밀번호 찾기
	public abstract String selectUserIdByEmail(String email) throws MemberException;
	
	public abstract String selectUserPhoneByPhone(String phone) throws MemberException;

	
}// end interface
