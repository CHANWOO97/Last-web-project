package com.green.Lupang.service;

import java.util.List;

import com.green.Lupang.dto.Items;
import com.green.Lupang.dto.Seller;
import com.green.Lupang.dto.SellerItems;

public interface SellerService {
	int insert(Seller seller);

	List<Seller> seller_list();

	Seller selectByUid(String u_id);

	String ic_name(String u_id);

	Seller select_id(String sr_id);

	int getsrid(String u_id);

	void insetSellrItems(SellerItems sellerItems);

	List<Items> getItesmsBysrId(int sr_id);
}
