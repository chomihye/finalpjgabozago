package com.pj.gabozago.service;

import java.sql.Timestamp;

import com.pj.gabozago.domain.JoinDTO;
import com.pj.gabozago.domain.KakaoDTO;
import com.pj.gabozago.domain.LoginDTO;
import com.pj.gabozago.domain.MemberVO;
import com.pj.gabozago.domain.NaverDTO;
import com.pj.gabozago.exception.ServiceException;

public interface MemberService {

	// 멤버 회원가입
	public abstract boolean create(JoinDTO dto) throws ServiceException;
	
	// 네이버 로그인 DB 저장
	public abstract boolean createUserForNaverLogin(NaverDTO dto) throws ServiceException;
	
	// 카카오 로그인 DB 저장
	public abstract boolean createUserForKakaoLogin(KakaoDTO dto) throws ServiceException;
	
	// 회원가입 시 닉네임 중복 확인
	public abstract int findUserforNicknameCheck(String nickname) throws ServiceException;
	
	// 회원가입 시 이메일 중복 확인과 인증번호 발송
	public abstract int findUserforEmailCheck(String email, String uid) throws ServiceException;
	
	// 회원가입 시 이메일 중복 확인과 인증번호 발송
	public abstract int findUserforPhoneCheck(String phone, String uid) throws ServiceException;

	// 로그인
	public abstract MemberVO login(LoginDTO dto) throws ServiceException;
	
	public abstract MemberVO naverLogin(String uid_num) throws ServiceException;
	
	public abstract MemberVO kakaoLogin(String email) throws ServiceException;
	
	public abstract boolean modifyUserWithRememberMe(Integer idx, String rememberMe, Timestamp rememberAge) throws ServiceException;
	
	public abstract MemberVO findUserByRememberMe(String rememberMe) throws ServiceException;
	
	// 휴대폰 번호로 아이디 찾기
	public abstract String findUserIdByPhone(String phone) throws ServiceException;
	
	// 이메일로 비밀번호 찾기(유효 회원 확인)
	public abstract String findUserPwByEmail(String email) throws ServiceException;
	
	// 휴대폰 번호로 비밀번호 찾기(유효 회원 확인)
	public abstract String findUserPwByPhone(String phone) throws ServiceException;
	
	// 이메일로 비밀번호 찾기 후 임시비밀번호 업데이트
	public abstract boolean modifyUserforFindPwWithEmail(String email, String uid, String password) throws ServiceException;
	
	// 휴대폰 번호로 비밀번호 찾기 후 임시비밀번호 업데이트
	public abstract boolean modifyUserforFindPwWithPhone(String phone, String uid, String password) throws ServiceException;
	
}// end interface
