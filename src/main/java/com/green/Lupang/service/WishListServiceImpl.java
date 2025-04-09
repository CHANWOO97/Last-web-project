package com.green.Lupang.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.green.Lupang.dto.WishList;
import com.green.Lupang.mapper.WishListMapper;

@Service
public class WishListServiceImpl implements WishListService{
	@Autowired
	private WishListMapper wlm;

	@Override
	public boolean exists(String u_id, String i_id) {
		WishList wishlist = new WishList();
		wishlist.setU_id(u_id); wishlist.setI_id(i_id);
		return wlm.exists(wishlist) > 0;
	}
	@Override
	public void remove(String u_id, String i_id) {
		WishList wishlist = new WishList();
		wishlist.setU_id(u_id); wishlist.setI_id(i_id);
		wlm.remove(wishlist);
	}
	@Override
	public void add(String u_id, String i_id) {
		WishList wishlist = new WishList();
		wishlist.setU_id(u_id); wishlist.setI_id(i_id);
		wlm.add(wishlist);
	}
	@Override
	public List<WishList> getWishlistByUserId(String id) {
		return wlm.getWishlistByUserId(id);
	}
}
