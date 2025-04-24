-- 이벤트 페이지 상품 추가 쿼리

INSERT INTO items (ic_id, name, size, photo, location, stock, price, description)
VALUES 
('event', '보스턴백', 'FREE', 'aim_DA_bostonBag_korea_01.jpg', '아이묭굿즈', 5, 0, '아이묭 보스턴백'),
('event', '재떨이', 'FREE', 'aim_DA_haizara_n1k0kz8_01.jpg', '아이묭굿즈', 5, 0, '아이묭 한정판 하이자라'),
('event', '후드집업', 'M', 'aim_DA_hoodie_korea_01.jpg', '아이묭굿즈', 5, 0, '보라색 후디 / M사이즈'),
('event', '꽝', 'FREE', 'fail.jpg', '시스템', 999, 0, '당첨되지 않았습니다!'),
('event', '티셔츠 (블랙)', 'L', 'aim_DA_TeeBlack_n1k0kz8_01.jpg', '아이묭굿즈', 5, 0, '블랙 티셔츠 / L사이즈'),
('event', '수건', 'FREE', 'aim_DA_towel_korea_01.jpg', '아이묭굿즈', 5, 0, '아이묭 수건 세트'),
('event', '티셔츠 (화이트)', 'M', 'aim_DA_TeeWhite_n1k0kz8_01.jpg', '아이묭굿즈', 5, 0, '화이트 티셔츠 / M사이즈'),
('event', 'AIMTAG 세트', 'FREE', 'aim_DA_AIMTAG_korea_01.jpg', '아이묭굿즈', 5, 0, '아이묭 AIMTAG 굿즈 세트');

-- EVENT 테이블 추가
CREATE TABLE event_result (
  er_id INT AUTO_INCREMENT PRIMARY KEY,
  u_id VARCHAR(255) NOT NULL, -- user
  i_id INT NOT NULL, -- items
  reg_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  UNIQUE (u_id) -- 계정당 1회 제한
);

update items set name='재떨이' where ic_id='event' and i_id=1333;
update items set name='후드집업' where name='후디' and ic_id='event';
update items set photo='fail.jpg' where name='꽝';
select * from event_result;
delete from event_result;	
SELECT * FROM items  WHERE ic_id = 'event' and deleted = FALSE;
delete from items where ic_id = 'event';