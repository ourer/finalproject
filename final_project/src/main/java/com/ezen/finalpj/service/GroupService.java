package com.ezen.finalpj.service;

import com.ezen.finalpj.domain.GroupVO;

public interface GroupService {

	int insertGrp(GroupVO gvo);

	GroupVO selectGrp(int grno);

	int selectGrnoGrp(String email);
	
}
