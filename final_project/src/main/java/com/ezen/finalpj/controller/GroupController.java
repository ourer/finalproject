package com.ezen.finalpj.controller;

import javax.inject.Inject;

import org.springframework.http.MediaType;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.ezen.finalpj.domain.GroupVO;
import com.ezen.finalpj.service.GroupService;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@RequestMapping("/group/*")
@Controller
public class GroupController {
	@Inject
	private GroupService gsv;
	
	@GetMapping("/register")
	public String insertGrpGet() {
		return "/group/register";
	}
	
	@PostMapping(value = "/register", consumes = "application/json", produces = {MediaType.TEXT_PLAIN_VALUE})
	public String insertGrpPost(@RequestBody GroupVO gvo) {
		int isOk=gsv.insertGrp(gvo);
		log.info("소모임 생성"+(isOk>0?"성공":"실패"));
		return "/";
	}
	
	@GetMapping("/main")
	public String selectGrpGet(@RequestParam("grno")int grno, Model model) {
		//GroupVO gvo=gsv.selectGrp(grno);
		//승희야 스케줄도 해야 한다..조인펄슨도..
		//model.addAttribute("gvo", gvo);
		return "/";
	}
}
