package com.pj.gabozago.mapper;

import java.util.LinkedHashMap;
import java.util.List;

import org.apache.ibatis.annotations.Select;

import com.pj.gabozago.domain.Criteria;
import com.pj.gabozago.domain.MemberVO;
import com.pj.gabozago.exception.DAOException;


public interface MypageWishlistMapper {		// 위시리스트 페이지 관련 mapper

	
	// 숙소 위시리스트의 총 레코드 건수를 반환하는 메소드(페이징 처리에 필요)
	@Select("SELECT count(idx) FROM tbl_wishlist_accom WHERE member_idx = #{member.idx}")
	public abstract Integer countTotalAmountOfAccom(Criteria cri, MemberVO member) throws DAOException;
	
	// 해당 회원의 숙소 위시리스트 내역을 가져오는 메소드
	public abstract List<LinkedHashMap<String, Object>> selectAccomWishlist(Criteria cri, MemberVO member) throws DAOException;
	
	// 일정 위시리스트의 총 레코드 건수를 반환하는 메소드(페이징 처리에 필요)
	@Select("SELECT count(idx) FROM tbl_wishlist_plan WHERE member_idx = #{member.idx}")
	public abstract Integer countTotalAmountOfPlan(Criteria cri, MemberVO member) throws DAOException;
	
	// 해당 회원의 일정 위시리스트 전체 내역을 가져오는 메소드
	public abstract List<LinkedHashMap<String, Object>> selectPlanWishlist(Criteria cri, MemberVO member) throws DAOException;
	
	// 일정의 상세일정 내용을 가져오는 메소드
	public abstract List<LinkedHashMap<String, Object>> selectPlanDetail(int travelPlanIdx, int day) throws DAOException;
	
	
} // end interface
