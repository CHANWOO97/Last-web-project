package com.green.Lupang.service;

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
}
