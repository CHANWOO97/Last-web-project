package com.green.Lupang.dto;

import java.sql.Date;

import org.apache.ibatis.type.Alias;
import org.springframework.web.multipart.MultipartFile;

import lombok.Data;

@Data
@Alias("user")
public class User {
	private String u_id; // VARCHAR(255) NOT NULL COMMENT '사용자 ID',
    private String name; // VARCHAR(255),
    private String password; // VARCHAR(255),
    private String address; // VARCHAR(255),
    private String tel; // VARCHAR(255),
    private String email; // VARCHAR(255),
    private String photo; // 그림파일에 대한 이름
    private Date reg_date; // TIMESTAMP NULL COMMENT '가입일',
    private String user_role; // VARCHAR(255) COMMENT '사용자/관리자 구분',
    private String seller_role; // VARCHAR(255) NOT NULL DEFAULT 'n' COMMENT '판매자 승인 상태 (n:일반사용자/w:승인대기중/y:판매자승인완료)',
    private String del; // CHAR(1) DEFAULT 'n' COMMENT '삭제 여부',
    private int sr_id; // VARCHAR(255) NULL COMMENT '판매자 요청 ID (FK: seller_request.sr_id)',
    
    // upload
    private MultipartFile file; // 그림파일
}
