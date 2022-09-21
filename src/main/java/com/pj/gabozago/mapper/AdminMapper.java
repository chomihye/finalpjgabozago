package com.pj.gabozago.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;

import com.pj.gabozago.domain.Criteria;
import com.pj.gabozago.domain.MemberDTO;
import com.pj.gabozago.domain.NoticeVO;
import com.pj.gabozago.exception.DAOException;

public interface AdminMapper {
	
	// 총 레코드 건수를 반환하는 메소드(페이징 처리에 필요)
	@Select("SELECT count(idx) FROM tbl_member")
	public abstract Integer countTotalAmount(Criteria cri) throws DAOException;
	   
	// 회원 정보를 가져오는 메소드
	public abstract List<Map<String, Object>> selectMemberInfo(Criteria cri) throws DAOException;

	// 회원 상세 정보를 가져오는 메소드
	public abstract Map<String, Object> getMemberInfoDetail(MemberDTO member) throws DAOException;
	
	// 공지사항을 가져오는 메소드
	public abstract List<Map<String, Object>> getNotice(Criteria cri) throws DAOException;
			
} // end interface
