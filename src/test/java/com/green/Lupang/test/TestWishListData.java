package com.green.Lupang.test;

import java.util.HashSet;
import java.util.Random;
import java.util.Set;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

import com.green.Lupang.service.WishListService;


@SpringBootTest
public class TestWishListData {
	@Autowired
	private WishListService wls;
	@Test
	public void main() {		
		 Random random = new Random();
		    Set<String> uniqueEntries = new HashSet<>();

		    int minItemId = 721;
		    int maxItemId = 1220;
		    int dataCount = 500;

		    while(uniqueEntries.size() < dataCount) {
		        String u_id = String.format("user%02d", random.nextInt(50) + 1);
		        int i_id = random.nextInt(maxItemId - minItemId + 1) + minItemId;
		        String itemIdStr = String.valueOf(i_id); // int를 String으로 변환

		        String entryKey = u_id + "-" + itemIdStr;

		        if(uniqueEntries.add(entryKey)) {
		            wls.add(u_id, itemIdStr); // ← 여기서 사용하면 됩니다.
		        }
		    }
		    System.out.println(uniqueEntries.size() + "건의 찜하기 데이터가 추가되었습니다.");
	}
}
