package com.green.Lupang.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.green.Lupang.dto.SaleQuestion;

@Mapper
public interface BoardMapper {

	SaleQuestion select(String u_id);

	Integer insertSaleQuestion(SaleQuestion saleques);

	List<SaleQuestion> getQuestionList(Map<String, Object> map);

	int countAllQuestion();

	List<SaleQuestion> getQuestion(int q_id);

	List<SaleQuestion> getQuestionListPage(Map<String, Object> map);

	int myQuestionCount(String u_id);

	List<SaleQuestion> getMyQuestionByU_id(Map<String, Object> map);

	int updateAnswer(SaleQuestion sqAnswer);

}
