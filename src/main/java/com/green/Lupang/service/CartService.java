package com.green.Lupang.service;

import java.util.List;

import com.green.Lupang.dto.CartItem;
import com.green.Lupang.dto.CartItemDTO;

public interface CartService {

	String getOrCreateCartId(String u_id);
	void addItemToCart(String c_id, String itemCode, int quantity);
	List<CartItemDTO> getCartItemsByUserId(String id);
	void updateQuantity(String id, String i_id, int quantity);
	void deleteItem(String id, String i_id);
	void clearCart(String c_id);
}
