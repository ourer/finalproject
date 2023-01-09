package com.ezen.finalpj.repository;

import com.ezen.finalpj.domain.UserVO;

public interface UserDAO {

	UserVO getUser(String email);

	int insertUser(UserVO uvo);



}
