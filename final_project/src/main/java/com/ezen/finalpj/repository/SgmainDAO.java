package com.ezen.finalpj.repository;

import java.util.List;

import com.ezen.finalpj.domain.PagingVO;
import com.ezen.finalpj.domain.SgMainVO;

public interface SgmainDAO {

	List<SgMainVO> getSgmain(int grno);

	List<SgMainVO> getSgMainImg();

	List<SgMainVO> getSgMainImgPaging(PagingVO pgvo);

	int selectCount(PagingVO pgvo);

}
