package com.pj.gabozago.service.mypage;

import java.util.ArrayList;
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


	// 해당 회원의 숙소 위시리스트 내역을 가져오는 메소드
	@Override
	public List<LinkedHashMap<String, Object>> getAccomWishlist(Criteria cri, MemberVO member) throws ServiceException {
		log.trace("getAccomWishlist() invoked.");
		
		try { return this.mapper.selectAccomWishlist(cri, member); } 
		catch (DAOException e) { throw new ServiceException(e); }
	} // getAccomWishlist
	
	
	// 해당 회원의 일정 위시리스트 내역을 가져오는 메소드
	@Override
	public List<LinkedHashMap<String, Object>> getPlanWishlist(Criteria cri, MemberVO member) throws ServiceException {
//		log.trace("getPlanWishlist() invoked.");
		
		try { 
			List<LinkedHashMap<String, Object>> finalList = new ArrayList<LinkedHashMap<String,Object>>();		// 최종데이터
			List<LinkedHashMap<String, Object>> tempList = this.mapper.selectPlanWishlist(cri, member); 		// 임시데이터
			
			for(int i = 0 ; i < tempList.size() ; i++) {
				LinkedHashMap<String, Object> finalMap = new LinkedHashMap<String, Object>();
				
				// put travelPlan into finalMap
				finalMap.put("travelPlan", tempList.get(i));

				// put travelPlanDetail into finalMap
				Object travelPlanIdx = tempList.get(i).get("TRAVEL_PLAN_IDX");
				finalMap.put("travelPlanDetail", this.mapper.selectPlanDetail(travelPlanIdx));
				
				finalList.add(finalMap);	
			} // outer-for
			
			return finalList;
		} catch (DAOException e) { 
			throw new ServiceException(e); 
		} // try-catch
	} // getPlanWishlist


	// 숙소 위시리스트 삭제
	@Override
	public void deleteAccomWishlist(String idx) throws ServiceException {
		try { this.mapper.deleteAccomWishlist(idx); } 
		catch (DAOException e) { throw new ServiceException(e); }
	} // deleteAccomWishlist


	// 일정 위시리스트 삭제
	@Override
	public void deletePlanWishlist(String idx) throws ServiceException {
		try { this.mapper.deletePlanWishlist(idx); } 
		catch (DAOException e) { throw new ServiceException(e); }
	} // deletePlanWishlist

	
} // end class
