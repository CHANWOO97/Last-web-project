package com.green.Lupang.service;

import java.util.List;

import com.green.Lupang.dto.SettleStatement;

public interface InvoiceService {

	List<SettleStatement> settleList(int offset, int rowPerPage);
	
}
