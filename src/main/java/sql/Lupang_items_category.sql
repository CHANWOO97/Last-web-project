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

SELECT * FROM items_category;
delete from items_category;
