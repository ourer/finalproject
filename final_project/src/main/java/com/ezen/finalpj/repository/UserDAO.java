package com.ezen.finalpj.repository;

import java.util.List;

import com.ezen.finalpj.domain.UserVO;

public interface UserDAO {

	UserVO getUser(String email);

	List<UserVO> selectList(UserVO user);

}
