package com.green.Lupang.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.green.Lupang.dto.Seller;
import com.green.Lupang.dto.SellerItems;

@Mapper
public interface SellerMapper {
	int insert(Seller seller);
	List<Seller> seller_list();
	Seller selectByUid(String u_id);
	String ic_name(String u_id);
	Seller select_id(String sr_id);
	int getsrid(String u_id);
	void insetSellrItems(SellerItems sellerItems);
}