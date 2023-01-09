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
import com.ezen.finalpj.repository.UserDAO;
import com.ezen.finalpj.service.UserService;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@RequestMapping("/user/*")
@Controller
public class UserController {
	
	@Inject
	private UserService usv;
	
	
	@Inject
	private UserDAO udao;
	
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
			reAttr.addFlashAttribute("msg", true);
			return "/home";
		}else {
			reAttr.addFlashAttribute("msg", false);
			return "redirect:/home";
		}
		
	}
	
	//전체 회원 조회x=> 나의 멤버가 아닌 사람들을 조회한다. 어떻게??
	//grno를 기준으로 나누는건 안다. 여기서는 전체를 불러온다. 그럼 mapper에서 grno가 다른 놈들을 걸르자(실패)
	//grade가 A인 사람과 다른 grno를 가진 놈을 부른다. 
	//waiting을 가져와서 ㅕuserlist와 결합해야 한다.
	@GetMapping("/testlist")
	public String list(Model model,UserVO uvo, HttpServletRequest req) {
		//session에서 email 정보추출
		HttpSession ses=req.getSession();
		String email=uvo.getEmail();
		ses.setAttribute("email", email);
		UserVO user=usv.getMyOnlyuser(req);
		//email 정보를 들고, service 에게 요청 
		// mapper에게 email과 일치하는 isOk = 0와 (해결)
		//grno 요청
		List<UserVO> list=usv.getOnlyList(user);
		log.info("only user");
		model.addAttribute("list", list);
		return "/myPage/testlist";
	}
	
	
	
}
