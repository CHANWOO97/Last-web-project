package com.green.Lupang.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.green.Lupang.dto.saleQuestion;
import com.green.Lupang.mapper.BoardMapper;

@Service
public class BoardServiceImpl implements BoardService{
	@Autowired
	private BoardMapper bm;

	@Override
	public saleQuestion select(String u_id) {
		return bm.select(u_id);
	}
}
