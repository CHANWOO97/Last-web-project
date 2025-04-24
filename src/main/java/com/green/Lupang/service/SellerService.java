package com.green.Lupang.service;

import java.util.List;

import com.green.Lupang.dto.Items;
import com.green.Lupang.dto.Sale;
import com.green.Lupang.dto.Seller;
import com.green.Lupang.dto.SellerItems;

public interface SellerService {
	int insert(Seller seller);

	List<Seller> seller_list(int startRow, int rowPerPage);

	Seller selectByUid(String u_id);

	String ic_name(String u_id);

	Seller select_id(String sr_id);

	int getsrid(String u_id);

	void insetSellrItems(SellerItems sellerItems);

	List<Items> getItesmsBysrId(int sr_id);

	void approve(int sr_id);

	void reject(int sr_id);

	void updateCnMsg(Seller seller);

	void updateNullCnMsg(Seller seller);

	int countItemsBySeller(int sr_id);

	List<Items> getItemsBySeller(int sr_id, int startRow, int rowPerPage);

	int countSeller();

	List<Seller> sellerListbySr_id(int offset, int rowPerPage);

	List<Sale> saleJoinList(int offset, int rowPerPage);
}
