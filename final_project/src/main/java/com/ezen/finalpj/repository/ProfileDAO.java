package com.ezen.finalpj.repository;

import com.ezen.finalpj.domain.ProfileVO;

public interface ProfileDAO {

	int insertFile(ProfileVO pvo);

	String selectOneUser();

}
