package com.green.Lupang.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

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
	public List<SaleQuestion> getQuestionList(int startRow, int rowPerPage) {
		Map<String, Object> map = new HashMap<>();
		map.put("startRow", startRow);
		map.put("rowPerPage", rowPerPage);
		return bm.getQuestionList(map);
	}

	@Override
	public int countAllQuestion() {
		return bm.countAllQuestion();
	}

	@Override
	public List<SaleQuestion> getQuestion(int q_id) {
		return bm.getQuestion(q_id);
	}

	@Override
	public List<SaleQuestion> getQuestionListPage(int startRow, int rowPerPage) {
		Map<String, Object> map = new HashMap<>();
		map.put("startRow", startRow);
		map.put("rowPerPage", rowPerPage);
		return bm.getQuestionListPage(map);
	}

	@Override
	public int myQuestionCount(String u_id) {
		return bm.myQuestionCount(u_id);
	}

	@Override
	public List<SaleQuestion> getMyQuestionByU_id(String u_id, int startRow, int rowPerPage) {
		Map<String, Object> map = new HashMap<>();
		map.put("u_id",u_id);
		map.put("startRow",startRow);
		map.put("rowPerPage",rowPerPage);
		return bm.getMyQuestionByU_id(map);
	}

	@Override
	public int updateAnswerState(Integer q_id) {
		return bm.updateAnswerState(q_id);
	}
}
