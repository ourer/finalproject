package com.ezen.finalpj.controller;

import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.ezen.finalpj.domain.PagingVO;
import com.ezen.finalpj.domain.UserVO;
import com.ezen.finalpj.domain.WaitingVO;
import com.ezen.finalpj.handler.PagingHandler;
import com.ezen.finalpj.service.UserService;
import com.ezen.finalpj.service.WaitingService;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@RequestMapping("/user/*")
@Controller
public class UserController {
	
	@Inject
	private UserService usv;
	
	
	@GetMapping("/login")
	public String loginGet() {
		return "/user/login";
	}
	@PostMapping("/login")
	public String loginPost(UserVO user,HttpServletRequest req,RedirectAttributes reAttr) {
		log.info("login id>> "+user.getEmail().toString());
		log.info("login pw>> "+user.getPw().toString());
		
		UserVO loginUser=usv.login(user);
		log.info("loginUser>>"+loginUser.toString());
		if(loginUser !=null) {
			HttpSession ses=req.getSession();
			ses.setAttribute("ses", loginUser);
			log.info("로그인 성공");
			return "/home";
		}else {
			reAttr.addFlashAttribute("msg", false);
			return "redirect:/home";
		}
		
	}
	
	//전체 회원 조회x=> 나의 멤버가 아닌 사람들을 조회한다. 어떻게??
	//grno를 기준으로 나누는건 안다. 여기서는 전체를 불러온다. 그럼 mapper에서 grno가 다른 놈들을 걸르자(실패)
	//grade가 A인 사람과 다른 grno를 가진 놈을 부른다. 
	@GetMapping("/userlist")
	public String list(Model model,UserVO user,
			@RequestParam("pageNo1")int pageNo1,@RequestParam("pageNo2")int pageNo2) {
		
		PagingVO pgvo1=new PagingVO(pageNo1);
		PagingVO pgvo2=new PagingVO(pageNo2);
		
		log.info("pgvo1: "+pgvo1.toString());
		log.info("pgvo2: "+pgvo2.toString());
		
		List<UserVO> list1=usv.getWaiting(pgvo1); 
		List<UserVO> list2=usv.getMemberList(pgvo2); 
		
		log.info("list1 : "+list1.get(0).toString());
		log.info("list2 : "+list2.get(0).toString());
		
		model.addAttribute("list1",list1);
		model.addAttribute("list2",list2);
		
		int totalCount1=usv.getPageCount(pgvo1);
		int totalCount2=usv.getPageCount(pgvo2);
		
		log.info("total1: "+totalCount1);
		log.info("total2: "+totalCount2);
		
		PagingHandler pgh1=new PagingHandler(pgvo1, totalCount1);
		PagingHandler pgh2=new PagingHandler(pgvo2, totalCount2);
		
		model.addAttribute("pgh1", pgh1);
		model.addAttribute("pgh2", pgh2);
		
		return "/myPage/userlist";
	}
	
	
	
}
