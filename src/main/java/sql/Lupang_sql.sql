-- 테이블 삭제
DROP TABLE board_category;
DROP TABLE board;
DROP TABLE user_table;
DROP TABLE cart;
DROP TABLE cart_items;
DROP TABLE seller_request;
DROP TABLE items_category;
DROP TABLE items;
DROP TABLE seller_items;
DROP TABLE sale;
DROP TABLE sale_items;
DROP TABLE wishlist;
DROP TABLE sale_question;

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
    seller_role CHAR(1) CHECK (seller_role IN ('n', 'w', 'y')) not null DEFAULT 'n' COMMENT '판매자 승인 상태 (n:일반사용자/w:승인대기중/y:판매자승인완료)',
    del CHAR(1) DEFAULT 'n' COMMENT '삭제 여부',
    sr_id VARCHAR(255) COMMENT '판매자 요청 ID (FK: seller_request.sr_id)',
    PRIMARY KEY (u_id)
);
SELECT * FROM user_table;

-- 장바구니 테이블
CREATE TABLE cart (
    c_id VARCHAR(255) NOT NULL COMMENT '장바구니 ID',
    c_date TIMESTAMP NULL DEFAULT CURRENT_TIMESTAMP,
    u_id VARCHAR(255) NOT NULL COMMENT '사용자 ID (FK: user_table.u_id)',
    PRIMARY KEY (c_id)
);
SELECT * FROM cart;

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
    sr_id INT NOT NULL COMMENT '판매자 요청 ID',
	on_id VARCHAR(255) NOT NULL COMMENT '판매자 이름',
    sr_state CHAR(1) DEFAULT 'n' COMMENT '승인 상태 (n/y)',
   	srq_at TIMESTAMP NULL COMMENT '요청 날짜',
    srw_at TIMESTAMP NULL COMMENT '승인 날짜',
    sr_ev VARCHAR(255) COMMENT '판매자 증빙(사업자번호 입력, evidence)',
    srw_pev VARCHAR(255) COMMENT '판매자 증빙(사업자등록증 사진, photo_evidence)',
    cn_msg VARCHAR(255) COMMENT '취소 메세지',
    ic_id VARCHAR(255) NOT NULL COMMENT '카테고리 ID (FK: items_category.ic_id)',
    u_id VARCHAR(255) NOT NULL COMMENT '작성자 ID (FK: user_table.u_id)',
    PRIMARY KEY (sr_id)
);
ALTER TABLE seller_request ADD COLUMN u_id VARCHAR(255) NOT NULL;
select * from seller_request;

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
    is_deleted BOOLEAN DEFAULT FALSE,
    PRIMARY KEY (i_id)
);
ALTER TABLE items
MODIFY COLUMN i_id INT NOT NULL AUTO_INCREMENT COMMENT '상품코드 (자동 증가)';
ALTER TABLE items
MODIFY COLUMN size VARCHAR(10) DEFAULT 'M' COMMENT '사이즈 (S/M/L)';
ALTER TABLE items RENAME COLUMN is_deleted TO deleted;
ALTER TABLE items ADD COLUMN deleted BOOLEAN DEFAULT FALSE;
select * from items;

-- 판매자-상품 연결 테이블
CREATE TABLE seller_items (
    seller_items_id INT AUTO_INCREMENT PRIMARY KEY,
    sr_id VARCHAR(255) NOT NULL, -- FK: sr.id
    i_id VARCHAR(100) NOT NULL,          -- FK: items.i_id
    reg_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    UNIQUE (sr_id, i_id)         -- 중복 찜 방지
);
select * from seller_items;

-- 구매 테이블
CREATE TABLE sale (
    s_id VARCHAR(255) NOT NULL COMMENT '구매 ID',
    u_id VARCHAR(255) COMMENT '사용자 ID',
    s_date TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '구매일',
    s_status CHAR(1) DEFAULT 'n' COMMENT '구매 상태 (n: 미결제)',
    c_id VARCHAR(255) NOT NULL COMMENT '장바구니 ID (FK: cart.c_id)',
    receiver VARCHAR(100),
    tel VARCHAR(50),
	address VARCHAR(255),
	total INT NOT NULL,
    PRIMARY KEY (s_id)
);
SELECT * FROM sale;

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
    i_id VARCHAR(100) NOT NULL,          -- FK: items.i_id
    reg_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    UNIQUE (u_id, i_id)         -- 중복 찜 방지
);

-- 구매문의 테이블 추가
CREATE TABLE sale_question (
    q_id INT AUTO_INCREMENT PRIMARY KEY,-- 구매문의 ID
    u_id VARCHAR(255) NOT NULL COMMENT '작성자 ID (FK: user_table.u_id)',  
    i_id VARCHAR(255) NULL COMMENT '상품코드 (FK: items_table.i_id)',
    name VARCHAR(100) NOT NULL,         -- 문의자 이름
    email VARCHAR(100),
    content TEXT NOT NULL,              -- 문의 내용
    answer TEXT,                        -- 관리자 답변
    reg_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);
ALTER TABLE sale_question MODIFY COLUMN i_id VARCHAR(255) NULL;
select * from sale_question

-- admin 계정 미리 생성 -- 패스워드 1234 
insert into user_table (u_id ,name, password) values('admin', '관리자', '$2a$10$ty1UwZwvhK2TPP7Y/cNzV.URmSgXKysy7l4iJl6n5o8s5bMDuXU2e');
