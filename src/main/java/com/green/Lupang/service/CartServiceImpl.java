package com.green.Lupang.service;

import java.util.ArrayList;
import java.util.Collections;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.green.Lupang.dto.Cart;
import com.green.Lupang.dto.CartItem;
import com.green.Lupang.dto.CartItemDTO;
import com.green.Lupang.dto.Items;
import com.green.Lupang.mapper.CartMapper;
import com.green.Lupang.mapper.ItemsMapper;

@Service
public class CartServiceImpl implements CartService{
	@Autowired
	private CartMapper cm;
	@Autowired
	private ItemsMapper im;
	
	@Override
	public String getOrCreateCartId(String u_id) {
		// SELECT * FROM cart WHERE u_id = ?
		Cart cart = cm.findByUserId(u_id); // 기존 유저아이디로 검색하여 장바구니가 있는지 검색
		if (cart != null) { // cart 는 존재한다
			return cart.getC_id(); // 기존 유저아이로 검색했을 때 나온 장바구니 고유코드로 전달
		} else {
			String newCartId = UUID.randomUUID().toString(); // 장바구니 고유코드는 정렬 필요없으니 랜덤값으로 생성		
			Map<String, Object> map = new HashMap<>();
			map.put("c_id", newCartId);
			map.put("u_id", u_id);
			cm.cartSave(map); // INSERT 입력할 것 매퍼에 전달
			return newCartId; // 기존 유저아이디로 검색 후 없을 때 생성한 랜덤값으로 전달
		}
	}
	@Override
	public void addItemToCart(String c_id, String itemCode, int quantity) {
		Map<String, Object> map = new HashMap<>();
		Map<String, Object> map2 = new HashMap<>();
		map.put("c_id", c_id);	map.put("i_id", itemCode);
		// 장바구니와 상품 관계 테이블에서 장바구니에 이미 상품이 담겨있는지 확인한다.
		CartItem existingItem = cm.findByCartIdAndItemCode(map); // existingItem 기존항목	()	
				
		 if (existingItem != null) { // 상품이 있는 것이 확인되었다!
	        existingItem.setQuantity(existingItem.getQuantity() + quantity);
	        cm.cartItemsUpdate(existingItem); // UPDATE cart_items SET quantity = ... WHERE ...
	    } else {
	        String ci_id = UUID.randomUUID().toString(); // cart_items primary key
	        map2.put("ci_id", ci_id);	map2.put("c_id", c_id); 
	        map2.put("i_id", itemCode); map2.put("quantity", quantity);
	        cm.cartItemsSave(map2); // INSERT
	    }
	}
	@Override
	public List<CartItemDTO> getCartItemsByUserId(String id) {
		Cart cart = cm.findByUserId(id);
		if(cart == null) return Collections.emptyList(); // 장바구니 자체가 없으면 빈리스트 리턴함
		
		List<CartItem> cartItems = cm.findByCartId(cart.getC_id());
		
		List<CartItemDTO> result = new ArrayList<>(); // 실제로 화면에 뿌릴 데이터를 담을 DTO 리스트
													  // 원래 cart_items 클래스에 추가할 생각이였는데 DTO 클래스 추가
		for (CartItem ci : cartItems) {				  // 장바구니에 담긴 상품을 탐색
			Items items = im.select(ci.getI_id());  // 상품 상세 정보(items 테이블에서 name, photo, price) 등을 조회함
			CartItemDTO dto = new CartItemDTO(items.getI_id(), items.getName(), items.getPhoto(), items.getPrice(), ci.getQuantity());
			result.add(dto);
		}		
		return result;
	}
	@Override // 장바구니에서 실시간 수량 업데이트
	public void updateQuantity(String id, String i_id, int quantity) {
		Cart cart = cm.findByUserId(id);
		String cartId = cart.getC_id();
		CartItem ci = new CartItem(); 
		ci.setC_id(cartId); ci.setI_id(i_id); ci.setQuantity(quantity);
		cm.updateQuantity(ci);
		
	}
	@Override // 장바구니에 있는 상품 삭제
	public void deleteItem(String id, String i_id) {
		Cart cart = cm.findByUserId(id);
		String cartId = cart.getC_id();
		CartItem ci = new CartItem(); 
		ci.setC_id(cartId); ci.setI_id(i_id);
		cm.deleteItem(ci);
		
	}
	@Override
	public void clearCart(String c_id) {
		cm.clearCart(c_id);
	}
}
