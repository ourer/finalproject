package com.ezen.finalpj;


import java.util.Collections;
import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.ezen.finalpj.domain.CategoryVO;
import com.ezen.finalpj.domain.UserVO;
import com.ezen.finalpj.service.CategoryService;
import com.ezen.finalpj.service.UserService;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping("/")
public class HomeController {
	@Inject
	private CategoryService csv;
	@Inject
	private UserService usv;
	
	
	//home.jsp 오늘의 추천 소모임 리스트 랜덤 추천
	@GetMapping("/")
	public String categoryRandom(Model model) {
		// 리스트 출력(전체)
		List<CategoryVO> RandomList = csv.getCategoryOneRandom();
		log.info(RandomList.toString());
		
		// 랜덤으로 섞기
		Collections.shuffle(RandomList);
		log.info("random : "+RandomList.toString());
		
		model.addAttribute("RandomList", RandomList);		
		return "home";
	}
	
	
}
