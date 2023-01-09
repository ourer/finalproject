package com.ezen.finalpj.service;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.ezen.finalpj.domain.FavoriteVO;
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
}
