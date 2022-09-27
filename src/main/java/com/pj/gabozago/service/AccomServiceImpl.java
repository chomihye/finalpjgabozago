package com.pj.gabozago.service;

import java.util.HashMap;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.UncategorizedSQLException;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;

import com.pj.gabozago.domain.AccomDTO;
import com.pj.gabozago.domain.AccomReservationDTO;
import com.pj.gabozago.domain.AccomRoomDTO;
import com.pj.gabozago.domain.AccomRoomVO;
import com.pj.gabozago.domain.Criteria;
import com.pj.gabozago.domain.MemberDTO;
import com.pj.gabozago.domain.MemberVO;
import com.pj.gabozago.domain.WishlistAccomDTO;
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

	// 숙소 전체목록보기
	@Override
	public List<AccomDTO> getList(Criteria cri) throws ServiceException {

		try {
			return mapper.getList(cri);
		} catch (DAOException e) {
			throw new ServiceException(e);
		} // try-catch
	}

	// 숙소 전체목록보기 (로그인 되었을 때)
	@Override
	public List<AccomDTO> getListWithMember(Criteria cri, MemberVO member) throws ServiceException {

		try {
			return mapper.getListWithMember(cri, member);
		} catch (DAOException e) {
			throw new ServiceException(e);
		} // try-catch
	}

	// 숙소 이름 상세 페이지에 반영
	@Override
	public Map<String, Object> getOneAccomDetail(AccomDTO accom) throws ServiceException {
		try {
			return mapper.getOneAccomDetail(accom);
		} catch (DAOException e) {
			throw new ServiceException(e);
		} // try-catch
	}

	// 숙소 하위 방 목록 조회
	@Override
	public List<LinkedHashMap<String, Object>> getRoomList(AccomDTO accom) throws ServiceException {
		try {
			return this.mapper.selectRoomList(accom);
		} catch (DAOException e) {
			throw new ServiceException(e);
		}
	}// getRoomList

	// 숙소 하위 방 리뷰 조회
	@Override
	public List<LinkedHashMap<String, Object>> getHotelReviewList(AccomDTO accom) throws ServiceException {
		try {
			return this.mapper.selectHotelReviewList(accom);
		} catch (DAOException e) {
			throw new ServiceException(e);
		}
	}// getHotelReviewList

	// 숙소 리뷰 평균
	@Override
	public Map<String, Object> getHotelAvgReview(AccomDTO accom) throws ServiceException {
		try {
			return this.mapper.selectHotelAvgReview(accom);
		} catch (DAOException e) {
			throw new ServiceException(e);
		}
	}// getHotelAvgReview

	// 숙소 방 한개당 상세 정보 조회
	@Override
	public Map<String, Object> getOneRoomDetail(AccomDTO accom) throws ServiceException {
		try {
			return this.mapper.selectRoomDetail(accom);
		} catch (DAOException e) {
			throw new ServiceException(e);
		}
	}// getOneRoomDetail

	// 숙소 검색 결과 조회
	@Override
	public List<AccomDTO> getSearchedList(AccomDTO accom) throws ServiceException {
		try {
			return this.mapper.selectSearchedAccomList(accom);
		} catch (DAOException e) {
			throw new ServiceException(e);
		}
	}// getSearchedList

	@Override
	public List<AccomDTO> getSearchedListWithMember(AccomDTO accom) throws ServiceException {
		try {
			return this.mapper.selectSearchedAccomListWithMember(accom);
		} catch (DAOException e) {
			throw new ServiceException(e);
		}
	} // getSearchedListWithMember

	// 로그인한 회원 정보 결제 페이지에 출력
	@Override
	public Map<String, Object> getOneMemberInfo(MemberVO member) throws ServiceException {
		try {
			return this.mapper.selectOneMemberInfo(member);
		} catch (DAOException e) {
			throw new ServiceException(e);
		}
	}// getOneMemberInfo

	// 결제 페이지에 선택한 숙소 정보 가져오기
	@Override
	public Map<String, Object> getOneRoomInfo(AccomRoomDTO room) throws ServiceException {
		try {
			return this.mapper.selectOneRoomInfo(room);
		} catch (DAOException e) {
			throw new ServiceException(e);
		}
	}// getOneRoomInfo
	
	
//	//예약 정보 저장
//	@Override
//	public Map<String, Object> 
//	
//	
//	//결제 정보 저장
//	@Override 
	
	

	// 위시리스트
	@Override
	public Map<String, Object> setHotelLike(WishlistAccomDTO wishaccom) throws ServiceException, DAOException {

		try {
			Map<String, Object> original_wish_data = this.mapper.selectHotelLike(wishaccom);
			Map<String, Object> result = new HashMap<String, Object>();
			if (original_wish_data == null) {
				// 좋아요 등록
				Integer likeCount = this.mapper.selectCountHotelLike(wishaccom);
				if (likeCount >= 50) {
					result.put("success", 2);
				} else {
					result.put("success", this.mapper.insertHotelLike(wishaccom));
				}
				result.put("type", "insert");
			} else {
				// 좋아요 삭제
				result.put("success", this.mapper.deleteHotelLike(wishaccom));
				result.put("type", "delete");
			}
			return result;
		} catch (DAOException e) {
			throw new ServiceException(e);
		}

	}

	// 회원의 현재포인트를 점검(업데이트)하고, 가져오는 트랜잭션
	@Transactional
	@Override
	public Integer getUserCurrentPoint(MemberVO member) throws ServiceException {
		try {
			try {
				this.mapper.updateMemberPoint(member);
			} // 포인트 내역이 없어 업데이트를 할 수 없는 신규회원은,
			catch (UncategorizedSQLException e) {
				;
				;
			} // inner try-catch(Pass)

			return this.mapper.selectUserCurrentPoint(member);
		} catch (Exception e) {
			throw new ServiceException(e);
		} // try-catch
	} // getUserCurrentPoint

	// 총 레코드 건수를 반환하는 메소드(페이징 처리에 필요)
	@Override
	public int getTotal(AccomDTO accom) throws ServiceException {
		log.trace("getTotal() invoked.");
		try {
			return this.mapper.getTotalHotelCount(accom);
		} catch (DAOException e) {
			throw new ServiceException(e);
		}
	}
	
//	헤더검색
	
	@Override
	public List<AccomDTO> searchList(Criteria cri, String keyword) throws ServiceException {
		
		try {
			return this.mapper.selectSearchKeyword(cri,keyword);
		} catch (DAOException e) {
			throw new ServiceException(e);
		}
		
	}

	@Override
	public int searchLIsttotal(String keyword,AccomDTO accom) throws ServiceException {
		log.trace("getTotal() invoked.");
		try {
			return this.mapper.getTotalKeywordSearch(keyword,accom);
		} catch (DAOException e) {
			throw new ServiceException(e);
		}
	}


	

} // end class
