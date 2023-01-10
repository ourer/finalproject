package com.ezen.finalpj.service;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import com.ezen.finalpj.domain.CategoryVO;
import com.ezen.finalpj.domain.ManagerDTO;
import com.ezen.finalpj.domain.UserDTO;
import com.ezen.finalpj.domain.UserVO;

public interface UserService {

	int updateCapUser(ManagerDTO managerDTO);

	List<UserVO> selectMemListUserGet(int grno);

	UserVO selectCapGet(int grno);

	int register(UserDTO udto);

	UserVO isUser(String email, String pw);
	
	int register(UserVO uvo);
	
	List<UserVO> getOnlyList(UserVO user);
	
	UserVO getMyOnlyuser(HttpServletRequest req);

	int modifyMyinfo(UserVO uvo);

	List<CategoryVO> getCtList();

}
