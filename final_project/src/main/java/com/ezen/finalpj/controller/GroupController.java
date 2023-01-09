package com.ezen.finalpj.controller;

import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

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
import com.ezen.finalpj.domain.ManagerDTO;
import com.ezen.finalpj.domain.ScheduleVO;
import com.ezen.finalpj.domain.UserVO;
import com.ezen.finalpj.service.GroupService;
import com.ezen.finalpj.service.JoinPersonService;
import com.ezen.finalpj.service.ScheduleService;
import com.ezen.finalpj.service.UserService;
import com.ezen.finalpj.service.WaitingService;

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
	@Inject
	private WaitingService wsv;
	@Inject
	private UserService usv;
	
	@GetMapping("/register")
	public String insertGrpGet() {
		return "/group/register";
	}
	
	@PostMapping(value = "/register", consumes = "application/json", produces = {MediaType.TEXT_PLAIN_VALUE})
	public ResponseEntity<String> insertGrpPost(@RequestBody GroupVO gvo, HttpServletRequest req) {
		log.info(gvo.toString());
		int isOk=gsv.insertGrp(gvo);
		//user한테 방장 됐으니까 grno 넣어주기
		//register.jsp에서 hidden으로 ses.email 받아오기
		//grno가져오기 : gvo의 이메일로 smallgroup에서 같은 이메일 있는 grno 가져오기
		int grno=gsv.selectGrnoGrp(gvo.getEmail());
		//DTO로 이메일, grno 넣어주기
		isOk*=usv.updateCapUser(new ManagerDTO(gvo.getEmail(), grno));
		log.info("소모임 생성"+(isOk>0?"성공":"실패"));
		return isOk>0? new ResponseEntity<String>("1", HttpStatus.OK):new ResponseEntity<String>(HttpStatus.INTERNAL_SERVER_ERROR);
	}
	
	@GetMapping("/main")
	public String selectGrpGet(@RequestParam("grno")int grno, Model model) {
		GroupVO gvo=gsv.selectGrp(grno);
		List<ScheduleVO> sList=ssv.selectListSch(grno);
		GroupDTO gdto=new GroupDTO(gvo, sList);
		model.addAttribute("gvo", gdto.getGvo());
		model.addAttribute("sList", gdto.getSList());
		return "/group/main";
	}
	
	@GetMapping("/memberList")
	public String selectMemListGrpGet(@RequestParam("grno")int grno, Model model) {
		//방장 가져오기
		UserVO capUvo=usv.selectCapGet(grno);
		log.info(capUvo.toString());
		model.addAttribute("capUvo", capUvo);
		List<UserVO> uList=usv.selectMemListUserGet(grno);
		model.addAttribute("uList", uList);
		return "/group/memberList";
	}
}
