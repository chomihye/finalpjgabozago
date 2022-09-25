package com.pj.gabozago.service.mypage;

import java.util.ArrayList;
import java.util.LinkedHashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.UncategorizedSQLException;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.pj.gabozago.domain.CommunityVO;
import com.pj.gabozago.domain.Criteria;
import com.pj.gabozago.domain.MemberVO;
import com.pj.gabozago.domain.PointHistoryVO;
import com.pj.gabozago.exception.DAOException;
import com.pj.gabozago.exception.ServiceException;
import com.pj.gabozago.mapper.MypagePlanPointWriteMapper;

import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.extern.log4j.Log4j2;


@Log4j2
@NoArgsConstructor

@Service
//여행일정, 마이포인트, 작성글/댓글 페이지 관련 service
public class MypagePlanPointWriteServiceImpl implements MypagePlanPointWriteService {

	
	@Setter(onMethod_ = {@Autowired})
	private MypagePlanPointWriteMapper mapper;
	
	
//	============================================== 여행일정 ============================================== //
	
	// 회원이 작성한 여행일정 리스트를 가져오는 메소드
	@Override
	public List<LinkedHashMap<String, Object>> getPlanList(Criteria cri, MemberVO member) throws ServiceException{
//		log.trace("getPlanList() invoked.");
		
		try { 
			List<LinkedHashMap<String, Object>> finalList = new ArrayList<LinkedHashMap<String,Object>>();		// 최종데이터
			List<LinkedHashMap<String, Object>> tempList = this.mapper.selectPlanList(cri, member);				// 임시데이터
			
			for(int i = 0 ; i < tempList.size() ; i++) {
				LinkedHashMap<String, Object> finalMap = new LinkedHashMap<String, Object>();

				// 아이템 넘버
				finalMap.put("itemNumber", i+1);
				
				// 마지막 수정 날짜
				if(tempList.get(i).get("UPDATE_TS") == null) {
					finalMap.put("lastUpdate", tempList.get(i).get("INSERT_TS"));
				}else {
					finalMap.put("lastUpdate", tempList.get(i).get("UPDATE_TS"));
				} // if-else
				
				tempList.get(i).remove("INSERT_TS");
				tempList.get(i).remove("UPDATE_TS");
				
				// travelPlan
				finalMap.put("travelPlan", tempList.get(i));
			
				// travelPlanDetail & eachDays
				Object travelPlanIdx = tempList.get(i).get("TRAVEL_PLAN_IDX");
				finalMap.put("travelPlanDetail", this.mapper.selectPlanDetail(travelPlanIdx));
				
				int days = Integer.parseInt(String.valueOf(tempList.get(i).get("DAYS")));
				
				List<Integer> eachDays = new ArrayList<Integer>();
				
				for(int j = 1 ; j <= days ; j++) {
					eachDays.add(j);
				} // inner-for
				
				finalMap.put("eachDays", eachDays);
				
				finalList.add(finalMap);	
			} // outer-for
			
			return finalList;
		} catch (DAOException e) { 
			throw new ServiceException(e); 
		} // try-catch
	} // getPlanList
	
	// 여행일정 삭제 메소드
	public void deletePlan(int idx) throws ServiceException{
		log.trace("deletePlan() invoked.");
		
		try { this.mapper.deletePlan(idx); } 
		catch (DAOException e) { throw new ServiceException(e); }
	} // deletePlan
	
	
//	============================================== 마이포인트 ============================================== //
	
	@Override
	public List<PointHistoryVO> getUserPointList(Criteria cri, MemberVO member) throws ServiceException {
		log.trace("getUserPointList({}) invoked.", cri);
		
		try { return this.mapper.selectUserPointList(cri, member); } 
		catch (Exception e) { throw new ServiceException(e); }
	} // getUserPointList


	// 회원의 현재포인트를 점검(업데이트)하고, 가져오는 트랜잭션
	@Transactional
	@Override
	public Integer getUserCurrentPoint(MemberVO member) throws ServiceException {
		try { 
			try { this.mapper.updateMemberPoint(member); }		// 포인트 내역이 없어 업데이트를 할 수 없는 신규회원은,
			catch (UncategorizedSQLException e) { ;; }			// inner try-catch(Pass)
			
			return this.mapper.selectUserCurrentPoint(member); 
		} catch (Exception e) { 
			throw new ServiceException(e); 
		} // try-catch
	} // getUserCurrentPoint
	
	
	// 포인트만 업데이트 하는 메소드
	@Override
	public void updateMemberPoint(MemberVO member) throws ServiceException {
		try { 
			try { this.mapper.updateMemberPoint(member); }		// 포인트 내역이 없어 업데이트를 할 수 없는 신규회원은,
			catch (UncategorizedSQLException e) { ;; }			// inner try-catch(Pass)
		} catch (Exception e) { 
			throw new ServiceException(e); 
		} // try-catch
	} // updateMemberPoint
	
	// 회원의 현재포인트를 가져오는 메소드
	@Override
	public Integer getCurrentPoint(MemberVO member) throws ServiceException {
		try { return this.mapper.selectUserCurrentPoint(member); } 
		catch (Exception e) { throw new ServiceException(e); } // try-catch
	} // getCurrentPoint
	
	
//	============================================== 작성 글/댓글 ============================================== //

	// 작성글 리스트를 가져오는 메소드
	@Override
	public List<CommunityVO> getWriteList(Criteria cri, MemberVO member) throws ServiceException {
		log.trace("getWriteList({}) invoked.", cri);
		
		try { return this.mapper.selectWriteList(cri, member); } 
		catch (DAOException e) { throw new ServiceException(e); }
	} // getWriteList
	
	
	// 작성댓글 리스트를 가져오는 메소드
	@Override
	public List<LinkedHashMap<String, Object>> getCommentList(Criteria cri, MemberVO member) throws ServiceException {
		log.trace("getCommentList({}) invoked.", cri);
		
		try { return this.mapper.selectCommentList(cri, member); } 
		catch (DAOException e) { throw new ServiceException(e); } // try-catch
	} // getCommentList
	
	
} // end class
