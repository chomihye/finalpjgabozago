package com.pj.gabozago.service.mypage;

import java.util.LinkedHashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.pj.gabozago.domain.Criteria;
import com.pj.gabozago.domain.MemberVO;
import com.pj.gabozago.exception.DAOException;
import com.pj.gabozago.exception.ServiceException;
import com.pj.gabozago.mapper.MypageWishlistMapper;

import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.extern.log4j.Log4j2;


@Log4j2
@NoArgsConstructor

@Service
//위시리스트 페이지를 위한 서비스 처리
public class MypageWishlistServiceImpl implements MypageWishlistService {

	
	@Setter(onMethod_ = {@Autowired})
	private MypageWishlistMapper mapper;
	
	
	// 숙소 위시리스트의 총 레코드 건수를 반환하는 메소드(페이징 처리에 필요)
	@Override
	public int getTotalOfAccom(Criteria cri, MemberVO member) throws ServiceException {
		log.trace("getTotalOfAccom() invoked.");
		
		try { return this.mapper.countTotalAmountOfAccom(cri, member); } 
		catch (DAOException e) { throw new ServiceException(e); }
	} // getTotalOfAccom


	// 해당 회원의 숙소 위시리스트 내역을 가져오는 메소드
	@Override
	public List<LinkedHashMap<String, Object>> getAccomWishlist(Criteria cri, MemberVO member) throws ServiceException {
		log.trace("getAccomWishlist() invoked.");
		
		try { return this.mapper.selectAccomWishlist(cri, member); } 
		catch (DAOException e) { throw new ServiceException(e); }
	} // getAccomWishlist

	
} // end class
