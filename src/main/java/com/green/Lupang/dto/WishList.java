package com.green.Lupang.dto;

import java.util.Date;

import org.apache.ibatis.type.Alias;

import lombok.Data;

@Data
@Alias("wishlist")
public class WishList {
    private int w_id; // INT AUTO_INCREMENT PRIMARY KEY,
    private String u_id; // VARCHAR(255) NOT NULL, -- FK: user.id
    private String i_id; // INT NOT NULL,          -- FK: items.i_id
    private Date reg_date; // TIMESTAMP DEFAULT CURRENT_TIMESTAMP, 						//UNIQUE (u_id, i_id)
    
    // 상품 items 테이블고 join
    private String name;
    private String photo;
    private int price;
}
