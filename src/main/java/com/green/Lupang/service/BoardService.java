package com.green.Lupang.service;

import com.green.Lupang.dto.SaleQuestion;

public interface BoardService {

	SaleQuestion select(String u_id);

	Integer insertSaleQuestion(SaleQuestion saleques);

}
