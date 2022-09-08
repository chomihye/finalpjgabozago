package com.pj.gabozago.service.mypage;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.pj.gabozago.domain.Criteria;
import com.pj.gabozago.domain.MemberDTO;
import com.pj.gabozago.domain.PointHistoryVO;
import com.pj.gabozago.exception.DAOException;
import com.pj.gabozago.exception.ServiceException;
import com.pj.gabozago.mapper.MypagePointWriteMapper;

import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.extern.log4j.Log4j2;


@Log4j2
@NoArgsConstructor

@Service
//마이포인트, 작성 글/댓글 페이지를 위한 서비스 객체
public class MypagePointWriteServiceImpl implements MypagePointWriteService {

	
	@Setter(onMethod_ = {@Autowired})
	private MypagePointWriteMapper mapper;
	
	
	// 총 레코드 건수를 반환하는 메소드(페이징 처리에 필요)
	@Override
	public int getTotal(Criteria cri, MemberDTO member) throws ServiceException {
		log.trace("getTotal() invoked.");
		
		try { return this.mapper.countTotalAmount(cri, member); } 
		catch (DAOException e) { throw new ServiceException(e); }
	}  // getTotal
	
	
	@Override
	public List<PointHistoryVO> getUserPointList(Criteria cri, MemberDTO member) throws ServiceException {
		log.trace("getUserPointList({}) invoked.", cri);
		
		try { return this.mapper.selectUserPointList(cri, member); } 
		catch (Exception e) { throw new ServiceException(e); }
	} // getUserPointList


	// 회원의 현재포인트를 점검(업데이트)하고, 가져오는 트랜잭션
	@Transactional
	@Override
	public Integer getUserCurrentPoint(MemberDTO member) throws ServiceException {
		try { 
			this.mapper.updateMemberPoint(member);
			return this.mapper.selectUserCurrentPoint(member); 
		} catch (Exception e) { 
			throw new ServiceException(e); 
		}
	} // getUserCurrentPoint
	
	
} // end class
