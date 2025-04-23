package com.green.Lupang.dto;


import java.util.Date;

import org.apache.ibatis.type.Alias;

import lombok.Data;

@Data
@Alias("sale")
public class Sale {
    private String s_id; 	// VARCHAR(255) NOT NULL COMMENT '구매 ID', PRIMARY KEY (s_id)
    private String u_id;	// VARCHAR(255) COMMENT 유저 ID
    private Date s_date; 	// TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '구매일',
    private String s_status; //CHAR(1) DEFAULT 'n' COMMENT '구매 상태 (n: 미결제)',
    private String c_id; 	// VARCHAR(255) NOT NULL COMMENT '장바구니 ID (FK: cart.c_id)',
    // 주문 시 배송 정보 
    private String receiver;
    private String tel;
    private String address;
    // total가격
    private int total;
    // 상품관련
    private String photo;
    private String name;
    // user 이름
    private String customer_name; // 보내는 사람
    // 한번에 여러개 구매 시 카운트
    private int item_count; 
    // 판매자
    private int sr_id;
    // 월별 구매일, 월별 매출총합
    private String year_month;
    private int total_sum;
}
