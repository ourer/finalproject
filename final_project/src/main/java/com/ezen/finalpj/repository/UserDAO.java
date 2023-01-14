package com.ezen.finalpj.repository;

import java.util.List;

import com.ezen.finalpj.domain.FavoriteVO;
import com.ezen.finalpj.domain.ManagerDTO;
import com.ezen.finalpj.domain.UserVO;

public interface UserDAO {

	int updateCap(ManagerDTO managerDTO);

	//List<UserVO> selectMemListUser(int grno);

	UserVO selectCap(int grno);
	
	UserVO getUser(String email);

	int insertUser(UserVO uvo);
	
	List<UserVO> selectOnlyUser(UserVO user);
	
	List<UserVO> selectSecoundUser(UserVO user);
	
	int updateMyinfo(UserVO uvo);

	List<UserVO> selectMemList(int grno);

	int emailCheck(String email);

	int nicknameCheck(String nickname);
	
	List<UserVO> selectAllList();
	
	int deleteUser(String email);

	List<FavoriteVO> likeListCount(String email);

}
