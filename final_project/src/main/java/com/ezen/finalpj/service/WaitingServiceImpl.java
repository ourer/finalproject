package com.ezen.finalpj.service;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.ezen.finalpj.domain.UserVO;
import com.ezen.finalpj.domain.WaitingVO;
import com.ezen.finalpj.repository.WaitingDAO;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service
public class WaitingServiceImpl implements WaitingService {
	@Inject
	private WaitingDAO wdao;
	
	@Override
	public int insertMemWaitPost(WaitingVO wvo) {
		return wdao.insertMemWaitPost(wvo);
	}

	@Override
	public int remove(String email) {
		log.info("waiting user remove");
		return wdao.deleteUser(email);
	}

	@Override
	public int accept(String email) {
		log.info("waiting user accept");
		return wdao.acceptUser(email);
	}

	@Override
	public int refuse(String email) {
		log.info("waiting user refuse");
		return wdao.refuseUser(email);
	}
	
	@Override
	public int appointment(String email) {
		log.info("operator appointment email");
		return wdao.appointment(email);
	}

	@Override
	public int cancellation(String email) {
		log.info("operator cancellation email");
		return wdao.cancellation(email);
	}

	@Override
	public int quit(WaitingVO wt) {
		log.info("quit a smallgroup email");
		return wdao.quit(wt);
	}


}
