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


	// 일정 위시리스트의 총 레코드 건수를 반환하는 메소드(페이징 처리에 필요)
	@Override
	public int getTotalOfPlan(Criteria cri, MemberVO member) throws ServiceException {
		log.trace("getTotalOfPlan() invoked.");
		
		try { return this.mapper.countTotalAmountOfPlan(cri, member); } 
		catch (DAOException e) { throw new ServiceException(e); }
	} // getTotalOfPlan
	
	
	// 해당 회원의 일정 위시리스트 내역을 가져오는 메소드
	@Override
	public List<LinkedHashMap<String, Object>> getPlanWishlist(Criteria cri, MemberVO member) throws ServiceException {
		log.trace("getPlanWishlist() invoked.");
		
		try { 
			List<LinkedHashMap<String, Object>> finalList = new ArrayList<LinkedHashMap<String,Object>>();		// 최종데이터
			List<LinkedHashMap<String, Object>> tempList = this.mapper.selectPlanWishlist(cri, member); 		// 임시데이터
			
			for(int i = 0 ; i < tempList.size() ; i++) {
				LinkedHashMap<String, Object> finalMap = new LinkedHashMap<String, Object>();

				int travelPlanIdx = Integer.parseInt(String.valueOf(tempList.get(i).get("TRAVEL_PLAN_IDX")));
				int totalDays = Integer.parseInt(String.valueOf(tempList.get(i).get("TOTAL_DAYS")));
				
				finalMap.put("wishlistIdx", tempList.get(i).get("IDX"));
				finalMap.put("travelPlanIdx", travelPlanIdx);
				finalMap.put("largeAreaName", tempList.get(i).get("LARGE_AREA_NAME"));
				finalMap.put("nickname", tempList.get(i).get("NICKNAME"));
				finalMap.put("likes", tempList.get(i).get("LIKES"));
				finalMap.put("totalDays", totalDays);
				
				for(int j = 1 ; j <= totalDays ; j++) {
					List<LinkedHashMap<String, Object>> tempPlanDetail = this.mapper.selectPlanDetail(travelPlanIdx, j);
					finalMap.put("DAY" + j, tempPlanDetail);
				} // inner-for
				
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
