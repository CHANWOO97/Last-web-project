package com.green.Lupang.service;

import java.util.List;

import com.green.Lupang.dto.WishList;

public interface WishListService {

	boolean exists(String u_id, String i_id);
	void remove(String u_id, String i_id);
	void add(String u_id, String i_id);
	List<WishList> getWishlistByUserId(String id);
}
