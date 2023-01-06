package com.ezen.finalpj.controller;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.ezen.finalpj.service.ScheduleService;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@RequestMapping("/schedule/*")
@Controller
public class ScheduleController {
	@Inject
	private ScheduleService ssv;
	
	@GetMapping("/register")
	public String registerSch(@RequestParam("grno")int grno, Model model) {
		model.addAttribute("grno", grno);
		return "/schedule/register";
	}
	
	

}
