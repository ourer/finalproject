package com.ezen.finalpj.controller;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.ezen.finalpj.domain.CategoryVO;
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
	public String categorymain(Model model) {
		List<GroupVO> gList = gsv.getAllList();
		List<SgMainVO> sList = ssv.getSgMainImg();
		log.info(gList.toString());
		log.info(sList.toString());
		model.addAttribute("gList", gList);
		model.addAttribute("sList", sList);
		return "/category/categorymain";
	}
	
	//소모임 카테고리별 불러오기
	@GetMapping("/categoryDetail")
	public String categoryDetail(Model model, @RequestParam("code")String code) {
		List<GroupVO> gList = gsv.CategoryOne(code);
		List<SgMainVO> sList = ssv.getSgMainImg();
		List<CategoryVO> cList = csv.getCategoryList(code);
		log.info(cList.toString());
		model.addAttribute("gList", gList);
		model.addAttribute("sList", sList);
		model.addAttribute("cList", cList);
		return "/category/categoryDetail";
	}
	
	// 소모임 세부 카테고리별 리스트 출력
	@GetMapping("/categoryName")
	public String categoryName(Model model, @RequestParam("name")String name) {
		String code=csv.getCategoryCode(name);
		List<CategoryVO> cList = csv.getCategoryList(code);
		List<GroupVO> gList = gsv.getCategoryOne(name);
		List<SgMainVO> sList = ssv.getSgMainImg();
		log.info("세부 카테고리별 C리스트 출력"+cList.toString());
		log.info("세부 카테고리별 G리스트 출력"+gList.toString());
		
		model.addAttribute("cList", cList);
		model.addAttribute("sList", sList);
		model.addAttribute("gList", gList);
		return "/category/categoryNameList";
	}
	


}
