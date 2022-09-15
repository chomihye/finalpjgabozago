package com.pj.gabozago.service.mypage;

import java.util.LinkedHashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.pj.gabozago.domain.MemberVO;
import com.pj.gabozago.exception.DAOException;
import com.pj.gabozago.exception.ServiceException;
import com.pj.gabozago.mapper.MypageMainMemberMapper;

import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.extern.log4j.Log4j2;


@NoArgsConstructor

@Service
public class MypageMainMemberServiceImpl implements MypageMainMemberService {

	
	@Setter(onMethod_ = {@Autowired})
	private MypageMainMemberMapper mapper;
	
	
	// 회원의 사용일 임박순 숙소예약내역 2건을 가져오는 메소드
	@Override
	public List<LinkedHashMap<String, Object>> getReserOrderOfUseDate(MemberVO member) throws ServiceException {
		try { return this.mapper.selectReserOrderOfUseDate(member); } 
		catch (DAOException e) { throw new ServiceException(e); }
	} // getReserOrderOfUseDate

	// 회원 탈퇴 처리
	@Override
	public Boolean withdrawFromSite(MemberVO member) throws ServiceException {
		try { return this.mapper.deleteMember(member); } 
		catch (DAOException e) { throw new ServiceException(e); }
	} // withdrawFromSite

} // end class
