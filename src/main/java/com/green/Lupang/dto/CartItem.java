package com.green.Lupang.dto;

import org.apache.ibatis.type.Alias;

import lombok.Data;

@Data
@Alias("cart_items")
public class CartItem {
    private String ci_id; // VARCHAR(255) NOT NULL COMMENT '복합키 형식 ID', PRIMARY KEY (ci_id)
    private String i_id; // VARCHAR(255) NOT NULL COMMENT '상품코드 (FK: items_table.i_id)',
    private String c_id; // VARCHAR(255) NOT NULL COMMENT '장바구니 ID (FK: cart_table.c_id)',
    private int quantity; // INT NOT NULL COMMENT '상품 수량',
}
