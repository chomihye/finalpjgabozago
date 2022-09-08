package com.pj.gabozago.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;

import com.pj.gabozago.domain.AccomPaymentVO;
import com.pj.gabozago.domain.Criteria;
import com.pj.gabozago.domain.MemberDTO;
import com.pj.gabozago.domain.PointHistoryVO;
import com.pj.gabozago.exception.DAOException;


public interface MypagePointWriteMapper {		// 포인트 페이지 관련 mapper

	
	// 총 레코드 건수를 반환하는 메소드(페이징 처리에 필요)
	@Select("SELECT count(idx) FROM tbl_point_history WHERE member_idx = #{member.idx}")
	public abstract Integer countTotalAmount(@Param("cri") Criteria cri, @Param("member") MemberDTO member) throws DAOException;
	
	// 특정 회원의 마이포인트 리스트를 가져오는 메소드
	public abstract List<PointHistoryVO> selectUserPointList(@Param("cri") Criteria cri, @Param("member") MemberDTO member) throws DAOException;
	
	// 특정 회원의 member 테이블에 현재 포인트를 점검하는 메소드
	public abstract void updateMemberPoint(MemberDTO member) throws DAOException;
	
	// 특정 회원의 현재 포인트를 가져오는 메소드
	@Select("SELECT point FROM tbl_member WHERE idx = #{idx}")
	public abstract Integer selectUserCurrentPoint(MemberDTO member);
	
	
} // end interface
