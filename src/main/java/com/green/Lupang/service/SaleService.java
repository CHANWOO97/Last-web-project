package com.green.Lupang.service;

import java.util.List;

import com.green.Lupang.dto.Items;
import com.green.Lupang.dto.Sale;
import com.green.Lupang.dto.SaleItems;
import com.green.Lupang.dto.TopSaleItemDTO;

public interface SaleService {
	void saleSave(Sale sale);
	void saleItemSave(SaleItems si);
	Sale findById(String s_id);
	int updateStatus(Sale sale);
	List<SaleItems> getSaleItems(String s_id);
	List<Sale> findAllByUserId(String id, int offset, int pageSize);
	int saleCountByOrder(String id);
	int saleCountByOrderAll();
	List<Sale> getAdminOrderList(int offset, int pageSize);
	List<Items> getbuyItems(String u_id);
	List<TopSaleItemDTO> getTopSellingItems();
	List<Integer> findItemIdsBySaleId(String s_id);	
}
