package com.green.Lupang.dto;

import org.apache.ibatis.type.Alias;

import lombok.Data;

@Data
public class TopSaleItemDTO {
	// 많이 구매한 상품 이름과 얼마나 구매했을까잉 개수!
	private String name;
	private int count;
}
