package com.green.Lupang.dto;

import java.sql.Date;

import lombok.Data;

@Data
public class Cart {
	private String c_id; // VARCHAR(255) NOT NULL COMMENT '장바구니 ID',
    private Date c_date; // TIMESTAMP NULL DEFAULT CURRENT_TIMESTAMP,
    private String u_id; // VARCHAR(255) NOT NULL COMMENT '사용자 ID (FK: user_table.u_id)',
}
