package com.pj.gabozago.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;

import com.pj.gabozago.domain.AccomReservationVO;
import com.pj.gabozago.domain.Criteria;
import com.pj.gabozago.exception.DAOException;

public interface AdminReservMapper {

	// 총 레코드 건수를 반환하는 메소드(페이징 처리에 필요)
	@Select("SELECT count(idx) FROM tbl_reservation")
	public abstract Integer countTotalAmount(@Param("cri") Criteria cri, @Param("reserv") AccomReservationVO reserv) throws DAOException;
		   
	// 숙소 예약 정보를 가져오는 메소드
	public abstract List<Map<String, Object>> selectReservInfo(@Param("cri") Criteria cri, @Param("reserv") AccomReservationVO reserv) throws DAOException;
		
		
	// 숙소 예약취소 정보를 가져오는 메소드
	public abstract List<Map<String, Object>> selectCanReservInfo(@Param("cri") Criteria cri, @Param("reserv") AccomReservationVO reserv) throws DAOException;
		
		
		
}
