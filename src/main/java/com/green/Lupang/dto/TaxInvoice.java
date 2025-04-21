package com.green.Lupang.dto;

import java.util.Date;

import org.apache.ibatis.type.Alias;

import lombok.Data;

@Data
@Alias("taxinvoice")
public class TaxInvoice {
	private int ti_id; // int auto_increment primary key comment '세금계산서 ID',
    private int ss_id; // int not null comment '정산명세서 ID (FK: settle_statement.ss_id)',
    private int u_id; // varchar(255) not null comment '작성자 ID (FK: user_table.u_id)',
    private String invoice_number; // varchar(100) comment '전자세금계산서 번호',
    private int supply_amount; // INT NOT NULL comment '공급가액 (수수료 기준)',
    private int vat_amount; // INT NOT NULL comment '부가세',
    private int total_amount; // INT NOT NULL comment '합계금액',
    private Date issued_at; // DATETIME DEFAULT current_timestamp comment '발행일시',
    private String invoice_state; // CHAR(1) DEFAULT 'w' comment '발행 상태 (대기 = w, 완료 = y, 실패 = n 등)'
}
