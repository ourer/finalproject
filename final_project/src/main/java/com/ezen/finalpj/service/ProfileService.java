package com.ezen.finalpj.service;

import java.util.ArrayList;

import com.ezen.finalpj.domain.ProfileVO;

public interface ProfileService {

	ProfileVO selectProfile(String email);

	ProfileVO selectPersonalProfile(String email);

}
