package com.ezen.finalpj.repository;

import com.ezen.finalpj.domain.GroupVO;

public interface GroupDAO {

	int insertGrp(GroupVO gvo);

	GroupVO selectGrp(int grno);

	int selectGrnoGrp(String email);

}
