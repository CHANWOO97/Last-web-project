package com.green.Lupang.service;

import java.util.List;

import com.green.Lupang.dto.Sale;
import com.green.Lupang.dto.SaleItems;

public interface SaleService {
	void saleSave(Sale sale);
	void saleItemSave(SaleItems si);
	Sale findById(String s_id);
	void updateStatus(Sale sale);
	List<SaleItems> getSaleItems(String s_id);
	List<Sale> findAllByUserId(String id, int offset, int pageSize);
	int saleCountByOrder(String id);
	List<Sale> getAdminOrderList();
}
