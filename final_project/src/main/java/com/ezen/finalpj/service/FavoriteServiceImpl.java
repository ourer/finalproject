package com.ezen.finalpj.service;

import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Service;

import com.ezen.finalpj.domain.CategoryVO;
import com.ezen.finalpj.domain.FavoriteDTO;
import com.ezen.finalpj.domain.FavoriteVO;
import com.ezen.finalpj.domain.GroupVO;
import com.ezen.finalpj.repository.FavoriteDAO;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service
public class FavoriteServiceImpl implements FavoriteService {
	@Inject
	private FavoriteDAO fdao;

	@Override
	public int selectFavorite(FavoriteVO fvo) {
		log.info("찜 서비스");
		int hasFav=fdao.selectFavorite(fvo);
		return hasFav;
	}

	@Override
	public int deleteFavorite(FavoriteVO fvo) {
		log.info("찜 삭제");
		int isOk=fdao.deleteFavorite(fvo);
		return isOk;
	}

	@Override
	public int insertFavorite(FavoriteVO fvo) {
		log.info("찜 추가");
		int isOk=fdao.insertFavorite(fvo);
		return isOk;
	}

	@Override
	public List<GroupVO> groupList(String email) {
		log.info("찜 목록");
		return fdao.selectGroupList(email);
	}


	@Override
	public List<FavoriteDTO> favoriteList(String email) {
		log.info("찜 목록 카테고리");
		return fdao.selectFavoriteList(email);
	}


}
