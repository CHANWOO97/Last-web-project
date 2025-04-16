package com.green.Lupang.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.green.Lupang.dto.Items;
import com.green.Lupang.dto.Seller;
import com.green.Lupang.dto.SellerItems;

@Mapper
public interface SellerMapper {
	int insert(Seller seller);
	List<Seller> seller_list(Map<String, Object> map);
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
	List<Items> getItemsBySeller(Map<String, Object> param);
}