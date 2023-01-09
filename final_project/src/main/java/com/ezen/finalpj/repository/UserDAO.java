package com.ezen.finalpj.repository;

import java.util.List;

import com.ezen.finalpj.domain.ManagerDTO;
import com.ezen.finalpj.domain.UserVO;

public interface UserDAO {

	int updateCap(ManagerDTO managerDTO);

	List<UserVO> selectMemListUser(int grno);

	UserVO selectCap(int grno);


}
