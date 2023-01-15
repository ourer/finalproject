package com.ezen.finalpj;

import java.text.DateFormat;
import java.util.Date;
import java.util.Locale;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.ezen.finalpj.domain.PagingVO;
import com.ezen.finalpj.domain.SgMainVO;
import com.ezen.finalpj.handler.PagingHandler;
import com.ezen.finalpj.service.GroupService;
import com.ezen.finalpj.service.SgmainService;

import lombok.extern.slf4j.Slf4j;
@Slf4j
@Controller
public class HomeController {
	
	@Inject
	private SgmainService ssv;
	
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(Locale locale, Model model,PagingVO pgvo) {
		logger.info("Welcome home! The client locale is {}.", locale);
//		log.info("pgvo : "+pgvo.toString());
//		
//		int totalCount=ssv.getPageCount(pgvo);
//		PagingHandler pgh=new PagingHandler(pgvo, totalCount);
//		model.addAttribute("pgh", pgh);
		
		Date date = new Date();
		DateFormat dateFormat = DateFormat.getDateTimeInstance(DateFormat.LONG, DateFormat.LONG, locale);
		
		String formattedDate = dateFormat.format(date);
		
		model.addAttribute("serverTime", formattedDate );
		
		return "home";
	}
	
	
}
