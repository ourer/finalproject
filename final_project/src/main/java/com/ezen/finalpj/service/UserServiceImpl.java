package com.ezen.finalpj.service;

import javax.inject.Inject;

import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;

import com.ezen.finalpj.domain.ProfileVO;
import com.ezen.finalpj.domain.UserDTO;
import com.ezen.finalpj.domain.UserVO;
import com.ezen.finalpj.repository.ProfileDAO;
import com.ezen.finalpj.repository.UserDAO;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service
public class UserServiceImpl implements UserService {
	
	@Inject
	private UserDAO udao;
	@Inject
	private ProfileDAO pdao;
	
	@Inject
	BCryptPasswordEncoder passwordEncoder;

	@Override
	public int register(UserVO uvo) {
		log.info(">>> User register check2");
		UserVO tmpUser = udao.getUser(uvo.getEmail());
		
		if(tmpUser != null) {
			return 0;
		}
		if(uvo.getEmail()==null || uvo.getEmail().length()==0) {
			return 0;
		}
		if(uvo.getPw()==null || uvo.getPw().length()==0) {
			return 0;
		}
		
		String pw = uvo.getPw();
		String encodepw = passwordEncoder.encode(pw);
		uvo.setPw(encodepw);
		udao.insertUser(uvo);
		
		return 1;
	}

	@Override
	public int register(UserDTO udto) {
		log.info("User register(udto) check2");
		int isOK = udao.insertUser(udto.getUvo());
		if(isOK > 0 && udto.getPList().size() > 0) {
			String email = pdao.selectOneUser();
			for(ProfileVO pvo : udto.getPList()) {
				pvo.setEmail(email);
				log.info(">>>file :"+ pvo.toString());
				isOK *= pdao.insertFile(pvo);
			}
		}
		return isOK;
	}

	@Override
	public UserVO isUser(String email, String pw) {
		UserVO user = udao.getUser(email);
		
		if(user == null) return null;
		
		if(passwordEncoder.matches(pw, user.getPw())) {
			return user;
		}else {
			return null;
		}
	}

}