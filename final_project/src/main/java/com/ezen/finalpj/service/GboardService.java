package com.ezen.finalpj.service;

import java.util.List;

import com.ezen.finalpj.domain.GboardDTO;
import com.ezen.finalpj.domain.GboardVO;

public interface GboardService {

	List<GboardVO> selectListGbrd(int grno);

	int insertGbrd(GboardVO gbvo);

	GboardVO selectDetailGbrd(int gbno);

	int updateViewGbrd(int gbno);

	int updateGbrd(GboardVO gbvo);

	int deleteGbrd(int gbno);

	int insertGbrd(GboardDTO gbdto);

	GboardDTO selectDetailFileGbrd(int gbno);

	int deleteFile(String uuid);

	int updateGbrd(GboardDTO gbdto);

}
