CREATE TABLE items_category (
    ic_id VARCHAR(255) NOT NULL COMMENT '카테고리 ID',
    ic_name VARCHAR(255),
    PRIMARY KEY (ic_id)
);

INSERT INTO items_category (ic_id, ic_name) VALUES
('cat001', '패션/뷰티'),
('cat002', '식품/건강'),
('cat003', '홈/생활'),
('cat004', '스포츠/레저'),
('cat005', '미디어/오피스'),
('cat006', '완구/반려동물');

-- 상품 데이터 샘플 추가 10개
CREATE TABLE items (
   	i_id VARCHAR(255) NOT NULL COMMENT '상품코드',
    ic_id VARCHAR(255) NOT NULL COMMENT '카테고리 ID (FK: items_category.ic_id)',
    name VARCHAR(255),
    size VARCHAR(10) NOT NULL DEFAULT 'M' COMMENT '사이즈 (S/M/L)',
    photo VARCHAR(255),
    location VARCHAR(255) NOT NULL,
    stock INT NOT NULL,
    price INT NOT NULL,
    reg_date TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    description TEXT,
    PRIMARY KEY (i_id)
);


SELECT * FROM items_category;
delete from items_category;
