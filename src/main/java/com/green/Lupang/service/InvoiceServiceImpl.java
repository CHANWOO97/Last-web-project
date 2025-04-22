package com.green.Lupang.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.green.Lupang.dto.Items;
import com.green.Lupang.dto.SettleStatement;
import com.green.Lupang.mapper.InvoiceMapper;

@Service
public class InvoiceServiceImpl implements InvoiceService{
	@Autowired
	private InvoiceMapper ivm;
	
	@Override
	public List<SettleStatement> settleList(int offset, int rowPerPage) {
		Map<String, Object> map = new HashMap<>();
		map.put("offset", offset);
		map.put("rowPerPage", rowPerPage);
		return ivm.settleList(map);
	}
	
	@Override
	public List<SettleStatement> getMonthPrice(String u_id) {
		return ivm.getMonthPrice(u_id);
	}

	@Override
	public List<SettleStatement> getMonthPriceFiltered(String u_id, String targetMonth) {
		Map<String, Object> map = new HashMap<>();
		map.put("u_id", u_id);
		map.put("targetMonth", targetMonth);
		return ivm.getMonthPriceFiltered(map);
	}		
}
