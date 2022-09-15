package com.pj.gabozago.mapper;

import java.util.LinkedHashMap;
import java.util.List;

import org.apache.ibatis.annotations.Delete;

import com.pj.gabozago.domain.MemberVO;
import com.pj.gabozago.exception.DAOException;

public interface MypageMainMemberMapper {		// 마이페이지 메인과 회원정보수정 및 탈퇴 페이지 관련 mapper

	
	// 회원의 사용일 임박순 숙소예약내역 2건을 가져오는 메소드
	public abstract List<LinkedHashMap<String, Object>> selectReserOrderOfUseDate(MemberVO member) throws DAOException;
	
	// 회원 탈퇴 처리
	@Delete("DELETE FROM tbl_member WHERE idx = #{idx}")
	public abstract Boolean deleteMember(MemberVO member) throws DAOException;
	
	
} // end interface
