package com.ezen.finalpj.controller;

import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.ezen.finalpj.domain.UserVO;
import com.ezen.finalpj.service.UserService;

@RequestMapping("/user/*")
@Controller
public class UserController {
	private static final Logger log=LoggerFactory.getLogger(ManagerController.class);
	
	@Inject
	private UserService usv;
	
	@GetMapping("/login")
	public String loginGet() {
		return "/user/login";
	}
	@PostMapping("/login")
	public String loginPost(UserVO user,HttpServletRequest req) {
		log.info("login>> "+user.toString());
		UserVO loginUser=usv.login(user);
		log.info("loginUser>>"+loginUser.toString());
		if(loginUser !=null) {
			HttpSession ses=req.getSession();
			ses.setAttribute("ses", loginUser);
			log.info("로그인 성공");
			return "/home";
		}
		return null;
		
	}
	
	//전체 회원 조회x=> 나의 멤버가 아닌 사람들을 조회한다. 어떻게??
	//grno를 기준으로 나누는건 안다. 여기서는 전체를 불러온다. 그럼 mapper에서 grno가 다른 놈들을 걸르자
	//grade가 A인 사람과 다른 grno를 가진 놈을 부른다. 
	@GetMapping("/userlist")
	public String list(Model model,UserVO user) {
		List<UserVO> list=usv.getList(user); 
		log.info("list : "+list.get(0).toString());
		model.addAttribute("list",list);
		return "/myPage/userlist";
	}
	
	
	
}
