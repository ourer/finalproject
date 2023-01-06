package com.ezen.finalpj.controller;

import java.util.List;

import javax.inject.Inject;

import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.ezen.finalpj.domain.GroupDTO;
import com.ezen.finalpj.domain.GroupVO;
import com.ezen.finalpj.domain.JoinPersonVO;
import com.ezen.finalpj.domain.ScheduleVO;
import com.ezen.finalpj.service.GroupService;
import com.ezen.finalpj.service.JoinPersonService;
import com.ezen.finalpj.service.ScheduleService;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@RequestMapping("/group/*")
@Controller
public class GroupController {
	@Inject
	private GroupService gsv;
	@Inject
	private ScheduleService ssv;
	@Inject
	private JoinPersonService jpsv;
	
	@GetMapping("/register")
	public String insertGrpGet() {
		return "/group/register";
	}
	
	@PostMapping(value = "/register", consumes = "application/json", produces = {MediaType.TEXT_PLAIN_VALUE})
	public ResponseEntity<String> insertGrpPost(@RequestBody GroupVO gvo) {
		int isOk=gsv.insertGrp(gvo);
		log.info("소모임 생성"+(isOk>0?"성공":"실패"));
		return isOk>0? new ResponseEntity<String>("1", HttpStatus.OK):new ResponseEntity<String>(HttpStatus.INTERNAL_SERVER_ERROR);
	}
	
	@GetMapping("/main")
	public String selectGrpGet(@RequestParam("grno")int grno, Model model) {
		GroupVO gvo=gsv.selectGrp(grno);
		List<ScheduleVO> sList=ssv.selectListSch(grno);
		log.info(sList.toString());
		GroupDTO gdto=new GroupDTO(gvo, sList);
		model.addAttribute("gvo", gdto.getGvo());
		model.addAttribute("sList", gdto.getSList());
		return "/group/main";
	}
}
