package com.green.Lupang.dto;

import java.sql.Date;

import org.apache.ibatis.type.Alias;

import lombok.Data;

@Data
@Alias("salequestion")
public class saleQuestion {
	private Integer q_id; // INT AUTO_INCREMENT PRIMARY KEY,-- 구매문의 ID
	private Integer sr_id; // '판매자 요청 ID (FK: seller_request.sr_id)',
	private String u_id; // VARCHAR(255) NOT NULL, -- FK: user.id
	private String i_id; // VARCHAR(255) NOT NULL, -- 상품 코드
	private String name; // VARCHAR(100) NOT NULL, -- 문의자 이름
	private String email; // VARCHAR(100),
	private String content; // TEXT NOT NULL, -- 문의 내용
	private String answer; // TEXT, -- 관리자 답변
	private Date TIMESTAMP; // DEFAULT CURRENT_TIMESTAMP
}
