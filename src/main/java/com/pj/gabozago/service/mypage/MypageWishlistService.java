package com.pj.gabozago.service.mypage;

import java.util.LinkedHashMap;
import java.util.List;

import com.pj.gabozago.domain.Criteria;
import com.pj.gabozago.domain.MemberVO;
import com.pj.gabozago.exception.ServiceException;


public interface MypageWishlistService {		// 위시리스트 페이지를 위한 서비스 처리 

	
	// 해당 회원의 숙소 위시리스트 내역을 가져오는 메소드
	public abstract List<LinkedHashMap<String, Object>> getAccomWishlist(Criteria cri, MemberVO member) throws ServiceException;
	
	// 해당 회원의 일정 위시리스트 내역을 가져오는 메소드
	public abstract List<LinkedHashMap<String, Object>> getPlanWishlist(Criteria cri, MemberVO member) throws ServiceException;
	
	// 숙소 위시리스트 삭제
	public abstract void deleteAccomWishlist(String idx) throws ServiceException;
	
	// 일정 위시리스트 삭제
	public abstract void deletePlanWishlist(String idx) throws ServiceException;
		
	
} // end interface
