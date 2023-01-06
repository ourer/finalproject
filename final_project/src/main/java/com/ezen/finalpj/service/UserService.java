package com.ezen.finalpj.service;

import java.util.List;

import com.ezen.finalpj.domain.PagingVO;
import com.ezen.finalpj.domain.UserVO;

public interface UserService {

	UserVO login(UserVO user);

	int getPageCount(PagingVO pgvo);

	List<UserVO> getWaiting(PagingVO pgvo1);

	List<UserVO> getMemberList(PagingVO pgvo2);


}
