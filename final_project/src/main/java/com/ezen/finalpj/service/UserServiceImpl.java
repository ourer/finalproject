package com.ezen.finalpj.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

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
	public List<UserVO> getList(UserVO user) {
		log.info("user list check");
		return udao.selectList(user);
	}



}
