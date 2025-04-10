package com.green.Lupang.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.green.Lupang.dto.Sale;
import com.green.Lupang.dto.SaleItems;
import com.green.Lupang.mapper.SaleMapper;

@Service
public class SaleServiceImpl implements SaleService{
	@Autowired
	private SaleMapper sm;

	@Override
	public void saleSave(Sale sale) {
		sm.saleSave(sale);
	}

	@Override
	public void saleItemSave(SaleItems si) {
		sm.saleItemSave(si);
		
	}

	@Override
	public Sale findById(String s_id) {
		return sm.findById(s_id);
	}

	@Override
	public void updateStatus(Sale sale) {
		sm.updateStatus(sale);	
	}

	@Override
	public List<SaleItems> getSaleItems(String s_id) {
		return sm.getSaleItems(s_id);
	}

	@Override
	public List<Sale> findAllByUserId(String id, int offset, int pageSize) {
		Map<String, Object> map = new HashMap<>();
		map.put("u_id", id);
		map.put("offset", offset);
		map.put("pageSize", pageSize);
		return sm.findAllByUserId(map);
	}

	@Override
	public int saleCountByOrder(String id) {
		// TODO Auto-generated method stub
		return sm.saleCountByOrder(id);
	}

	@Override
	public List<Sale> getAdminOrderList() {
		// TODO Auto-generated method stub
		return sm.getAdminOrderList();
	}
}
