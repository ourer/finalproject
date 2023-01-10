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

import com.ezen.finalpj.domain.GboardVO;
import com.ezen.finalpj.domain.UserVO;
import com.ezen.finalpj.service.GboardService;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@RequestMapping("/gboard/*")
@Controller
public class GboardController {
	@Inject
	private GboardService gbsv;
	
	@GetMapping("/register")
	public String insertGbrdGet(@RequestParam("grno")int grno, Model model, HttpServletRequest req) {
		HttpSession ses=req.getSession();
		UserVO uvo=(UserVO)ses.getAttribute("ses");
		model.addAttribute("grno", grno);
		model.addAttribute("uvo", uvo);
		return "/gboard/register";
	}
	
	@PostMapping("/register")
	public String insertGbrdPost(GboardVO gbvo, RedirectAttributes reAttr) {
		int grno=gbvo.getGrno();
		int isOk=gbsv.insertGbrd(gbvo);
		log.info("그룹 게시글 등록 성공"+(isOk>0?"성공":"실패"));
		reAttr.addAttribute("grno", grno);
		return "redirect:/gboard/list";
	}
	
	@GetMapping("/list")
	public String selectListGbrdGet(@RequestParam("grno")int grno, Model model) {
		List<GboardVO> gbList=gbsv.selectListGbrd(grno);
		model.addAttribute("gbList", gbList);
		model.addAttribute("grno", grno);
		return "/gboard/list";
	}
	
	@GetMapping("/detail")
	public String selectDetailGbrdGet(@RequestParam("gbno")int gbno, Model model) {
		int isOk=gbsv.updateViewGbrd(gbno);
		GboardVO gbvo=gbsv.selectDetailGbrd(gbno);
		log.info("조회수"+(isOk>0?"성공":"실패"));
		model.addAttribute("gbvo", gbvo);
		return "/gboard/detail";
	}
	
	@GetMapping("/modify")
	public String updateGbrdGet(@RequestParam("gbno")int gbno, Model model) {
		GboardVO gbvo=gbsv.selectDetailGbrd(gbno);
		model.addAttribute("gbvo", gbvo);
		return "/gboard/modify";
	}
	
	@PostMapping("/modify")
	public String updateGbrdPost(GboardVO gbvo, RedirectAttributes reAttr) {
		int isOk=gbsv.updateGbrd(gbvo);
		log.info("게시글 수정"+(isOk>0?"성공":"실패"));
		reAttr.addAttribute("gbno", gbvo.getGbno());
		return "redirect:/gboard/detail";
	}
	
	@GetMapping("/delete")
	public String deleteGbrdGet(@RequestParam("gbno")int gbno, RedirectAttributes reAttr) {
		GboardVO gbvo=gbsv.selectDetailGbrd(gbno);
		int isOk=gbsv.deleteGbrd(gbno);
		reAttr.addAttribute("grno", gbvo.getGrno());
		return "redirect:/gboard/list";
	}
}
