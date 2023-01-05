package com.ezen.finalpj.controller;

import javax.inject.Inject;

import org.springframework.http.MediaType;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.ezen.finalpj.domain.UserVO;
import com.ezen.finalpj.service.UserService;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@RequestMapping("/user/*")
@Controller
public class UserController {
	
	@Inject
	private UserService usv;
	
	@GetMapping("/")
	public ModelAndView home(ModelAndView mv) {
		mv.setViewName("/home");
		return mv;
	}
	
	@GetMapping("/register")
		public String register(){
		return "/user/register";
	}
	
	@PostMapping("/register")
		public ModelAndView register(UserVO uvo, ModelAndView mv){
		log.info(">>> User Register check 1");
		boolean isUP = usv.register(uvo);
		if(isUP) {
			mv.addObject("msg", "1");
			mv.setViewName("/");
		}else {
			mv.addObject("msg", "0");
			mv.setViewName("/user/register");
		}
		return mv;
	}

}