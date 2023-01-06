package com.ezen.finalpj.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.ezen.finalpj.domain.ScheduleVO;
import com.ezen.finalpj.repository.ScheduleDAO;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service
public class ScheduleServiceImpl implements ScheduleService {
	
	@Inject
	private ScheduleDAO sdao;

	@Override
	public List<ScheduleVO> selectListSch(int grno) {
		log.info("스케줄 리스트 호출");
		List<ScheduleVO> sList=sdao.selectListSch(grno);
		return sList;
	}

}
