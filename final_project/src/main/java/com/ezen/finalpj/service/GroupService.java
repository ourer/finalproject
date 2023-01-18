package com.ezen.finalpj.service;

import java.util.List;

import com.ezen.finalpj.domain.GroupVO;
import com.ezen.finalpj.domain.PagingVO;
import com.ezen.finalpj.domain.SgMainVO;
import com.ezen.finalpj.domain.WaitingVO;

public interface GroupService {

	int insertGrp(GroupVO gvo);

	GroupVO selectGrp(int grno);

	int selectGrnoGrp(String email);

	int insertSgMain(SgMainVO smvo);

	SgMainVO selectSgMain(int grno);

	int deleteSgMain(int grno);

	List<GroupVO> CategoryOne(String code);

	List<GroupVO> selectGrpList();

	int removeGrp(String grno);

}
