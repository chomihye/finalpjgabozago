package com.pj.gabozago.service.mypage;

import java.util.LinkedHashMap;
import java.util.List;

import com.pj.gabozago.domain.CommunityVO;
import com.pj.gabozago.domain.Criteria;
import com.pj.gabozago.domain.MemberVO;
import com.pj.gabozago.domain.PointHistoryVO;
import com.pj.gabozago.exception.ServiceException;


public interface MypagePlanPointWriteService {		// 여행일정, 마이포인트, 작성글/댓글 페이지 관련 service

//	============================================== 여행일정 ============================================== //
	
	// 총 레코드 건수를 반환하는 메소드(페이징 처리에 필요)
	public abstract Integer getTotalOfPlan(Criteria cri, MemberVO member) throws ServiceException;
		
	// 회원이 작성한 여행일정 리스트를 가져오는 메소드
	public abstract List<LinkedHashMap<String, Object>> getPlanList(Criteria cri, MemberVO member) throws ServiceException;
	
	// 여행일정 삭제 메소드
	public abstract void deletePlan(int idx) throws ServiceException;
	
	
//	============================================== 마이포인트 ============================================== //
	
	// 총 레코드 건수를 반환하는 메소드(페이징 처리에 필요)
	public abstract int getTotalOfPoint(Criteria cri, MemberVO member) throws ServiceException;
	
	// 특정 회원의 마이포인트 리스트를 가져오는 메소드
	public abstract List<PointHistoryVO> getUserPointList(Criteria cri, MemberVO member) throws ServiceException;
	
	// 특정 회원의 현재 포인트를 가져오는 메소드
	public abstract Integer getUserCurrentPoint(MemberVO member) throws ServiceException;
	
	// 포인트만 업데이트 하는 메소드
	public abstract void updateMemberPoint(MemberVO member) throws ServiceException;
	
	// 회원의 현재포인트를 가져오는 메소드
	public abstract Integer getCurrentPoint(MemberVO member) throws ServiceException;
	
	
//	============================================== 작성 글 ============================================== //
	
	// 총 레코드 건수를 반환하는 메소드(페이징 처리에 필요)
	public abstract Integer getTotalOfWrite(MemberVO member) throws ServiceException;
	
	// 작성글 리스트를 가져오는 메소드
	public abstract List<CommunityVO> getWriteList(Criteria cri, MemberVO member) throws ServiceException;
	
	
//	============================================== 작성 댓글 ============================================== //
	
	// 총 레코드 건수를 반환하는 메소드(페이징 처리에 필요)
	public abstract Integer getTotalOfComment(MemberVO member) throws ServiceException;
	
	// 작성댓글 리스트를 가져오는 메소드
	public abstract List<LinkedHashMap<String, Object>> getCommentList(Criteria cri, MemberVO member) throws ServiceException;

	
} // end interface
