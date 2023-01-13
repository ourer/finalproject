package com.ezen.finalpj.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.ezen.finalpj.domain.SgMainVO;
import com.ezen.finalpj.repository.SgmainDAO;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service
public class SgmainServiceImpl implements SgmainService {
	@Inject
	private SgmainDAO sdao;

	@Override
	public List<SgMainVO> getSgMainImg() {
		log.info(">>> sgmain 이미지 가져오기");
		return sdao.getSgMainImg();
	}


	


}
