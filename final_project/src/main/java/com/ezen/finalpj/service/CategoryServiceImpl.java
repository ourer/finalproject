package com.ezen.finalpj.service;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.ezen.finalpj.domain.CategoryVO;
import com.ezen.finalpj.repository.CategoryDAO;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service
public class CategoryServiceImpl implements CategoryService {
	@Inject
	private CategoryDAO cdao;
	


}
