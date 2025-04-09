-- 테이블 삭제
DROP TABLE board_category;
DROP TABLE board;
DROP TABLE user_table;
DROP TABLE cart;
DROP TABLE cart_items;
DROP TABLE seller_request;
DROP TABLE items_category;
DROP TABLE items;
DROP TABLE sale;
DROP TABLE sale_items;

-- 게시판 카테고리 테이블
CREATE TABLE board_category (
    bc_id VARCHAR(255) NOT NULL COMMENT '게시판 카테고리 ID',
    name VARCHAR(255),
    description VARCHAR(255),
    PRIMARY KEY (bc_id)
);
SELECT * FROM board_category;

-- 게시판 테이블
CREATE TABLE board (
    b_id VARCHAR(255) NOT NULL COMMENT '게시글 ID',
    bc_id VARCHAR(255) NOT NULL COMMENT '게시판 카테고리 ID (FK: board_category.bc_id)',
    u_id VARCHAR(255) NOT NULL COMMENT '작성자 ID (FK: user_table.u_id)',
    title VARCHAR(255),
    content VARCHAR(255),
    created_at TIMESTAMP NULL DEFAULT CURRENT_TIMESTAMP COMMENT '작성 일시',
    updated_at TIMESTAMP NULL DEFAULT NULL COMMENT '수정 일시',
    status CHAR(1) NOT NULL DEFAULT 'n' COMMENT '활성화(n)/삭제(y)',
    PRIMARY KEY (b_id)
);
SELECT * FROM board;

-- 사용자 테이블
CREATE TABLE user_table (
    u_id VARCHAR(255) NOT NULL COMMENT '사용자 ID',
    name VARCHAR(255),
    password VARCHAR(255),
    address VARCHAR(255),
    tel VARCHAR(255),
    email VARCHAR(255),
    photo VARCHAR(255),
    reg_date TIMESTAMP NULL COMMENT '가입일',
    user_role VARCHAR(255) COMMENT '사용자/관리자 구분',
    seller_role VARCHAR(255) NOT NULL DEFAULT 'n' COMMENT '판매자 신청 상태 (n/y)',
    del CHAR(1) DEFAULT 'n' COMMENT '삭제 여부',
    sr_id VARCHAR(255) COMMENT '판매자 요청 ID (FK: seller_request.sr_id)',
    PRIMARY KEY (u_id)
);
SELECT * FROM user_table where u_id = 'test';

-- 장바구니 테이블
CREATE TABLE cart (
    c_id VARCHAR(255) NOT NULL COMMENT '장바구니 ID',
    c_date TIMESTAMP NULL DEFAULT CURRENT_TIMESTAMP,
    u_id VARCHAR(255) NOT NULL COMMENT '사용자 ID (FK: user_table.u_id)',
    PRIMARY KEY (c_id)
);
SELECT * FROM cart;
delete from cart;

-- 장바구니-상품 연결 테이블
CREATE TABLE cart_items (
    ci_id VARCHAR(255) NOT NULL COMMENT '복합키 형식 ID',
    i_id VARCHAR(255) NOT NULL COMMENT '상품코드 (FK: items_table.i_id)',
    c_id VARCHAR(255) NOT NULL COMMENT '장바구니 ID (FK: cart_table.c_id)',
    quantity INT NOT NULL COMMENT '상품 수량',
    PRIMARY KEY (ci_id)
);
SELECT * FROM cart_items;

-- 판매 요청 테이블
CREATE TABLE seller_request (
    sr_id VARCHAR(255) NOT NULL COMMENT '판매자 요청 ID',
    sr_state CHAR(1) DEFAULT 'n' COMMENT '승인 상태 (n/y)',
    srq_at TIMESTAMP NULL COMMENT '요청 날짜',
    srw_at TIMESTAMP NULL COMMENT '승인 날짜',
    i_id VARCHAR(255) NOT NULL COMMENT '상품코드 (FK: items.i_id)',
    PRIMARY KEY (sr_id)
);
SELECT * FROM seller_request;

-- 상품 카테고리 테이블
CREATE TABLE items_category (
    ic_id VARCHAR(255) NOT NULL COMMENT '카테고리 ID',
    ic_name VARCHAR(255),
    PRIMARY KEY (ic_id)
);
SELECT * FROM items_category;

-- 상품 테이블
CREATE TABLE items (
   	i_id INT NOT NULL AUTO_INCREMENT COMMENT '상품코드 (자동 증가)',
    ic_id VARCHAR(255) NOT NULL COMMENT '카테고리 ID (FK: items_category.ic_id)',
    name VARCHAR(255),
    size VARCHAR(10) DEFAULT 'M' COMMENT '사이즈 (S/M/L)',
    photo VARCHAR(255),
    location VARCHAR(255) NOT NULL,
    stock INT NOT NULL,
    price INT NOT NULL,
    reg_date TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    description TEXT,
    PRIMARY KEY (i_id)
);
ALTER TABLE items
MODIFY COLUMN i_id INT NOT NULL AUTO_INCREMENT COMMENT '상품코드 (자동 증가)';
ALTER TABLE items
MODIFY COLUMN size VARCHAR(10) DEFAULT 'M' COMMENT '사이즈 (S/M/L)';

-- 트리거 종료 표시를 위한 DELIMITER 복구
DELIMITER ;
SELECT * FROM items;

-- 구매 테이블
CREATE TABLE sale (
    s_id VARCHAR(255) NOT NULL COMMENT '구매 ID',
    s_date TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '구매일',
    s_status CHAR(1) DEFAULT 'n' COMMENT '구매 상태 (n: 미결제)',
    c_id VARCHAR(255) NOT NULL COMMENT '장바구니 ID (FK: cart.c_id)',
    receiver VARCHAR(100),
    tel VARCHAR(50),
	address VARCHAR(255);
	total INT NOT NULL,
    PRIMARY KEY (s_id)
);
SELECT * FROM sale;
ALTER TABLE sale
ADD COLUMN receiver VARCHAR(100),
ADD COLUMN tel VARCHAR(50),
ADD COLUMN address VARCHAR(255);

ALTER TABLE sale ADD COLUMN total INT NOT NULL;

-- 구매 상품 관계 (판매된 상품 테이블)
CREATE TABLE sale_items (
    si_id VARCHAR(255) NOT NULL COMMENT '복합키 형식 ID',
    s_id VARCHAR(255) NOT NULL COMMENT '구매 ID (FK: sale_table.s_id)',
    i_id VARCHAR(255) NOT NULL COMMENT '상품코드 (FK: items.i_id)',
    quantity INT,
    PRIMARY KEY (si_id)
);

-- 찜하기 기능 위시리스트(wishlist) 테이블 추가 구현
CREATE TABLE wishlist (
    w_id INT AUTO_INCREMENT PRIMARY KEY,
    u_id VARCHAR(255) NOT NULL, -- FK: user.id
    i_id i_id VARCHAR(100) NOT NULL,          -- FK: items.i_id
    reg_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    UNIQUE (u_id, i_id)         -- 중복 찜 방지
);
select * from user_table where u_id='k1';

