package com.green.Lupang.dto;

import java.util.Date;

import org.apache.ibatis.type.Alias;

import lombok.Data;
@Data
@Alias("selleritems")
public class SellerItems {
    private String seller_items_id; // INT AUTO_INCREMENT PRIMARY KEY,
    private String sr_id; // VARCHAR(255) NOT NULL, -- FK: sr.id
    private String i_id; // VARCHAR(100) NOT NULL,          -- FK: items.i_id
    private Date reg_date; // TIMESTAMP DEFAULT CURRENT_TIMESTAMP,UNIQUE (sr_id, i_id) -- 중복 찜 방지
    // items
    private String photo;
    private String name;
    private String size;
    private String stock;
    private String price;
    // 관리자 상품 삭제 여부 default false
    private boolean deleted;
}
