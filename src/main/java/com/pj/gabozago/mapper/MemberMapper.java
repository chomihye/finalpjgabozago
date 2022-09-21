package com.pj.gabozago.mapper;

import java.sql.Timestamp;

import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Update;

import com.pj.gabozago.domain.JoinDTO;
import com.pj.gabozago.domain.KakaoDTO;
import com.pj.gabozago.domain.LoginDTO;
import com.pj.gabozago.domain.MemberVO;
import com.pj.gabozago.domain.NaverDTO;
import com.pj.gabozago.exception.MemberException;

public interface MemberMapper {

	// 새로운 멤버 회원가입 시 저장
	public abstract Integer insert(JoinDTO dto) throws MemberException;
	
	// 네이버 로그인 회원 저장
	public abstract Integer insertUserForNaverLogin(NaverDTO dto) throws MemberException;
	
	// 카카오 로그인 회원 저장
	public abstract Integer insertUserForKakaoLogin(KakaoDTO dto) throws MemberException;
	
	// 네이버 로그인
	public abstract MemberVO selectUserForNaverLogin(String uid_num) throws MemberException;
	
	// 카카오 로그인
	public abstract MemberVO selectUserForKakaoLogin(String email) throws MemberException;

	// 회원가입 시 닉네임 중복확인
	public abstract Integer selectUserforNickCheck(String nickname) throws MemberException;
	
	// 회원가입 시 이메일 중복확인
	public abstract Integer selectUserforEmailCheck(String email, String uid) throws MemberException;
	
	// 회원가입 시 휴대폰 번호 중복확인
	public abstract Integer selectUserforPhoneCheck(String phone, String uid) throws MemberException;	
	
	public abstract MemberVO selectUser(LoginDTO dto) throws MemberException;
	
	public abstract Integer updateUserWithRememberMe(@Param("idx")Integer idx, @Param("rememberMe") String rememberMe, @Param("rememberAge")Timestamp rememberAge) throws MemberException;
	
	public abstract MemberVO selectUserByRememberMe(String rememberMe) throws MemberException;
	
	// 아이디 찾기
	public abstract String selectUserIdByPhone(String phone) throws MemberException;
	
	// 비밀번호 찾기(이메일)
	public abstract String selectUserIdByEmail(String email) throws MemberException;
	
	// 비밀번호 찾기(휴대폰)
	public abstract String selectUserPhoneByPhone(String phone) throws MemberException;

	// 비밀번호 찾기(이메일) - 임시비밀번호 업데이트
	@Update("UPDATE tbl_member SET password = #{password} WHERE email = #{email}")
	public abstract Integer updateUserforFindPwWithEmail(@Param("email")String email, @Param("password")String password) throws MemberException;
	
	// 비밀번호 찾기(휴대폰) - 임시비밀번호 업데이트
	@Update("UPDATE tbl_member SET password = #{password} WHERE phone = #{phone}")
	public abstract Integer updateUserforFindPwWithPhone(String phone, String password) throws MemberException;
}// end interface
