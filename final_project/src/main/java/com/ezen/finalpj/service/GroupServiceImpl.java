package com.ezen.finalpj.service;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.ezen.finalpj.domain.GroupVO;
import com.ezen.finalpj.repository.GroupDAO;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service
public class GroupServiceImpl implements GroupService {
	@Inject
	private GroupDAO gdao;

	@Override
	public int insertGrp(GroupVO gvo) {
		log.info(gvo.toString());
		int isOk=gdao.insertGrp(gvo);
		log.info("소모임 등록 서비스"+(isOk>0?"성공":"실패"));
		return isOk;
	}

	@Override
	public GroupVO selectGrp(int grno) {
		log.info("소모임 메인에 값 호출");
		GroupVO gvo=gdao.selectGrp(grno);
		return gvo;
	}

}
