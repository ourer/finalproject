package com.ezen.finalpj.repository;

import java.util.List;

import com.ezen.finalpj.domain.ManagerDTO;
import com.ezen.finalpj.domain.UserDTO;
import com.ezen.finalpj.domain.UserVO;

public interface UserDAO {

	int updateCap(ManagerDTO managerDTO);

	List<UserVO> selectMemListUser(int grno);

	UserVO selectCap(int grno);
	
	UserVO getUser(String email);

	int insertUser(UserVO uvo);
	
	List<UserDTO> selectOnlyUser(UserDTO userandfile);

	List<UserDTO> selectSecoundUser(UserDTO userandfile);

}
