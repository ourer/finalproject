package com.ezen.finalpj.repository;

import java.util.List;

import com.ezen.finalpj.domain.PagingVO;
import com.ezen.finalpj.domain.UserVO;

public interface UserDAO {

	UserVO getUser(String email);

	List<UserVO> selectList(PagingVO pgvo);

	int pageCount(PagingVO pgvo);
	
	List<UserVO> selectWaitingList(PagingVO pgvo1);

	List<UserVO> selectMemberList(PagingVO pgvo2);

}
