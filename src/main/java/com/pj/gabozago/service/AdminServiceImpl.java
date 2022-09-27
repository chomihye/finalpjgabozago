package com.pj.gabozago.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.pj.gabozago.domain.AccomReservationDTO;
import com.pj.gabozago.domain.AccomReservationVO;
import com.pj.gabozago.domain.Criteria;
import com.pj.gabozago.domain.MemberDTO;
import com.pj.gabozago.domain.MemberVO;
import com.pj.gabozago.domain.NoticeVO;
import com.pj.gabozago.domain.RefundVO;
import com.pj.gabozago.exception.DAOException;
import com.pj.gabozago.exception.ServiceException;
import com.pj.gabozago.mapper.AdminMapper;
import com.pj.gabozago.mapper.AdminReservMapper;

import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.extern.log4j.Log4j2;

@Log4j2
@NoArgsConstructor

@Service
public class AdminServiceImpl implements AdminService {

	
	
	
	@Setter(onMethod_ = {@Autowired})
	private AdminMapper mapper;
	
	
	// 총 레코드 건수를 반환하는 메소드(페이징 처리에 필요)
	@Override
	public int getTotal(Criteria cri) throws ServiceException {
		log.trace("getTotal() invoked.");
	      
		try { return this.mapper.countTotalAmount(cri); } 
	    catch (DAOException e) { throw new ServiceException(e); }
	} // getTotal

	 
	// 회원 정보
	@Override
	public List<Map<String, Object>> getMemberInfo(Criteria cri) throws ServiceException {
		try {
			return this.mapper.selectMemberInfo(cri);
		} catch (DAOException e) {
			throw new ServiceException(e);
		}
	} // getMemberInfo
	
	
	// 회원 상세 정보
	@Override
	public Map<String, Object> getMemberInfoDetail(MemberDTO member) throws ServiceException {
		try {
			return mapper.getMemberInfoDetail(member);
		} catch (DAOException e) {
			throw new ServiceException(e);
		}
	} // getMemberInfoDetail
	
	
	@Setter(onMethod_= {@Autowired})
	private AdminReservMapper reservMapper;
	
	
	// 예약 정보
	@Override
	public List<Map<String, Object>> getReservInfo(Criteria cri, AccomReservationVO reserv) throws ServiceException {
		try {
			return this.reservMapper.selectReservInfo(cri, reserv);
		} catch (DAOException e) {
			throw new ServiceException(e);
		}
	} // getReservInfo
		
	
	// 예약 취소 정보
	@Override
	public List<Map<String, Object>> getCanReservInfo(Criteria cri, AccomReservationVO reserv) throws ServiceException {
		try {
			return this.reservMapper.selectReservInfo(cri, reserv);
		} catch (DAOException e) {
			throw new ServiceException(e);
		}
	} // getCanReservInfo
	
	
	// 이미 취소되어있는 환불정보 불러오는 메소드
	@Override
	public RefundVO getRefundInfo(AccomReservationDTO reserv) throws ServiceException {
		try { return this.reservMapper.selectRefundInfo(reserv); } 
		catch (DAOException e) { throw new ServiceException(e); }
	} // getRefundInfo
	
	
	// 특정 숙소예약내역 detail 페이지 정보 불러오는 메소드
	@Override
	public Map<String, Object> getOneReserDetail(AccomReservationDTO reserv) throws ServiceException {
		try { return this.reservMapper.selectOneReserDetail(reserv); } 
		catch (DAOException e) { throw new ServiceException(e); }
	} // getOneReserDetail
	
	
	
	
	// 공지사항
	@Override
	public List<Map<String, Object>> getNotice(Criteria cri, NoticeVO notice) throws ServiceException {
		try {
			return this.mapper.selectNotice(cri, notice);
		} catch (DAOException e) {
			throw new ServiceException(e);
		}
	} // getNotice
	
	
	
} // end class
