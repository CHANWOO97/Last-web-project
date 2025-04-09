package com.green.Lupang.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.green.Lupang.dto.WishList;

@Mapper
public interface WishListMapper {
	int exists(WishList wishlist);
	void remove(WishList wishlist);
	void add(WishList wishlist);
	List<WishList> getWishlistByUserId(String id);
}
