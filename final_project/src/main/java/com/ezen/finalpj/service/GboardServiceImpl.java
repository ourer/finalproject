package com.ezen.finalpj.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.ezen.finalpj.domain.GboardVO;
import com.ezen.finalpj.repository.GboardDAO;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service
public class GboardServiceImpl implements GboardService {
	@Inject
	private GboardDAO gbdao;

	@Override
	public List<GboardVO> selectListGbrd(int grno) {
		log.info("그룹 게시판 호출");
		return gbdao.selectListGbrd(grno);
	}

	@Override
	public int insertGbrd(GboardVO gbvo) {
		log.info("그룹 게시글 등록");
		return gbdao.insertGbrd(gbvo);
	}

	@Override
	public GboardVO selectDetailGbrd(int gbno) {
		log.info("그룹 디테일");
		return gbdao.selectDetailGbrd(gbno);
	}

	@Override
	public int updateViewGbrd(int gbno) {
		log.info("조회수 업데이트");
		return gbdao.updateViewGbrd(gbno);
	}

	@Override
	public int updateGbrd(GboardVO gbvo) {
		log.info("게시글 수정");
		return gbdao.updateGbrd(gbvo);
	}

	@Override
	public int deleteGbrd(int gbno) {
		log.info("게시글 삭제");
		return gbdao.deleteGbrd(gbno);
	}
}
