package com.ezen.finalpj.controller;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.ezen.finalpj.domain.ScheduleVO;
import com.ezen.finalpj.service.ScheduleService;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@RequestMapping("/schedule/*")
@Controller
public class ScheduleController {
	@Inject
	private ScheduleService ssv;
	
	@GetMapping("/register")
	public String insertSchGet(@RequestParam("grno")int grno, Model model) {
		model.addAttribute("grno", grno);
		return "/schedule/register";
	}
	
	@PostMapping("/register")
	public String insertSchPost(ScheduleVO svo, RedirectAttributes reAttr) {
		log.info(svo.toString());		
		 if(svo.getCost()==null||svo.getMax_member()== 2||svo.getMeetdate()==null||
		     svo.getSpot()==null||svo.getTitle()==null) {
			 reAttr.addFlashAttribute("schMsg", "0");
			 reAttr.addAttribute("grno", svo.getGrno());
			 return "redirect:/schedule/register";
		 }else {
			 int isOk=ssv.insertSch(svo);
			 log.info("스케줄 등록"+(isOk>0?"성공":"실패"));
			 reAttr.addAttribute("grno", svo.getGrno());
			 return "redirect:/group/main";
			 
		 }
		 
	}
	
	@GetMapping("/delete")
	public String deleteSchGet(@RequestParam("sno")int sno, RedirectAttributes reAttr) {
		log.info(sno+"");
		int grno=ssv.selectGrnoSch(sno);
		log.info(grno+"");
		int isOk=ssv.deleteSch(sno);
		log.info("스케줄 삭제"+(isOk>0?"성공":"실패"));
		reAttr.addAttribute("grno", grno);
		return "redirect:/group/main";
	}
	

}
