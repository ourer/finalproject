package com.ezen.finalpj.controller;

import java.util.ArrayList;
import java.util.List;
import java.util.Set;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.http.MediaType;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.ezen.finalpj.domain.PagingVO;
import com.ezen.finalpj.domain.ProfileVO;
import com.ezen.finalpj.domain.UserDTO;
import com.ezen.finalpj.domain.UserVO;
import com.ezen.finalpj.handler.ProfileHandler;
import com.ezen.finalpj.service.ProfileService;
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
	
	@Inject
	private ProfileService psv;
	
	
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
			 
			 //model로 넘겨주게 되면 해당 페이지에서만 프로필이 드러나게 된다
			 //그러므로 model에 넘겨주지 말고 ses로 넘겨줘서 해당 이메일에 따라 그 프로필을 볼 수 있게 하자!
			 ProfileVO pvo=psv.selectPersonalProfile(email);
			 ses.setAttribute("pvo", pvo);
			 
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
		public String userMyinfoGet() {
			return "/user/myinfo";
		}
		
		@GetMapping(value="/management/{email}")
		public String list(Model model,HttpServletRequest req,@PathVariable("email")String email) {
//			우리가 성공한 것.
//			유저 목록 가져오기.
//			-> 유저 한명의 정보를 가지고
//			해당 유저의 이메일과 같은 프로필의 정보를 DB에서 불러온다.
//			이 과정을 반복하여 유저 목록과 같은 길이의 프로필 리스트를 구성한다.
//			유저 리스트와 프로필 리스트를 model로 넘긴다.
//			넘긴 거로 jsp에서 표현한다.
			
			//email 가져오기는 rest 방식으로
			
			HttpSession ses=req.getSession();
			ses.setAttribute("email", email);
			
			UserVO user=usv.getMyOnlyuser(req);
			log.info("uvo test : "+user.getEmail());
			
//			ArrayList<ProfileVO> profilepersonal=new ArrayList<ProfileVO>();
//			ProfileVO personalvo=psv.selectPersonalProfile(user.getEmail());
//			profilepersonal.add(personalvo);
//			System.out.println(profilepersonal);
//			model.addAttribute("profilepersonal",profilepersonal);
			//for문 돌려서 profile 리스트 생성
			//session에서 email 정보추출
			//email 정보를 들고, service 에게 요청 
			// mapper에게 email과 일치하는 isOk = 0와 (해결)
			//grno 요청
			
			
			//profile service 생성
			//profile serviceImpl 생성
			//profile mapper -> select * from file where email=#{email}
			//그렇게 가져온 프로필을 profileList1에 add 하기
			//이메일과 같은 프로필 정보 불러오기
			//불러온 정보를 프로필 리스트에 넣기
			
			//건드리지 말기
			List<UserVO> list1=usv.getOnlyList1(user);
			List<UserVO> list2=usv.getOnlyList2(user);
			log.info("only user");
			
			//profileVO list 초기화
			ArrayList<ProfileVO> profileList1=new ArrayList<ProfileVO>();
			ArrayList<ProfileVO> profileList2=new ArrayList<ProfileVO>();
			
			for(UserVO uvo: list1) {
				ProfileVO pvo = psv.selectProfile(uvo.getEmail());
				profileList1.add(pvo);
			}
			log.info("프로필1 리스트 : "+profileList1.toString());
			
			for(UserVO uvo: list2) {
				ProfileVO pvo = psv.selectProfile(uvo.getEmail());
				profileList2.add(pvo);
			}
			log.info("프로필2 리스트 : "+profileList2.toString());
			model.addAttribute("profileList1",profileList1);
			model.addAttribute("profileList2",profileList2);
			
			model.addAttribute("list1", list1);
			model.addAttribute("list2", list2);
			return "/user/management";
		}
}