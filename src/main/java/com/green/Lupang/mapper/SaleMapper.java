package com.green.Lupang.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.green.Lupang.dto.Items;
import com.green.Lupang.dto.Sale;
import com.green.Lupang.dto.SaleItems;
import com.green.Lupang.dto.TopSaleItemDTO;

@Mapper
public interface SaleMapper {
	void saleSave(Sale sale);
	void saleItemSave(SaleItems si);
	Sale findById(String s_id);
	int updateStatus(Sale sale);
	List<SaleItems> getSaleItems(String s_id);
	List<Sale> findAllByUserId(Map<String, Object> map);
	int saleCountByOrder(String id);
	int saleCountByOrderAll();
	List<Sale> getAdminOrderList(Map<String, Object> map);
	List<Items> getbuyItems(String u_id);
	List<TopSaleItemDTO> getTopSellingItems();
}
