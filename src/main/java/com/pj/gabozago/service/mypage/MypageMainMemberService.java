package com.pj.gabozago.service.mypage;

import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Select;

import com.pj.gabozago.domain.MemberDTO;
import com.pj.gabozago.domain.MemberVO;
import com.pj.gabozago.exception.DAOException;
import com.pj.gabozago.exception.ServiceException;


public interface MypageMainMemberService {		// 마이페이지 메인과 회원정보수정 및 탈퇴 페이지 관련 service

	
	// 회원정보 업데이트가 필요한 경우, 다시 정보를 불러오는 메소드
	public abstract MemberVO getMemberInfo(MemberVO member) throws ServiceException;
	
	// 회원의 사용일 임박순 숙소예약내역 2건을 가져오는 메소드
	public abstract List<LinkedHashMap<String, Object>> getReserOrderOfUseDate(MemberVO member) throws ServiceException;
	
	// 회원 수정 로직
	public abstract void modifyMemberInfo(MemberDTO member) throws ServiceException;
	
	// 회원 탈퇴 처리
	public abstract Boolean withdrawFromSite(MemberVO member) throws ServiceException;

	
} // end interface
