package com.green.Lupang.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.green.Lupang.dto.Items;
import com.green.Lupang.dto.SettleStatement;

@Mapper
public interface InvoiceMapper {
	List<SettleStatement> settleList(Map<String, Object> map);

	Items itemMonthSale(String u_id);

	List<SettleStatement> getMonthPrice(String u_id);
	
}
