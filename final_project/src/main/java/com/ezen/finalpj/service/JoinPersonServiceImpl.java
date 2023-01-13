package com.ezen.finalpj.service;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.ezen.finalpj.domain.JoinPersonVO;
import com.ezen.finalpj.repository.JoinPersonDAO;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service
public class JoinPersonServiceImpl implements JoinPersonService {
	@Inject
	private JoinPersonDAO jpdao;

	@Override
	public int insertJpPost(JoinPersonVO jvo) {
		return jpdao.insertJp(jvo);
	}
}
