package com.ezen.finalpj.service;

import java.util.List;

import com.ezen.finalpj.domain.FavoriteVO;

public interface FavoriteService {

	int selectFavorite(FavoriteVO fvo);

	int deleteFavorite(FavoriteVO fvo);

	int insertFavorite(FavoriteVO fvo);

	List<FavoriteVO> selectListFavorite(int grno);

}
