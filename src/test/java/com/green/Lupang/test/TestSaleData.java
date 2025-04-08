package com.green.Lupang.test;

import java.util.UUID;

import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

import com.green.Lupang.dto.Sale;
import com.green.Lupang.dto.SaleItems;
import com.green.Lupang.service.SaleService;

@SpringBootTest
public class TestSaleData {
	@Autowired
	private SaleService ss;
	@Test
	public void main() {		
		for (int i = 0; i < 30; i++) {
		    String saleId = UUID.randomUUID().toString();
		    
		    Sale sale = new Sale();
		    sale.setS_id(saleId);
		    sale.setC_id("e5743ddb-54e5-4ccd-bf75-b07b97f8bb40");
		    sale.setReceiver("홍길동");
		    sale.setTel("010-1234-1234");
		    sale.setAddress("서울시 테스트동");
		    sale.setTotal(15000 + i * 1000); // 총 금액 예시
		    ss.saleSave(sale); // <insert id="saleSave">

		    // 샘플로 상품 1개만 추가
		    SaleItems item = new SaleItems();
		    item.setSi_id(UUID.randomUUID().toString());
		    item.setS_id(saleId);        // sale과 연결
		    item.setI_id(String.valueOf(721 + i));           // 실제 존재하는 상품 코드
		    item.setQuantity(1 + i % 3); // 수량 랜덤
		    ss.saleItemSave(item); // <insert id="saleItemSave">
		}
	}
}
