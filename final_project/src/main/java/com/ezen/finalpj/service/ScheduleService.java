package com.ezen.finalpj.service;

import java.util.List;

import com.ezen.finalpj.domain.ScheduleVO;

public interface ScheduleService {

	List<ScheduleVO> selectListSch(int grno);

	int insertSch(ScheduleVO svo);

	int selectGrnoSch(int sno);

	int deleteSch(int sno);


}
