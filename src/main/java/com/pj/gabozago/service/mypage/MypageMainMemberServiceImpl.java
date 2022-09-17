package com.pj.gabozago.service.mypage;

import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.pj.gabozago.domain.MemberDTO;
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
	
	
	// 회원정보 업데이트가 필요한 경우, 다시 정보를 불러오는 메소드
	@Override
	public MemberVO getMemberInfo(MemberVO member) throws ServiceException {
		try { return this.mapper.selectMemberInfo(member); } 
		catch (DAOException e) { throw new ServiceException(e); }
	} // getMemberProfile
	
	// 회원의 사용일 임박순 숙소예약내역 2건을 가져오는 메소드
	@Override
	public List<LinkedHashMap<String, Object>> getReserOrderOfUseDate(MemberVO member) throws ServiceException {
		try { return this.mapper.selectReserOrderOfUseDate(member); } 
		catch (DAOException e) { throw new ServiceException(e); }
	} // getReserOrderOfUseDate

	// 닉네임 중복검사용
	@Override
	public boolean checkDoubleNickname(String nickname) throws ServiceException {
		try { return this.mapper.selectDoubleNickname(nickname); } 
		catch (DAOException e) { throw new ServiceException(e); }
	} // checkDoubleNickname
	
	// 회원 탈퇴 처리
	@Override
	public Boolean withdrawFromSite(MemberVO member) throws ServiceException {
		try { return this.mapper.deleteMember(member); } 
		catch (DAOException e) { throw new ServiceException(e); }
	} // withdrawFromSite

	@Override
	public void modifyMemberInfo(MemberDTO member) throws ServiceException {
		try { this.mapper.updateMemberInfo(member); } 
		catch (DAOException e) { throw new ServiceException(e); }
	} // modifyMemberInfo


} // end class
