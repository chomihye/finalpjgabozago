package com.pj.gabozago.service;

import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.pj.gabozago.domain.AccomDTO;
import com.pj.gabozago.domain.AccomRoomDTO;
import com.pj.gabozago.domain.AccomRoomVO;
import com.pj.gabozago.domain.MemberDTO;
import com.pj.gabozago.domain.MemberVO;
import com.pj.gabozago.exception.DAOException;
import com.pj.gabozago.exception.ServiceException;
import com.pj.gabozago.mapper.AccomMapper;

import lombok.Setter;
import lombok.extern.log4j.Log4j2;

@Log4j2

@Service
public class AccomServiceImpl implements AccomService {

	@Setter(onMethod_ = @Autowired)
	private AccomMapper mapper;

	//숙소 전체목록보기
	@Override
	public List<AccomDTO> getList() throws ServiceException {
		log.trace("getList() invoked.");

		try {
			log.info(mapper.getList());
			return mapper.getList();
		} catch (DAOException e) {
			throw new ServiceException(e);
		} // try-catch
	}
	
	//숙소 이름 상세 페이지에 반영
	@Override
	public Map<String, Object> getOneAccomDetail(AccomDTO accom) throws ServiceException {
		try {
			return mapper.getOneAccomDetail(accom);
		} catch (DAOException e) {
			throw new ServiceException(e);
		} // try-catch
	}

	//숙소 하위 방 목록 조회
	@Override
	public List<LinkedHashMap<String, Object>> getRoomList(AccomDTO accom) throws ServiceException {
		try {
			return this.mapper.selectRoomList(accom);
		} catch (DAOException e) {
			throw new ServiceException(e);
		}
	}//getRoomList
	
	//숙소 방 한개당 상세 정보 조회
	@Override
	public Map<String, Object> getOneRoomDetail(AccomDTO accom) throws ServiceException {
		try {
			return this.mapper.selectRoomDetail(accom);
		} catch (DAOException e) {
			throw new ServiceException(e);
		}
	}//getOneRoomDetail

	//숙소 검색 결과 조회
	@Override
	public List<AccomDTO> getSearchedList(AccomDTO accom) throws ServiceException {
		try {
			return this.mapper.selectSearchedAccomList(accom);
		} catch (DAOException e) {
			throw new ServiceException(e);
		}
	}
	
	//로그인한 회원 정보 결제 페이지에 출력
	@Override
	public Map<String, Object> getOneMemberInfo(MemberVO member) throws ServiceException {
		try {
			return this.mapper.selectOneMemberInfo(member);
		} catch (DAOException e) {
			throw new ServiceException(e);
		}
	}
	
	//결제 페이지에 선택한 숙소 정보 가져오기
	@Override
	public Map<String, Object> getOneRoomInfo(AccomRoomDTO room) throws ServiceException {
		try {
			return this.mapper.selectOneRoomInfo(room);
		} catch (DAOException e) {
			throw new ServiceException(e);
		}
	} // getOneRoomInfo



} // end class
