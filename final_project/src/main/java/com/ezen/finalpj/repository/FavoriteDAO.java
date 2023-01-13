package com.ezen.finalpj.repository;

import java.util.List;

import com.ezen.finalpj.domain.FavoriteVO;

public interface FavoriteDAO {

	int selectFavorite(FavoriteVO fvo);

	int deleteFavorite(FavoriteVO fvo);

	int insertFavorite(FavoriteVO fvo);

	List<FavoriteVO> selectListFavorite(int grno);

}
