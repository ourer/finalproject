package com.ezen.finalpj.service;

import java.util.List;

import com.ezen.finalpj.domain.PagingVO;
import com.ezen.finalpj.domain.UserVO;

public interface UserService {

	UserVO login(UserVO user);

	List<UserVO> getList(PagingVO pgvo);

	int getPageCount(PagingVO pgvo);

	List<UserVO> getWaiting(PagingVO pgvo1, int wno);

	List<UserVO> getMemberList(PagingVO pgvo2, int wno);


}
