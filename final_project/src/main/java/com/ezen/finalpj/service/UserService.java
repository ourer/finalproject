package com.ezen.finalpj.service;

import java.util.List;

import com.ezen.finalpj.domain.ManagerDTO;
import com.ezen.finalpj.domain.UserVO;

public interface UserService {

	int updateCapUser(ManagerDTO managerDTO);

	List<UserVO> selectMemListUserGet(int grno);

	UserVO selectCapGet(int grno);


}
