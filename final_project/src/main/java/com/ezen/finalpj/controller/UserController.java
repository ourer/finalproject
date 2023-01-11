package com.ezen.finalpj.controller;

import java.util.List;
import java.util.Set;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.http.MediaType;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.ezen.finalpj.domain.CategoryVO;
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
			 log.info(isUser.toString());
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
	 
	 @GetMapping("/mypage")
	public String userMypageGet() {
		return "/user/mypage";
	}
		
	@GetMapping("/like")
	public String userLikeGet() {
		return "/user/like";
	}
		
	@GetMapping("/myinfo")
	public String userMyinfoGet(Model model) {
		List<CategoryVO> ctList = usv.getCtList();
		model.addAttribute("ctList", ctList);
		return "/user/myinfo";
	}
	
	@GetMapping("/modify")
	public String userModifyMyinfoGet() {
		return "/user/modify";
	}
	
	@PostMapping("/modify")
	public String modifyMyinfoPost(UserVO uvo, RedirectAttributes reAttr, HttpServletRequest req) {
		log.info(uvo.toString());
		int isOk = usv.modifyMyinfo(uvo);
		reAttr.addFlashAttribute("msg", isOk>0?"1":"0");
		log.info("개인정보수정 >>> "+(isOk>0?"수정성공":"수정실패"));
		if(isOk>0) {
			req.getSession().setAttribute("ses", uvo);
		}
		return "redirect:/user/mypage";
	}
	
	@GetMapping("/delete")
	public String deleteUserGet(RedirectAttributes reAttr, @RequestParam("email")String email) {
		
		return "redirect:/user/mypage";
	}
		
	@GetMapping("/management")
	public String userManagementGet() {
		return "/user/management";
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