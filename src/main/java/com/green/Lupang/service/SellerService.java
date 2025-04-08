package com.green.Lupang.service;

import java.util.List;

import com.green.Lupang.dto.Seller;

public interface SellerService {
	int insert(Seller seller);

	List<Seller> seller_list();

	Seller selectByUid(String u_id);
}
