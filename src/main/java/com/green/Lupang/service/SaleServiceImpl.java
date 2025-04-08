package com.green.Lupang.service;

import java.util.List;

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
	public List<Sale> findAllByUserId(String id) {
		return sm.findAllByUserId(id);
	}
}
