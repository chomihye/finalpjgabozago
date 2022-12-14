package com.pj.gabozago.mapper;

import java.util.LinkedHashMap;
import java.util.List;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Param;

import com.pj.gabozago.domain.Criteria;
import com.pj.gabozago.domain.MemberVO;
import com.pj.gabozago.exception.DAOException;


public interface MypageWishlistMapper {		// 위시리스트 페이지 관련 mapper 

	
	// 해당 회원의 숙소 위시리스트 전체 내역을 가져오는 메소드
	public abstract List<LinkedHashMap<String, Object>> selectAccomWishlist(@Param("cri") Criteria cri, @Param("member") MemberVO member) throws DAOException;
	
	// 숙소 위시리스트 삭제
	@Delete("DELETE FROM tbl_wishlist_accom WHERE idx IN (${idx})")
	public abstract void deleteAccomWishlist(String idx) throws DAOException;
	
	// 해당 회원의 일정 위시리스트 전체 내역을 가져오는 메소드
	public abstract List<LinkedHashMap<String, Object>> selectPlanWishlist(@Param("cri") Criteria cri, @Param("member") MemberVO member) throws DAOException;
	
	// 일정의 상세일정 내용을 가져오는 메소드
	public abstract List<LinkedHashMap<String, Object>> selectPlanDetail(@Param("travelPlanIdx") Object travelPlanIdx) throws DAOException;
	
	// 일정 위시리스트 삭제
	@Delete("DELETE FROM tbl_wishlist_plan WHERE idx IN (${idx})")
	public abstract void deletePlanWishlist(String idx) throws DAOException;
	
	
} // end interface
