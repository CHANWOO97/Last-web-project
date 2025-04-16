package com.green.Lupang.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.green.Lupang.dto.SaleQuestion;
import com.green.Lupang.mapper.BoardMapper;

@Service
public class BoardServiceImpl implements BoardService{
	@Autowired
	private BoardMapper bm;

	@Override
	public SaleQuestion select(String u_id) {
		return bm.select(u_id);
	}

	@Override
	public Integer insertSaleQuestion(SaleQuestion saleques) {
		return bm.insertSaleQuestion(saleques);
	}

	@Override
	public List<SaleQuestion> getQuestionList() {
		return bm.getQuestionList();
	}
}
