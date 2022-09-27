package com.pj.gabozago.service;

import java.sql.Timestamp;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;

import com.pj.gabozago.domain.AccomReservationDTO;
import com.pj.gabozago.domain.AccomReservationVO;
import com.pj.gabozago.domain.Criteria;
import com.pj.gabozago.domain.JoinDTO;
import com.pj.gabozago.domain.LoginDTO;
import com.pj.gabozago.domain.MemberDTO;
import com.pj.gabozago.domain.MemberVO;
import com.pj.gabozago.domain.NoticeVO;
import com.pj.gabozago.domain.RefundVO;
import com.pj.gabozago.exception.DAOException;
import com.pj.gabozago.exception.MemberException;
import com.pj.gabozago.exception.ServiceException;
import com.pj.gabozago.mapper.AdminMapper;
import com.pj.gabozago.mapper.AdminReservMapper;
import com.pj.gabozago.mapper.MemberMapper;

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
			return this.mapper.selectMemberInfoDetail(member);
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
			return this.reservMapper.selectCanReservInfo(cri, reserv);
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
	
	

	// 대쉬보드 공지사항
	@Override
	public List<Map<String, Object>> getDashNotice(Criteria cri, NoticeVO notice) throws ServiceException {
		try {
			return this.mapper.selectDashNotice(cri, notice);
		} catch (DAOException e) {
			throw new ServiceException(e);
		}
	} // getNotice
	
	
	// 공지사항
	@Override
	public List<Map<String, Object>> getNotice(Criteria cri, NoticeVO notice) throws ServiceException {
		try {
			return this.mapper.selectNotice(cri, notice);
		} catch (DAOException e) {
			throw new ServiceException(e);
		}
	} // getNotice
	
	
	
	@Setter(onMethod_=@Autowired)
	private MemberMapper memmapper;

	
	// 로그인
	@Override
	public MemberVO login(LoginDTO dto) throws ServiceException {
		log.trace("login() invoked.");
		
		try {						
			return this.memmapper.selectUser(dto);
		} catch (MemberException e) {
			throw new ServiceException(e);
		}// try-catch
	}// login

	@Override
	public boolean modifyUserWithRememberMe(Integer idx, String rememberMe, Timestamp rememberAge) throws ServiceException {
		log.trace("modifyUserWithRememberMe() invoked.");
		
		try {
			return this.memmapper.updateUserWithRememberMe(idx, rememberMe, rememberAge) == 1;		
		} catch (MemberException e) {
			throw new ServiceException(e);
		}// try-catch
	}


	@Override
	public MemberVO findUserByRememberMe(String rememberMe) throws ServiceException {
		log.trace("findUserByRememberMe({}) invoked.", rememberMe);
		
		try {
			return this.memmapper.selectUserByRememberMe(rememberMe);
		} catch (Exception e) {
			throw new ServiceException(e);
		}// try-catch
	}// findUserByRememberMe
	
	
	
} // end class
