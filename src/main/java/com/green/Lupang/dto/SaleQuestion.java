package com.green.Lupang.dto;

import java.sql.Date;

import org.apache.ibatis.type.Alias;

import lombok.Data;

@Data
@Alias("saleques")
public class SaleQuestion {
	private Integer q_id; // INT AUTO_INCREMENT PRIMARY KEY,-- 구매문의 ID
	private String u_id; // VARCHAR(255) NOT NULL, -- FK: user.id
	private String i_id; // VARCHAR(255), -- 상품 코드
	private String name; // VARCHAR(100) NOT NULL, -- 문의자 이름
	private String email; // VARCHAR(100),
	private String content; // TEXT NOT NULL, -- 문의 내용
	private String answer; // TEXT, -- 관리자 답변
	private Date reg_date; // DEFAULT CURRENT_TIMESTAMP
	// items 테이블에서 상품이름 가져오기
	private String itemName;
	// 관리자 구매문의 답변상태('n','y')
	private String answer_state; // CHAR(1) DEFAULT 'n' COMMENT '답변 상태 (n/y)',
}
