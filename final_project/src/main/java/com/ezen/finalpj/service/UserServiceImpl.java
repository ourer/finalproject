package com.ezen.finalpj.service;

import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;

import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;

import com.ezen.finalpj.domain.CapUserDTO;
import com.ezen.finalpj.domain.ManagerDTO;
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
	
	
	@Override
	public int register(UserDTO udto) {
		log.info("User register(udto) check2");
		String pw = udto.getUvo().getPw();
		log.info(">>>serviceImpl : "+pw);
		String encodepw = passwordEncoder.encode(pw);
		log.info(">>>serviceImpl : "+encodepw);
		udto.getUvo().setPw(encodepw);
//		udao.insertUser(udto.getUvo());
		int isOK = udao.insertUser(udto.getUvo());
		if(isOK > 0 && udto.getPList().size() > 0) {
			String email = udto.getUvo().getEmail();
			log.info(email);
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
		UserVO uvo = udao.getUser(email);
		log.info(">>>ServiceImpl : "+uvo.toString());
		if(uvo == null) return null;
		
		if(passwordEncoder.matches(pw, uvo.getPw())) {
			return uvo;
		}else {
			return null;
		}
	}
	
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
		log.info(">>>serviceImpl : "+pw);
		String encodepw = passwordEncoder.encode(pw);
		log.info(">>>serviceImpl : "+encodepw);
		uvo.setPw(encodepw);
		udao.insertUser(uvo);
		
		return 1;
	}
	

	@Override
	public List<UserVO> getOnlyList1(UserVO user) {
		log.info("waiting1 list user check");
		return udao.selectOnlyUser(user);
	}


	@Override
	public UserVO getMyOnlyuser(HttpServletRequest req) {
		UserVO user=(UserVO)req.getSession().getAttribute("ses");
		log.info("ses : "+user.getEmail().toString());
		return user;
	}

	@Override
	public List<UserVO> getOnlyList2(UserVO user) {
		log.info("waiting2 list user check");
		return udao.selectSecoundUser(user);
	}
	
	@Override
	public int modifyMyinfo(UserVO uvo) {
		log.info("modify myinfo user check");
		return udao.updateMyinfo(uvo);
	}

//	@Override
//	public CapUserDTO selectCapGet(int grno) {
//		CapUserDTO capUdto=new CapUserDTO();
//		UserVO uvo=udao.selectCap(grno);
//		log.info(uvo.toString());
//		ProfileVO pvo=pdao.selectProfile(uvo.getEmail());
//		capUdto.setGrno(uvo.getIsCap());
//		capUdto.setUEmail(uvo.getEmail());
//		capUdto.setUName(uvo.getName());
//		capUdto.setUNickname(uvo.getNickname());
//		capUdto.setUAge(uvo.getAge());
//		capUdto.setUPhone(uvo.getPhone());
//		capUdto.setUArea(uvo.getArea());
//		capUdto.setUGender(uvo.getGender());
//		capUdto.setPDir(pvo.getDir());
//		capUdto.setPUuid(pvo.getUuid());
//		capUdto.setPName(pvo.getName());
//		log.info(capUdto.toString());
//		return capUdto;
//	}
}
