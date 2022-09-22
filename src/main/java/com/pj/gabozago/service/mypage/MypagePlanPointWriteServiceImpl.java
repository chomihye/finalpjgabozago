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
	
	// 총 레코드 건수를 반환하는 메소드(페이징 처리에 필요)
	@Override
	public Integer getTotalOfPlan(Criteria cri, MemberVO member) throws ServiceException{
		log.trace("getTotalOfPlan() invoked.");
		
		try { return this.mapper.countTotalOfPlan(cri, member); } 
		catch (DAOException e) { throw new ServiceException(e); }
	} // getTotalOfPlan
		
	// 회원이 작성한 여행일정 리스트를 가져오는 메소드
	@Override
	public List<LinkedHashMap<String, Object>> getPlanList(Criteria cri, MemberVO member) throws ServiceException{
		log.trace("getPlanList() invoked.");
		
		try { 
			List<LinkedHashMap<String, Object>> finalList = new ArrayList<LinkedHashMap<String,Object>>();		// 최종데이터
			List<LinkedHashMap<String, Object>> tempList = this.mapper.selectPlanList(cri, member);				// 임시데이터
			
			for(int i = 0 ; i < tempList.size() ; i++) {
				LinkedHashMap<String, Object> finalMap = new LinkedHashMap<String, Object>();

				int travelPlanIdx = Integer.parseInt(String.valueOf(tempList.get(i).get("TRAVEL_PLAN_IDX")));
				int days = Integer.parseInt(String.valueOf(tempList.get(i).get("DAYS")));
				
				finalMap.put("itemNumber", i+1);
				finalMap.put("travelPlanIdx", travelPlanIdx);
				finalMap.put("isPublic", tempList.get(i).get("IS_PUBLIC"));
				finalMap.put("largeAreaName", tempList.get(i).get("LARGE_AREA_NAME"));
				finalMap.put("startDate", tempList.get(i).get("START_DATE"));
				finalMap.put("endDate", tempList.get(i).get("END_DATE"));
				finalMap.put("days", days);
				
				if(tempList.get(i).get("UPDATE_TS") == null) {
					finalMap.put("lastUpdate", tempList.get(i).get("INSERT_TS"));
				}else {
					finalMap.put("lastUpdate", tempList.get(i).get("UPDATE_TS"));
				} // if-else
				
				List<Integer> eachDays = new ArrayList<Integer>();
				
				for(int j = 1 ; j <= days ; j++) {
					List<LinkedHashMap<String, Object>> tempPlanDetail = this.mapper.selectPlanDetail(travelPlanIdx, j);
					finalMap.put("DAY" + j, tempPlanDetail);
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
	
	// 총 레코드 건수를 반환하는 메소드(페이징 처리에 필요)
	@Override
	public int getTotalOfPoint(Criteria cri, MemberVO member) throws ServiceException {
		log.trace("getTotal() invoked.");
		
		try { return this.mapper.countTotalOfPoint(cri, member); } 
		catch (DAOException e) { throw new ServiceException(e); }
	}  // getTotal
	
	
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
	
	
//	============================================== 작성 글 ============================================== //

	// 총 레코드 건수를 반환하는 메소드(페이징 처리에 필요)
	@Override
	public Integer getTotalOfWrite(MemberVO member) throws ServiceException {
		log.trace("getTotalOfWrite({}) invoked.");
		
		try { return this.mapper.countTotalOfWrite(member); } 
		catch (DAOException e) { throw new ServiceException(e); }
	} // getTotalOfWrite

	// 작성글 리스트를 가져오는 메소드
	@Override
	public List<CommunityVO> getWriteList(Criteria cri, MemberVO member) throws ServiceException {
		log.trace("getWriteList({}) invoked.", cri);
		
		try { return this.mapper.selectWriteList(cri, member); } 
		catch (DAOException e) { throw new ServiceException(e); }
	} // getWriteList
	
	
//	============================================== 작성 댓글 ============================================== //

	// 총 레코드 건수를 반환하는 메소드(페이징 처리에 필요)
	@Override
	public Integer getTotalOfComment(MemberVO member) throws ServiceException {
		log.trace("getTotalOfComment({}) invoked.");
		
		try { return this.mapper.countTotalOfComment(member); } 
		catch (DAOException e) { throw new ServiceException(e); }
	} // getTotalOfComment

	// 작성댓글 리스트를 가져오는 메소드
	@Override
	public List<LinkedHashMap<String, Object>> getCommentList(Criteria cri, MemberVO member) throws ServiceException {
		log.trace("getCommentList({}) invoked.", cri);
		
		try { return this.mapper.selectCommentList(cri, member); } 
		catch (DAOException e) { throw new ServiceException(e); } // try-catch
	} // getCommentList
	
	
} // end class
