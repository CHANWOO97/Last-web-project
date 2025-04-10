package com.green.Lupang.dto;

import org.apache.ibatis.type.Alias;

import lombok.Data;

@Data
@Alias("sale_items")
public class SaleItems {
    private String si_id; // VARCHAR(255) NOT NULL COMMENT '복합키 형식 ID', PRIMARY KEY (si_id)
    private String s_id; // VARCHAR(255) NOT NULL COMMENT '구매 ID (FK: sale_table.s_id)',
    private String i_id; // VARCHAR(255) NOT NULL COMMENT '상품코드 (FK: items.i_id)',
    private int quantity; // INT,
    
    // items DTO
    private String name; 
    private String photo;
    private int price;
}
