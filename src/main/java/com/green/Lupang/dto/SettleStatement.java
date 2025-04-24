package com.green.Lupang.dto;

import java.util.Date;

import org.apache.ibatis.type.Alias;

import lombok.Data;

@Data
@Alias("settle_statement")
public class SettleStatement {
	private int ss_id; // INT AUTO_INCREMENT PRIMARY KEY COMMENT '정산명세서 ID',
    private int sr_id; // INT NOT NULL COMMENT '판매자 요청 ID (FK: seller_request.sr_id)',
    private String u_id; // VARCHAR(255) NOT NULL COMMENT '작성자 ID (FK: user_table.u_id)',
    private int total_amount; // INT NOT NULL COMMENT '결제금액 (총 판매금액)',
    private int fee_amount; // INT NOT NULL COMMENT '수수료 금액',
    private int pg_fee; // INT NOT NULL COMMENT 'PG 수수료',
    private int net_amount; // INT NOT NULL COMMENT '최종 정산금액',
    private Date settle_date; // DATETIME DEFAULT CURRENT_TIMESTAMP COMMENT '정산일',
    private String st_invoice; // CHAR(1) DEFAULT 'w' comment '발행 상태 (대기 = w, 완료 = y, 취소 = n 등)'
    
    // 판매자 정보 (월별 구매일, 월별 매출총합..)
    private String year_month;
    private int total_sum;
    private String on_id;
    private String sr_ev;
    private String address;
    private String email;
}
