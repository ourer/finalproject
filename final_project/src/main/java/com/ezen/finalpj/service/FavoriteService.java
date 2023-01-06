package com.ezen.finalpj.service;

import com.ezen.finalpj.domain.FavoriteVO;

public interface FavoriteService {

	int selectFavorite(FavoriteVO fvo);

	int deleteFavorite(FavoriteVO fvo);

	int insertFavorite(FavoriteVO fvo);

}
