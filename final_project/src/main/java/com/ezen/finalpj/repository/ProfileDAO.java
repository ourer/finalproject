package com.ezen.finalpj.repository;

import java.util.ArrayList;
import java.util.List;

import com.ezen.finalpj.domain.ProfileVO;

public interface ProfileDAO {

	int insertFile(ProfileVO pvo);

	String selectOneUser();

	ProfileVO selectProfile(String email);

	ProfileVO selectPersonalProfile(String email);

	
}