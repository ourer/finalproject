package com.ezen.finalpj.service;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import com.ezen.finalpj.domain.FavoriteDTO;
import com.ezen.finalpj.domain.FavoriteVO;
import com.ezen.finalpj.domain.GroupVO;

public interface FavoriteService {

	int selectFavorite(FavoriteVO fvo);

	int deleteFavorite(FavoriteVO fvo);

	int insertFavorite(FavoriteVO fvo);

	List<GroupVO> groupList(String email);




}
