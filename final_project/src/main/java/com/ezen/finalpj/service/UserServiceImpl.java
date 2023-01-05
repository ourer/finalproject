package com.ezen.finalpj.service;

import javax.inject.Inject;

import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;

import com.ezen.finalpj.domain.UserVO;
import com.ezen.finalpj.repository.UserDAO;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service
public class UserServiceImpl implements UserService {
	
	@Inject
	private UserDAO udao;
	
	@Inject
	BCryptPasswordEncoder passwordEncoder;

	@Override
	public boolean register(UserVO uvo) {
		log.info(">>> User register check2");
		UserVO tmpUser = udao.getUser(uvo.getEmail());
		
		if(tmpUser != null) {
			return false;
		}
		if(uvo.getEmail()==null || uvo.getEmail().length()==0) {
			return false;
		}
		if(uvo.getPw()==null || uvo.getPw().length()==0) {
			return false;
		}
		
		String pw = uvo.getPw();
		String encodepw = passwordEncoder.encode(pw);
		uvo.setPw(encodepw);
		udao.insertUser(uvo);
		
		return true;
	}


}
