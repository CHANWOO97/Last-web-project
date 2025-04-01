-- 게시판 카테고리 테이블
CREATE TABLE board_category (
    bc_id VARCHAR(255) NOT NULL COMMENT '게시판 카테고리 ID',
    name VARCHAR(255),
    description VARCHAR(255),
    PRIMARY KEY (bc_id)
);

-- 게시판 테이블
CREATE TABLE board (
    b_id VARCHAR(255) NOT NULL COMMENT '게시글 ID',
    bc_id VARCHAR(255) NOT NULL COMMENT '게시판 카테고리 ID (FK: board_category.board_category_id)',
    u_id VARCHAR(255) NOT NULL COMMENT '작성자 ID (FK: user_table.user_id)',
    title VARCHAR(255),
    content VARCHAR(255),
    created_at TIMESTAMP NULL DEFAULT CURRENT_TIMESTAMP COMMENT '작성 일시',
    updated_at TIMESTAMP NULL DEFAULT NULL COMMENT '수정 일시',
    status CHAR(1) NOT NULL DEFAULT 'n' COMMENT '활성화(n)/삭제(y)',
    PRIMARY KEY (b_id)
);

-- 사용자 테이블
CREATE TABLE user_table (
    u_id VARCHAR(255) NOT NULL COMMENT '사용자 ID',
    name VARCHAR(255),
    password VARCHAR(255),
    address VARCHAR(255),
    tel VARCHAR(255),
    email VARCHAR(255),
    reg_date TIMESTAMP NULL COMMENT '가입일',
    user_role VARCHAR(255) COMMENT '사용자/관리자 구분',
    seller_role VARCHAR(255) NOT NULL DEFAULT 'n' COMMENT '판매자 신청 상태 (n/y)',
    del CHAR(1) DEFAULT 'n' COMMENT '삭제 여부',
    request_id VARCHAR(255) NOT NULL COMMENT '판매자 요청 ID (FK: seller_request_table.request_id)',
    PRIMARY KEY (u_id)
);

-- 장바구니 테이블
CREATE TABLE cart (
    c_id VARCHAR(255) NOT NULL COMMENT '장바구니 ID',
    c_date TIMESTAMP NULL DEFAULT CURRENT_TIMESTAMP,
    u_id VARCHAR(255) NOT NULL COMMENT '사용자 ID (FK: user_table.user_id)',
    PRIMARY KEY (c_id)
);

-- 장바구니-상품 연결 테이블
CREATE TABLE cart_items (
    ci_id VARCHAR(255) NOT NULL COMMENT '복합키 형식 ID',
    ci_code VARCHAR(255) NOT NULL COMMENT '상품코드 (FK: product_table.product_code)',
    c_id VARCHAR(255) NOT NULL COMMENT '장바구니 ID (FK: shopping_cart_table.cart_id)',
    quantity INT NOT NULL COMMENT '상품 수량',
    PRIMARY KEY (ci_id)
);

-- 판매 요청 테이블
CREATE TABLE seller_request (
    sr_id VARCHAR(255) NOT NULL COMMENT '판매자 요청 ID',
    sr_state CHAR(1) DEFAULT 'n' COMMENT '승인 상태 (n/y)',
    srq_at TIMESTAMP NULL COMMENT '요청 날짜',
    srw_at TIMESTAMP NULL COMMENT '승인 날짜',
    i_id VARCHAR(255) NOT NULL COMMENT '상품코드 (FK: items.i_id)',
    PRIMARY KEY (sr_id)
);

-- 상품 카테고리 테이블
CREATE TABLE items_category (
    ic_id VARCHAR(255) NOT NULL COMMENT '카테고리 ID',
    ic_name VARCHAR(255),
    PRIMARY KEY (ic_id)
);

-- 상품 테이블
CREATE TABLE items (
   	i_id VARCHAR(255) NOT NULL COMMENT '상품코드',
    ic_id VARCHAR(255) NOT NULL COMMENT '카테고리 ID (FK: items_category.ic_id)',
    name VARCHAR(255),
    size VARCHAR(10) NOT NULL DEFAULT 'M' COMMENT '사이즈 (S/M/L)',
    location VARCHAR(255) NOT NULL,
    stock INT NOT NULL,
    price INT NOT NULL,
    reg_date TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    description TEXT,
    PRIMARY KEY (i_id)
);

-- 구매 테이블
CREATE TABLE sale (
    s_id VARCHAR(255) NOT NULL COMMENT '구매 ID',
    s_date TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '구매일',
    s_status CHAR(1) DEFAULT 'n' COMMENT '구매 상태 (n: 미결제)',
    c_id VARCHAR(255) NOT NULL COMMENT '장바구니 ID (FK: cart.c_id)',
    PRIMARY KEY (s_id)
);

-- 판매된 상품 테이블
CREATE TABLE sale_items (
    si_id VARCHAR(255) NOT NULL COMMENT '복합키 형식 ID',
    s_id VARCHAR(255) NOT NULL COMMENT '구매 ID (FK: shopping_sale_table.sale_id)',
    i_id VARCHAR(255) NOT NULL COMMENT '상품코드 (FK: items.i_id)',
    quantity INT,
    PRIMARY KEY (si_id)
);
