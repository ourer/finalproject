package com.ezen.finalpj.controller;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.ezen.finalpj.domain.GroupVO;
import com.ezen.finalpj.domain.SgMainVO;
import com.ezen.finalpj.service.CategoryService;
import com.ezen.finalpj.service.GroupService;
import com.ezen.finalpj.service.SgmainService;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@RequestMapping("/category/*")
@Controller
public class CategoryController {
	@Inject
	private GroupService gsv;
	@Inject
	private SgmainService ssv;
	@Inject
	private CategoryService csv;
	
	// 소모임 전체리스트 불러오기
	@GetMapping("/categorymain")
	public String categorymain(Model model, SgMainVO svo) {
		List<GroupVO> gList = gsv.getAllList();
		int grno = svo.getGrno();
		List<SgMainVO> sList =  ssv.getSgmain(grno);
		model.addAttribute("gList", gList);
		model.addAttribute("sList", sList);
		return "/category/categorymain";
	}
	
	//소모임 카테고리별 불러오기
	@GetMapping("/categoryDetail")
	public String categoryDetail(Model model, @RequestParam("code")String code) {
		List<GroupVO> gList = gsv.CategoryOne(code);
		model.addAttribute("gList", gList);
		return "/category/categoryDetail";
	}



}
