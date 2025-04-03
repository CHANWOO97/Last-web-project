package com.green.Lupang.dto;

import java.sql.Date;

import org.apache.ibatis.type.Alias;

import lombok.Data;

@Data
@Alias("board")
public class Board {
		   private String b_id; // VARCHAR(255) NOT NULL COMMENT '게시글 ID',
		   private String bc_id; // VARCHAR(255) NOT NULL COMMENT '게시판 카테고리 ID (FK: board_category.bc_id)',
		   private String u_id; // VARCHAR(255) NOT NULL COMMENT '작성자 ID (FK: user_table.u_id)',
		   private String title; // VARCHAR(255),
		   private String content; // VARCHAR(255),
		   private Date created_at; // TIMESTAMP NULL DEFAULT CURRENT_TIMESTAMP COMMENT '작성 일시',
		   private Date updated_at; // TIMESTAMP NULL DEFAULT NULL COMMENT '수정 일시',
		   private String status; // CHAR(1) NOT NULL DEFAULT 'n' COMMENT '활성화(n)/삭제(y)',
}
