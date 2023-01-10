package com.ezen.finalpj.repository;

import com.ezen.finalpj.domain.GroupVO;
import com.ezen.finalpj.domain.SgMainVO;

public interface GroupDAO {

	int insertGrp(GroupVO gvo);

	GroupVO selectGrp(int grno);

	int selectGrnoGrp(String email);

	int insertSgMain(SgMainVO smvo);

	SgMainVO selectSgMain(int grno);

	int deleteSgMain(int grno);


}
