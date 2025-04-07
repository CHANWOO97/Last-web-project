package com.green.Lupang.dto;

import java.util.Date;

import org.apache.ibatis.type.Alias;

import lombok.Data;

@Data
@Alias("seller")
public class Seller {
	private String sr_id; // VARCHAR(255) NOT NULL COMMENT '판매자 요청 ID',
    private String sr_state; // CHAR(1) DEFAULT 'n' COMMENT '승인 상태 (n/y)',
    private Date srq_at; // TIMESTAMP NULL COMMENT '요청 날짜',
    private Date srw_at; // TIMESTAMP NULL COMMENT '승인 날짜',
    private String i_id; // VARCHAR(255) NOT NULL COMMENT '상품코드 (FK: items.i_id)',

}
