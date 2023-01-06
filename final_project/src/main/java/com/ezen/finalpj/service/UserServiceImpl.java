package com.ezen.finalpj.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.ezen.finalpj.domain.PagingVO;
import com.ezen.finalpj.domain.UserVO;
import com.ezen.finalpj.repository.UserDAO;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service
public class UserServiceImpl implements UserService {
	
	@Inject
	private UserDAO udao;
	
	@Override
	public UserVO login(UserVO user) {
		UserVO login=udao.getUser(user.getEmail());
		log.info("login check2");
		return login;
	}



	@Override
	public int getPageCount(PagingVO pgvo) {
		log.info("pagecount check");
		return udao.pageCount(pgvo);
	}


	@Override
	public List<UserVO> getWaiting(PagingVO pgvo1) {
		log.info("waiting user check");
		return udao.selectWaitingList(pgvo1);
	}


	@Override
	public List<UserVO> getMemberList(PagingVO pgvo2) {
		log.info("memberlist user check");
		return udao.selectMemberList(pgvo2);
	}





}
