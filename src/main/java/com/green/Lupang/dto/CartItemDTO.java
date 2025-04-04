package com.green.Lupang.dto;

import lombok.AllArgsConstructor;
import lombok.Data;

@Data
@AllArgsConstructor
public class CartItemDTO {
	private String i_id;
	private String name; 	// 상품명 (items 테이블에서 가져올)
	private String photo;	// 상품 사진
	private int price;		// 상품 가격
	private int quantity; 	// 수량 (cart_items 테이블)
}
