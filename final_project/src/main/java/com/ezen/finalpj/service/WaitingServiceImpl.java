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

	/*
	 * @Override public int insertManagerWaitPost(UserVO uvo) { return
	 * wdao.insertManagerWaitPost(uvo); }
	 */

	@Override
	public int insertMemWaitPost(WaitingVO wvo) {
		return wdao.insertMemWaitPost(wvo);
	}
}
