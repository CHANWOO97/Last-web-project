package com.green.Lupang.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.green.Lupang.dto.SaleQuestion;

@Mapper
public interface BoardMapper {

	SaleQuestion select(String u_id);

	Integer insertSaleQuestion(SaleQuestion saleques);

	List<SaleQuestion> getQuestionList();
}
