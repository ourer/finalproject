package com.ezen.finalpj.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.ezen.finalpj.domain.UserVO;
import com.ezen.finalpj.repository.ManagerDAO;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service
public class ManagerServiceImpl implements ManagerService {
	
	@Inject
	private ManagerDAO mdao;

	@Override
	public List<UserVO> getAllList(String email) {
		log.info("user list 2");
		return mdao.selectAllList(email);
	}
}
