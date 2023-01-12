package com.ezen.finalpj.repository;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import com.ezen.finalpj.domain.FavoriteDTO;
import com.ezen.finalpj.domain.FavoriteVO;
import com.ezen.finalpj.domain.GroupVO;

public interface FavoriteDAO {

	int selectFavorite(FavoriteVO fvo);

	int deleteFavorite(FavoriteVO fvo);

	int insertFavorite(FavoriteVO fvo);

	List<GroupVO> selectGroupList(String email);

}
