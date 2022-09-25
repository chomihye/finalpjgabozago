package com.pj.gabozago.mapper;

import java.util.LinkedHashMap;
import java.util.List;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;

import com.pj.gabozago.domain.CommunityVO;
import com.pj.gabozago.domain.Criteria;
import com.pj.gabozago.domain.MemberVO;
import com.pj.gabozago.domain.PointHistoryVO;
import com.pj.gabozago.exception.DAOException;


public interface MypagePlanPointWriteMapper {		// 여행일정, 마이포인트, 작성글/댓글 페이지 관련 mapper

	
//	============================================== 여행일정 ============================================== //
	
	// 회원이 작성한 여행일정 리스트를 가져오는 메소드
	public abstract List<LinkedHashMap<String, Object>> selectPlanList(@Param("cri") Criteria cri, @Param("member") MemberVO member) throws DAOException;
	
	// 일정의 상세일정 내용을 가져오는 메소드
	public abstract List<LinkedHashMap<String, Object>> selectPlanDetail(@Param("travelPlanIdx") Object travelPlanIdx) throws DAOException;
	
	// 여행일정 삭제 메소드
	@Delete("DELETE FROM tbl_travel_plan WHERE idx = #{idx}")
	public abstract void deletePlan(int idx) throws DAOException;
	
	
//	============================================== 마이포인트 ============================================== //
	
	// 특정 회원의 마이포인트 리스트를 가져오는 메소드
	public abstract List<PointHistoryVO> selectUserPointList(@Param("cri") Criteria cri, @Param("member") MemberVO member) throws DAOException;
	
	// 특정 회원의 member 테이블에 현재 포인트를 점검하는 메소드
	public abstract void updateMemberPoint(MemberVO member) throws DAOException;
	
	// 특정 회원의 현재 포인트를 가져오는 메소드
	@Select("SELECT point FROM tbl_member WHERE idx = #{idx}")
	public abstract Integer selectUserCurrentPoint(MemberVO member);
	
	
//	============================================== 작성 글/댓글 ============================================== //
	
	// 작성글 리스트를 가져오는 메소드
	public abstract List<CommunityVO> selectWriteList(@Param("cri") Criteria cri, @Param("member") MemberVO member) throws DAOException;
	
	// 작성댓글 리스트를 가져오는 메소드
	public abstract List<LinkedHashMap<String, Object>> selectCommentList(@Param("cri") Criteria cri, @Param("member") MemberVO member) throws DAOException;
	
	
} // end interface
