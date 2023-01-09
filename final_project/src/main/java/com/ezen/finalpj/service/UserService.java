package com.ezen.finalpj.service;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import com.ezen.finalpj.domain.PagingVO;
import com.ezen.finalpj.domain.UserDTO;
import com.ezen.finalpj.domain.UserVO;
import com.ezen.finalpj.domain.WaitingVO;

public interface UserService {

	UserVO login(UserVO user);

	int getPageCount(PagingVO pgvo);

	List<UserVO> getWaiting(PagingVO pgvo1);

	List<UserVO> getMemberList(PagingVO pgvo2);

	List<UserVO> getOnlyList(UserVO user);

	UserVO getMyOnlyuser(HttpServletRequest req);







}
