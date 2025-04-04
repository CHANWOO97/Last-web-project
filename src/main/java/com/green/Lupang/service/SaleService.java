package com.green.Lupang.service;

import com.green.Lupang.dto.Sale;
import com.green.Lupang.dto.SaleItems;

public interface SaleService {
	void saleSave(Sale sale);
	void saleItemSave(SaleItems si);
}
