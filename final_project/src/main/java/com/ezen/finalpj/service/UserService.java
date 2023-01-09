package com.ezen.finalpj.service;


import com.ezen.finalpj.domain.UserDTO;
import com.ezen.finalpj.domain.UserVO;

public interface UserService {

	int register(UserVO uvo);

	int register(UserDTO udto);

	UserVO isUser(String email, String pw);



}
