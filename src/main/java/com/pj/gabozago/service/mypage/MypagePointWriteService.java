package com.pj.gabozago.service.mypage;

import java.util.List;

import com.pj.gabozago.domain.Criteria;
import com.pj.gabozago.domain.MemberDTO;
import com.pj.gabozago.domain.PointHistoryVO;
import com.pj.gabozago.exception.ServiceException;


public interface MypagePointWriteService {		// 마이포인트, 작성 글/댓글 페이지를 위한 서비스 객체

	
	// 총 레코드 건수를 반환하는 메소드(페이징 처리에 필요)
	public abstract int getTotal(Criteria cri, MemberDTO member) throws ServiceException;
	
	// 특정 회원의 마이포인트 리스트를 가져오는 메소드
	public abstract List<PointHistoryVO> getUserPointList(Criteria cri, MemberDTO member) throws ServiceException;
	
	// 특정 회원의 현재 포인트를 가져오는 메소드
	public abstract Integer getUserCurrentPoint(MemberDTO member) throws ServiceException;

	
} // end interface
