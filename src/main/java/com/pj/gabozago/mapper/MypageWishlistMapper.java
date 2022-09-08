package com.pj.gabozago.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Select;

import com.pj.gabozago.domain.PointHistoryVO;
import com.pj.gabozago.domain.WishlistAccomVO;
import com.pj.gabozago.domain.WishlistPlanVO;
import com.pj.gabozago.exception.DAOException;


public interface MypageWishlistMapper {		// 위시리스트 페이지 관련 mapper

	@Select("SELECT * FROM tbl_wishlist_accom WHERE idx = 94")
	public abstract List<WishlistAccomVO> selectOneWishlistAccom() throws DAOException;
	
	@Select("SELECT * FROM tbl_wishlist_plan WHERE idx = 53")
	public abstract List<WishlistPlanVO> selectOneWishlistPlan() throws DAOException;
	
} // end interface
