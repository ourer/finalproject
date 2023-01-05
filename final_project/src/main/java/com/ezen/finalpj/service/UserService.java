package com.ezen.finalpj.service;

import java.util.List;

import com.ezen.finalpj.domain.UserVO;

public interface UserService {

	UserVO login(UserVO user);

	List<UserVO> getList(UserVO user);


}
