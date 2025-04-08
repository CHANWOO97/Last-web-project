package com.green.Lupang.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.green.Lupang.dto.Seller;

@Mapper
public interface SellerMapper {
	int insert(Seller seller);
	List<Seller> seller_list();
	Seller selectByUid(String u_id);
}