package com.green.Lupang.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.green.Lupang.dto.Cart;
import com.green.Lupang.dto.CartItem;
import com.green.Lupang.dto.Sale;

@Mapper
public interface CartMapper {

	Cart findByUserId(String u_id);
	void cartSave(Map<String, Object> map);
	CartItem findByCartIdAndItemCode(Map<String, Object> map);
	void cartItemsUpdate(CartItem existingItem);
	void cartItemsSave(Map<String, Object> map2);
	List<CartItem> findByCartId(String c_id);
	void updateQuantity(CartItem ci);
	void deleteItem(CartItem ci);
	void clearCart(CartItem cartitem);
	int findCartByUserAndItem(Map<String, Object> map);
}
