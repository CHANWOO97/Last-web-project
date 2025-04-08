package com.green.Lupang.dto;


import java.util.Date;

import org.apache.ibatis.type.Alias;

import lombok.Data;

@Data
@Alias("sale")
public class Sale {
    private String s_id; 	// VARCHAR(255) NOT NULL COMMENT '구매 ID', PRIMARY KEY (s_id)
    private Date s_date; 	// TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '구매일',
    private String s_status; //CHAR(1) DEFAULT 'n' COMMENT '구매 상태 (n: 미결제)',
    private String c_id; 	// VARCHAR(255) NOT NULL COMMENT '장바구니 ID (FK: cart.c_id)',
    
    // 주문 시 배송 정보 
    private String receiver;
    private String tel;
    private String address;
    // total가격
    private int total;
}
