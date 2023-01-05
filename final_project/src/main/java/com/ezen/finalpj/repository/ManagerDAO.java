package com.ezen.finalpj.repository;

import java.util.List;

import com.ezen.finalpj.domain.UserVO;

public interface ManagerDAO {

	List<UserVO> selectAllList(String email);

}
