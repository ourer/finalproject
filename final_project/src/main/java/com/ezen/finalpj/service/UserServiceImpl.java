package com.ezen.finalpj.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.ezen.finalpj.domain.ManagerDTO;
import com.ezen.finalpj.domain.UserVO;
import com.ezen.finalpj.repository.UserDAO;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service
public class UserServiceImpl implements UserService {
	@Inject
	private UserDAO udao;

	@Override
	public int updateCapUser(ManagerDTO managerDTO) {
		log.info("방장 업데이트");
		return udao.updateCap(managerDTO);
	}

	@Override
	public List<UserVO> selectMemListUserGet(int grno) {
		log.info("소모임 멤버 리스트");
		return udao.selectMemListUser(grno);
	}

	@Override
	public UserVO selectCapGet(int grno) {
		log.info("방장 추출");
		return udao.selectCap(grno);
	}
	
}
