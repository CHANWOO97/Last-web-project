package com.green.Lupang.service;

import java.util.List;

import com.green.Lupang.dto.Items;
import com.green.Lupang.dto.Sale;
import com.green.Lupang.dto.SettleStatement;

public interface InvoiceService {

	List<SettleStatement> settleList(int offset, int rowPerPage);

	void insertSettleInvoice(SettleStatement settleStatement);

	SettleStatement getSettleInvoice(int sr_id);
}