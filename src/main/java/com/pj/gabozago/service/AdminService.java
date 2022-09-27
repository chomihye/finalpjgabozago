package com.pj.gabozago.service;

import java.sql.Timestamp;
import java.util.List;
import java.util.Map;

import com.pj.gabozago.domain.AccomReservationDTO;
import com.pj.gabozago.domain.AccomReservationVO;
import com.pj.gabozago.domain.Criteria;
import com.pj.gabozago.domain.JoinDTO;
import com.pj.gabozago.domain.LoginDTO;
import com.pj.gabozago.domain.MemberDTO;
import com.pj.gabozago.domain.MemberVO;
import com.pj.gabozago.domain.NoticeVO;
import com.pj.gabozago.domain.RefundVO;
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

	// 예약 취소 정보
	public abstract List<Map<String, Object>> getCanReservInfo(Criteria cri, AccomReservationVO reserv) throws ServiceException;
	
	// 이미 취소되어있는 환불정보 불러오는 메소드
	public abstract RefundVO getRefundInfo(AccomReservationDTO reserv) throws ServiceException;
	
	// 숙소예약내역 상세 정보 
	public abstract Map<String, Object> getOneReserDetail(AccomReservationDTO reserv) throws ServiceException;

	// 대쉬보드 공지사항
	public abstract List<Map<String, Object>> getDashNotice(Criteria cri, NoticeVO notice) throws ServiceException;

	// 공지사항
	public abstract List<Map<String, Object>> getNotice(Criteria cri, NoticeVO notice) throws ServiceException;

	// 일반 로그인
	public abstract MemberVO login(LoginDTO dto) throws ServiceException;

	// 자동로그인 설정
	public abstract boolean modifyUserWithRememberMe(Integer idx, String rememberMe, Timestamp rememberAge) throws ServiceException;
	
	// 자동로그인
	public abstract MemberVO findUserByRememberMe(String rememberMe) throws ServiceException;



	
	
	
} // end interface
