package com.green.Lupang.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.green.Lupang.dto.SettleStatement;

@Mapper
public interface InvoiceMapper {
	List<SettleStatement> settleList(Map<String, Object> map);
}
