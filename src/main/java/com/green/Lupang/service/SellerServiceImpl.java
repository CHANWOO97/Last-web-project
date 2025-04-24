package com.green.Lupang.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.green.Lupang.dto.Items;
import com.green.Lupang.dto.Sale;
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
	public List<Seller> seller_list(int startRow, int rowPerPage) {
		Map<String, Object> map = new HashMap<>();
		map.put("startRow", startRow);
		map.put("rowPerPage", rowPerPage);
		return sm.seller_list(map);
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
	@Override
	public List<Items> getItesmsBysrId(int sr_id) {
		return sm.getItesmsBysrId(sr_id);
	}
	@Override
	public void approve(int sr_id) {
		sm.approve(sr_id);
	}
	@Override
	public void reject(int sr_id) {
		sm.reject(sr_id);
	}
	@Override
	public void updateCnMsg(Seller seller) {
		sm.updateCnMsg(seller);
	}
	@Override
	public void updateNullCnMsg(Seller seller) {
		sm.updateNullCnMsg(seller);
	}
	@Override
	public int countItemsBySeller(int sr_id) {
		return sm.countItemsBySeller(sr_id);
	}
	@Override
	public List<Items> getItemsBySeller(int sr_id, int startRow, int rowPerPage) {
		 Map<String, Object> param = new HashMap<>();
		    param.put("sr_id", sr_id);
		    param.put("startRow", startRow);
		    param.put("rowPerPage", rowPerPage);
		return sm.getItemsBySeller(param);
	}
	@Override
	public int countSeller() {
		return sm.countSeller();
	}
	@Override
	public List<Seller> sellerListbySr_id(int offset, int rowPerPage) {
		Map<String, Object> map = new HashMap<>();
		map.put("offset", offset);
		map.put("rowPerPage", rowPerPage);
		return sm.sellerListbySr_id(map);
	}
	@Override
	public List<Sale> saleJoinList(int offset, int rowPerPage) {
		Map<String, Object> map = new HashMap<>();
		map.put("offset", offset);
		map.put("rowPerPage", rowPerPage);
		return sm.saleJoinList(map);
	}
}
