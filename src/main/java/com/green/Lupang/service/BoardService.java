package com.green.Lupang.service;

import java.util.List;

import com.green.Lupang.dto.SaleQuestion;

public interface BoardService {

	SaleQuestion select(String u_id);

	Integer insertSaleQuestion(SaleQuestion saleques);

	List<SaleQuestion> getQuestionList(int startRow, int rowPerPage);

	int countAllQuestion();

	List<SaleQuestion> getQuestion(int q_id);

	List<SaleQuestion> getQuestionListPage(int startRow, int rowPerPage);

	int myQuestionCount(String u_id);

	List<SaleQuestion> getMyQuestionByU_id(String u_id, int startRow, int rowPerPage);

	int updateAnswerState(Integer q_id);
}
