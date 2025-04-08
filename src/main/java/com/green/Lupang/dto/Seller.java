package com.green.Lupang.dto;

import java.util.Date;
import java.util.List;

import org.apache.ibatis.type.Alias;
import org.springframework.web.multipart.MultipartFile;

import lombok.Data;

@Data
@Alias("seller")
public class Seller {
	private String sr_id; // VARCHAR(255) NOT NULL COMMENT '판매자 요청 ID',
    private String sr_state; // CHAR(1) DEFAULT 'n' COMMENT '승인 상태 (n/y)',
    private Date srq_at; // TIMESTAMP NULL COMMENT '요청 날짜',
    private Date srw_at; // TIMESTAMP NULL COMMENT '승인 날짜',
    private String sr_ev; // VARCHAR(255) COMMENT '판매자 증빙(사업자번호 입력, evidence)',
    private String srw_pev; // VARCHAR(255) COMMENT '판매자 증빙(사업자등록증 사진, photo_evidence)',
    private String i_id; // VARCHAR(255) NOT NULL COMMENT '상품코드 (FK: items.i_id)',
    // 증빙 업로드용
    private MultipartFile file;

}
