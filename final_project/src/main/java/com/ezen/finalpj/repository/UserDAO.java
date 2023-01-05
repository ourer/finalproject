package com.ezen.finalpj.repository;

import com.ezen.finalpj.domain.UserVO;

public interface UserDAO {

	UserVO getUser(String email);

	void insertUser(UserVO uvo);



}
