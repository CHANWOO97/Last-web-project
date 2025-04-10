package com.green.Lupang.mapper;

import org.apache.ibatis.annotations.Mapper;

import com.green.Lupang.dto.saleQuestion;

@Mapper
public interface BoardMapper {

	saleQuestion select(String u_id);
}
