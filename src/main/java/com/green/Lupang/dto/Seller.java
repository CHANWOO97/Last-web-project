package com.green.Lupang.dto;

import java.util.Date;
import java.util.List;

import org.apache.ibatis.type.Alias;
import org.springframework.web.multipart.MultipartFile;

import lombok.Data;

@Data
@Alias("seller")
public class Seller {
	private Integer sr_id; //  NOT NULL COMMENT '판매자 요청 ID',
	private String on_id; // VARCHAR(255) NOT NULL COMMENT '판매자 이름',
    private String sr_state; // CHAR(1) DEFAULT 'n' COMMENT '승인 상태 (n/y)',
    private Date srq_at; // TIMESTAMP NULL COMMENT '요청 날짜',
    private Date srw_at; // TIMESTAMP NULL COMMENT '승인 날짜',
    private String sr_ev; // VARCHAR(255) COMMENT '판매자 증빙(사업자번호 입력, evidence)',
    private String srw_pev; // VARCHAR(255) COMMENT '판매자 증빙(사업자등록증 사진, photo_evidence)',
    private String cn_msg; // VARCHAR(255) COMMENT '취소 메세지',
    private String ic_id; // VARCHAR(255) NOT NULL COMMENT '카테고리 ID (FK: items_category.ic_id)',
    private String u_id; // VARCHAR(255) NOT NULL COMMENT '작성자 ID (FK: user_table.u_id)',
    // 증빙 업로드용
    private MultipartFile file;
    private String ic_name;
    // 관리자 페이지 seller_role 추가 (n:일반사용자/w:승인대기중/y:판매자승인완료)
    private String seller_role;
    
}
