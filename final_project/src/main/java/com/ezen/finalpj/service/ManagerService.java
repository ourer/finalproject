package com.ezen.finalpj.service;

import java.util.List;

import com.ezen.finalpj.domain.UserVO;

public interface ManagerService {

	List<UserVO> getAllList(String email);

}