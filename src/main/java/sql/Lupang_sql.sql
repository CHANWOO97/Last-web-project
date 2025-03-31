-- 게시판 카테고리 테이블
CREATE TABLE board_category (
    board_category_id VARCHAR(255) NOT NULL COMMENT '게시판 카테고리 ID',
    category_name VARCHAR(255),
    category_description VARCHAR(255),
    PRIMARY KEY (board_category_id)
);

-- 게시판 테이블
CREATE TABLE board (
    board_id VARCHAR(255) NOT NULL COMMENT '게시글 ID',
    board_category_id VARCHAR(255) NOT NULL COMMENT '게시판 카테고리 ID (FK: board_category.board_category_id)',
    user_id VARCHAR(255) NOT NULL COMMENT '작성자 ID (FK: user_table.user_id)',
    board_title VARCHAR(255),
    board_content VARCHAR(255),
    board_created_at TIMESTAMP NULL DEFAULT CURRENT_TIMESTAMP COMMENT '작성 일시',
    board_updated_at TIMESTAMP NULL DEFAULT NULL COMMENT '수정 일시',
    board_status CHAR(1) NOT NULL DEFAULT 'n' COMMENT '활성화(n)/삭제(y)',
    PRIMARY KEY (board_id)
);

-- 사용자 테이블
CREATE TABLE user_table (
    user_id VARCHAR(255) NOT NULL COMMENT '사용자 ID',
    user_name VARCHAR(255),
    password VARCHAR(255),
    address VARCHAR(255),
    tel VARCHAR(255),
    email VARCHAR(255),
    reg_date TIMESTAMP NULL COMMENT '가입일',
    user_role VARCHAR(255) COMMENT '사용자/관리자 구분',
    seller_role VARCHAR(255) NOT NULL DEFAULT 'n' COMMENT '판매자 신청 상태 (n/y)',
    del CHAR(1) DEFAULT 'n' COMMENT '삭제 여부',
    request_id VARCHAR(255) NOT NULL COMMENT '판매자 요청 ID (FK: seller_request_table.request_id)',
    PRIMARY KEY (user_id)
);

-- 장바구니 테이블
CREATE TABLE shopping_cart_table (
    cart_id VARCHAR(255) NOT NULL COMMENT '장바구니 ID',
    cart_date TIMESTAMP NULL DEFAULT CURRENT_TIMESTAMP,
    user_id VARCHAR(255) NOT NULL COMMENT '사용자 ID (FK: user_table.user_id)',
    PRIMARY KEY (cart_id)
);

-- 장바구니-상품 연결 테이블
CREATE TABLE cart_product_table (
    cart_product_id VARCHAR(255) NOT NULL COMMENT '복합키 형식 ID',
    product_code VARCHAR(255) NOT NULL COMMENT '상품코드 (FK: product_table.product_code)',
    cart_id VARCHAR(255) NOT NULL COMMENT '장바구니 ID (FK: shopping_cart_table.cart_id)',
    cart_quantity INT NOT NULL COMMENT '상품 수량',
    PRIMARY KEY (cart_product_id)
);

-- 판매 요청 테이블
CREATE TABLE seller_request_table (
    request_id VARCHAR(255) NOT NULL COMMENT '판매자 요청 ID',
    request_state CHAR(1) DEFAULT 'n' COMMENT '승인 상태 (n/y)',
    seller_request_at TIMESTAMP NULL COMMENT '요청 날짜',
    seller_reward_at TIMESTAMP NULL COMMENT '승인 날짜',
    product_code VARCHAR(255) NOT NULL COMMENT '상품코드 (FK: product_table.product_code)',
    PRIMARY KEY (request_id)
);

-- 상품 카테고리 테이블
CREATE TABLE product_category_table (
    category_id VARCHAR(255) NOT NULL COMMENT '카테고리 ID',
    category_name VARCHAR(255),
    PRIMARY KEY (category_id)
);

-- 상품 테이블
CREATE TABLE product_table (
    product_code VARCHAR(255) NOT NULL COMMENT '상품코드',
    category_id VARCHAR(255) NOT NULL COMMENT '카테고리 ID (FK: product_category_table.category_id)',
    product_name VARCHAR(255),
    product_size VARCHAR(10) NOT NULL DEFAULT 'M' COMMENT '사이즈 (S/M/L)',
    product_location VARCHAR(255) NOT NULL,
    product_stock INT NOT NULL,
    product_price INT NOT NULL,
    product_regdate TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    product_description TEXT,
    PRIMARY KEY (product_code)
);

-- 구매 테이블
CREATE TABLE shopping_sale_table (
    sale_id VARCHAR(255) NOT NULL COMMENT '구매 ID',
    sale_date TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '구매일',
    sale_status CHAR(1) DEFAULT 'n' COMMENT '구매 상태 (n: 미결제)',
    cart_id VARCHAR(255) NOT NULL COMMENT '장바구니 ID (FK: shopping_cart_table.cart_id)',
    PRIMARY KEY (sale_id)
);

-- 판매된 상품 테이블
CREATE TABLE sale_product_table (
    sale_product_id VARCHAR(255) NOT NULL COMMENT '복합키 형식 ID',
    sale_id VARCHAR(255) NOT NULL COMMENT '구매 ID (FK: shopping_sale_table.sale_id)',
    product_code VARCHAR(255) NOT NULL COMMENT '상품코드 (FK: product_table.product_code)',
    sale_quantity INT,
    PRIMARY KEY (sale_product_id)
);
