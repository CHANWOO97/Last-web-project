package com.green.Lupang.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.green.Lupang.dto.Seller;
import com.green.Lupang.dto.SellerItems;
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
	@Override
	public String ic_name(String u_id) {
		return sm.ic_name(u_id);
	}
	@Override
	public Seller select_id(String sr_id) {
		return sm.select_id(sr_id);
	}
	@Override
	public int getsrid(String u_id) {
		return sm.getsrid(u_id);
	}
	@Override
	public void insetSellrItems(SellerItems sellerItems) {
		sm.insetSellrItems(sellerItems);
	}

}
