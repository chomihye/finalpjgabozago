package com.pj.gabozago.service;

import java.util.List;
import java.util.Map;

import com.pj.gabozago.domain.AccomReservationVO;
import com.pj.gabozago.domain.Criteria;
import com.pj.gabozago.domain.MemberDTO;
import com.pj.gabozago.domain.NoticeVO;
import com.pj.gabozago.exception.ServiceException;

public interface AdminService {

	// 총 레코드 건수를 반환하는 메소드(페이징 처리에 필요)
	public abstract int getTotal(Criteria cri) throws ServiceException;	
	
	// 회원 정보
	public abstract List<Map<String, Object>> getMemberInfo(Criteria cri) throws ServiceException;
	
	// 회원 상세 정보
	public abstract Map<String, Object> getMemberInfoDetail(MemberDTO member) throws ServiceException;
		
	// 예약 정보
	public abstract List<Map<String, Object>> getReservInfo(Criteria cri, AccomReservationVO reserv) throws ServiceException;

	// 공지사항
	public abstract List<Map<String, Object>> getNotice(Criteria cri) throws ServiceException;
	

	
	
	
} // end interface
