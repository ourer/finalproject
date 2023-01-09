package com.ezen.finalpj.controller;

import java.util.List;
import java.util.Set;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.http.MediaType;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.ezen.finalpj.domain.ProfileVO;
import com.ezen.finalpj.domain.UserDTO;
import com.ezen.finalpj.domain.UserVO;
import com.ezen.finalpj.handler.ProfileHandler;
import com.ezen.finalpj.service.UserService;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@RequestMapping("/user/*")
@Controller
public class UserController {
	
	@Inject
	private UserService usv;
	
	@Inject
	private ProfileHandler ph;
	
	
	@GetMapping("/")
	public ModelAndView home(ModelAndView mv) {
		mv.setViewName("/home");
		return mv;
	}
	
	@GetMapping("/register")
		public String register(){
		return "/user/register";
	}
	
//	@PostMapping("/register")
//		public ModelAndView register(UserVO uvo, ModelAndView mv){
//		log.info(">>> User Register check 1");
//		boolean isUP = usv.register(uvo);
//		if(isUP) {
//			mv.addObject("msg", "1");
//			mv.setViewName("/");
//		}else {
//			mv.addObject("msg", "0");
//			mv.setViewName("/user/register");
//		}
//		return mv;
//	}
	
	 @PostMapping("/register") 
	 	public String register(UserVO uvo, RedirectAttributes reAttr, @RequestParam(name="files", required =false)MultipartFile[] files){
		 
		 log.info(">>> User Register check 1");
		 log.info(">>>User : "+uvo.toString());
		 log.info(">>>files: "+files.toString()); 
		 List<ProfileVO> pList = null;
//		 int isOK = usv.register(uvo);
		 int isOK = 0;
		 if(files[0].getSize() > 0) { 
		 pList = ph.uploadFiles(files);
		 for(ProfileVO pvo : pList) {
			 pvo.setEmail(uvo.getEmail());
		 }
		 log.info(pList.toString());
		 UserDTO udto = new UserDTO(uvo, pList);
		 isOK = usv.register(udto); 
		 }else {
		 log.info("file null"); 
		 isOK = usv.register(uvo); 
		 }
			 
		 reAttr.addFlashAttribute("msg", isOK > 0 ? "0" : "1");
		 log.info("User Register : "+ (isOK > 0?"OK":"FAIL"));
		 return "redirect:/";
	  }
	 
	 @GetMapping("/login")
	 public ModelAndView loginGet(ModelAndView mv) {
		 mv.setViewName("/user/login");
		 return mv;
	 }
	 
	 @PostMapping("/login")
	 public ModelAndView loginPost(ModelAndView mv, String email, String pw, HttpServletRequest req) {
		 log.info(">>>email : "+email+" pw : "+ pw);
		 UserVO isUser = usv.isUser(email, pw);
		 
		 if(isUser != null) {
			 HttpSession ses = req.getSession();
			 ses.setAttribute("ses", isUser);
			 
			 mv.setViewName("/home");
			 mv.addObject("msglogin", "1");
		 }else {
			 mv.setViewName("user/login");
			 mv.addObject("msglogin","0");
		 }
		 
		 return mv;
	 }
	 
	 @GetMapping("/logout")
	 public ModelAndView logoutGet(ModelAndView mv, HttpServletRequest req) {
		 req.getSession().removeAttribute("ses");
		 req.getSession().invalidate();
		 mv.addObject("msg", "0");
		 mv.setViewName("redirect:/");
		 return mv;
	 }

}