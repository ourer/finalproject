package com.ezen.finalpj.controller;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.ezen.finalpj.service.UserService;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@RequestMapping("/user/*")
@Controller
public class UserController {
	@Inject
	private UserService usv;
	
	@GetMapping("/mypage")
	public String userMypageGet() {
		return "/user/mypage";
	}
	
	@GetMapping("/like")
	public String userLikeGet() {
		return "/user/like";
	}
	
	@GetMapping("/myinfo")
	public String userMyinfoGet() {
		return "/user/myinfo";
	}
	
	@GetMapping("/management")
	public String userManagementGet() {
		return "/user/management";
	}
}
