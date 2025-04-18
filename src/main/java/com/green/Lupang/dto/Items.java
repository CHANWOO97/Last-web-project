package com.green.Lupang.dto;

import java.sql.Date;

import org.apache.ibatis.type.Alias;
import org.springframework.web.multipart.MultipartFile;

import lombok.Data;

@Data
@Alias("items")
public class Items {
   	private String i_id; // VARCHAR(255) NOT NULL COMMENT '상품코드', PRIMARY KEY
    private String ic_id; // VARCHAR(255) NOT NULL COMMENT '카테고리 ID (FK: items_category.ic_id)',
    private String name; // VARCHAR(255),
    private String size; // VARCHAR(10) NOT NULL DEFAULT 'M' COMMENT '사이즈 (S/M/L)',
    private String photo; // VARCHAR(255);
    private String location; // VARCHAR(255) NOT NULL,
    private int  stock; // INT NOT NULL,
    private int price; // INT NOT NULL,
    private Date reg_date; // TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    private String description; // TEXT,
    private boolean deleted; // 관리자 상품 삭제 여부 default false
    
    // 파일저장, 카테고리 조인 시 ic_name도 가져올래
    private MultipartFile file;
    private String ic_name; // 카테고리 이름
    private String on_id; // 판매자 이름
}
