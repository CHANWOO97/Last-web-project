package com.green.Lupang.mapper;

import org.apache.ibatis.annotations.Mapper;

import com.green.Lupang.dto.Sale;
import com.green.Lupang.dto.SaleItems;

@Mapper
public interface SaleMapper {
	void saleSave(Sale sale);
	void saleItemSave(SaleItems si);
}
