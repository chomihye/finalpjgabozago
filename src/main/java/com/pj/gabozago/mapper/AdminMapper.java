package com.pj.gabozago.mapper;

import java.sql.Timestamp;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;

import com.pj.gabozago.domain.AccomReservationVO;
import com.pj.gabozago.domain.Criteria;
import com.pj.gabozago.domain.JoinDTO;
import com.pj.gabozago.domain.LoginDTO;
import com.pj.gabozago.domain.MemberDTO;
import com.pj.gabozago.domain.MemberVO;
import com.pj.gabozago.domain.NoticeVO;
import com.pj.gabozago.exception.DAOException;
import com.pj.gabozago.exception.MemberException;

public interface AdminMapper {
	
	// 총 레코드 건수를 반환하는 메소드(페이징 처리에 필요)
	@Select("SELECT count(idx) FROM tbl_member")
	public abstract Integer countTotalAmount(Criteria cri) throws DAOException;
	   
	// 회원 정보를 가져오는 메소드
	public abstract List<Map<String, Object>> selectMemberInfo(Criteria cri) throws DAOException;

	// 회원 상세 정보를 가져오는 메소드
	public abstract Map<String, Object> selectMemberInfoDetail(MemberDTO member) throws DAOException;
	
	// 공지사항을 가져오는 메소드
	public abstract List<Map<String, Object>> selectNotice(@Param("cri") Criteria cri, @Param("notice") NoticeVO notice) throws DAOException;

	// 대쉬보드 공지사항을 가져오는 메소드
	public abstract List<Map<String, Object>> selectDashNotice(@Param("cri") Criteria cri, @Param("notice") NoticeVO notice) throws DAOException;

	// 일반 로그인
	public abstract MemberVO selectUser(LoginDTO dto) throws MemberException;

	// 자동로그인 설정
	public abstract Integer updateUserWithRememberMe(@Param("idx")Integer idx, @Param("rememberMe") String rememberMe, @Param("rememberAge")Timestamp rememberAge) throws MemberException;
		
	// 자동로그인
	public abstract MemberVO selectUserByRememberMe(String rememberMe) throws MemberException;

	// 일반 회원 저장
	public abstract Integer insert(JoinDTO dto) throws MemberException;
	
			
} // end interface
