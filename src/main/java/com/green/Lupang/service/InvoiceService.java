package com.green.Lupang.service;

import java.util.List;

import com.green.Lupang.dto.Items;
import com.green.Lupang.dto.SettleStatement;

public interface InvoiceService {

	List<SettleStatement> settleList(int offset, int rowPerPage);

	List<SettleStatement> getMonthPrice(String u_id);

	List<SettleStatement> getMonthPriceFiltered(String u_id, String targetMonth);
	
}
