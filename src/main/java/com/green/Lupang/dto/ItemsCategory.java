package com.green.Lupang.dto;

import org.apache.ibatis.type.Alias;

import lombok.Data;

@Data
@Alias("items_category")
public class ItemsCategory {
	 private String ic_id; // VARCHAR(255) NOT NULL COMMENT '카테고리 ID',
	 private String ic_name; // VARCHAR(255),
}
