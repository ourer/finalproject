package com.ezen.finalpj.controller;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;

import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;

import com.ezen.finalpj.domain.UserVO;
import com.ezen.finalpj.domain.WaitingVO;
import com.ezen.finalpj.service.WaitingService;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@RequestMapping("/wait/*")
@Controller
public class WaitingController {
	
	@Inject
	private WaitingService wsv;
	
	@PutMapping(value = "/accept/{email}",produces= {MediaType.TEXT_PLAIN_VALUE})
	public ResponseEntity<String> accept(@PathVariable("email")String email) {
		log.info("waiting user accept : "+email);
		int isOk=wsv.accept(email);
		return isOk>0? new ResponseEntity<String>("1",HttpStatus.OK): new ResponseEntity<String>(HttpStatus.INTERNAL_SERVER_ERROR);
	}
	
	@DeleteMapping(value = "/refuse/{email}",produces= {MediaType.TEXT_PLAIN_VALUE})
	public ResponseEntity<String> refuse(@PathVariable("email")String email) {
		log.info("waiting user refuse : "+email);
		int isOk=wsv.refuse(email);
		return isOk>0? new ResponseEntity<String>("1",HttpStatus.OK): new ResponseEntity<String>(HttpStatus.INTERNAL_SERVER_ERROR);
	}
	
	@PutMapping(value = "/appointment/{email}",produces = {MediaType.TEXT_PLAIN_VALUE})
	public ResponseEntity<String> appointmentUser(@PathVariable("email")String email){
		log.info("user appointment : "+email);
		int isOk=wsv.appointment(email);
		return isOk>0? new ResponseEntity<String>("1",HttpStatus.OK): new ResponseEntity<String>(HttpStatus.INTERNAL_SERVER_ERROR);
	}
	
	@PutMapping(value = "/cancellation/{email}",produces = {MediaType.TEXT_PLAIN_VALUE})
	public ResponseEntity<String> cancellationUser(@PathVariable("email")String email){
		log.info("user appointment : "+email);
		int isOk=wsv.cancellation(email);
		return isOk>0? new ResponseEntity<String>("1",HttpStatus.OK): new ResponseEntity<String>(HttpStatus.INTERNAL_SERVER_ERROR);
	}
	
	@DeleteMapping(value = "/quit/", produces = {MediaType.TEXT_PLAIN_VALUE})
	public ResponseEntity<String> quitGroup(@RequestBody WaitingVO wvo){
		log.info("quit a smallgroup : "+wvo.toString());
		int isOk = wsv.quit(wvo);
		return isOk>0 ? new ResponseEntity<String>("1", HttpStatus.OK) : new ResponseEntity<String>(HttpStatus.INTERNAL_SERVER_ERROR);
	}


}
