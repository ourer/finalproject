package com.ezen.finalpj.controller;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.ezen.finalpj.service.ManagerService;

@RequestMapping("/manager/*")
@Controller
public class ManagerController {
	private static final Logger log=LoggerFactory.getLogger(ManagerController.class);
	
	@Inject
	private ManagerService msv;
	
	//소모임 신청 인원 가입 승인,거절
	//그럼 일단 신청 인원에 대한 리스트가 있어야 하고
	//그리고...
	//멤버 강퇴 기능(delete)
	
	//소모임 자체의 삭제 
	
	//멤버 중 운영진 임명 및 해제 
	
	
}
