package com.ezen.finalpj.controller;

import java.util.List;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.ezen.finalpj.domain.UserVO;
import com.ezen.finalpj.service.ManagerService;
import com.ezen.finalpj.service.UserService;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@RequestMapping("/manager/*")
@Controller
public class ManagerController {
	
	@Inject
	private ManagerService msv;
	
	@Inject
	private UserService usv;
	
	//소모임 신청 인원 가입 승인,거절
	//그럼 일단 신청 인원에 대한 리스트가 있어야 하고=>리스트 조회
	
	
	//멤버 강퇴 기능(delete)
	
	//소모임 자체의 삭제 
	
	//멤버 중 운영진 임명 및 해제 
	
	
}
