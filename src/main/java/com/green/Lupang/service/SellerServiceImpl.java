package com.green.Lupang.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.green.Lupang.dto.Seller;
import com.green.Lupang.mapper.SellerMapper;

@Service
public class SellerServiceImpl implements SellerService{
	@Autowired
	private SellerMapper sm;
	@Override
	public int insert(Seller seller) {
		return sm.insert(seller);
	}
	@Override
	public List<Seller> seller_list() {
		return sm.seller_list();
	}
	@Override
	public Seller selectByUid(String u_id) {
		return sm.selectByUid(u_id);
	}
}
