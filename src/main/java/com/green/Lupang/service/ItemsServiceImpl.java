package com.green.Lupang.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.green.Lupang.dto.Items;
import com.green.Lupang.dto.ItemsCategory;
import com.green.Lupang.mapper.ItemsMapper;

@Service
public class ItemsServiceImpl implements ItemsService{
	@Autowired
	private ItemsMapper im;
	// Items Category 상품 카테고리 데이터 list로 가져오기
	public List<ItemsCategory> ic_list() {
		return im.ic_list(); 
	}
	@Override
	public String ic_name(String ic_id) {
		return im.ic_name(ic_id);
	}
	// Items 상품 데이터 카테고리 분류값으로 list로 가져오기
	public List<Items> itemList(String ic_id, int offset, int pageSize) {
		Map<String, Object> map = new HashMap<>();
		map.put("ic_id", ic_id);
		map.put("offset", offset);
		map.put("pageSize", pageSize);
		return im.itemList(map);
	}
	@Override
	public int itemCountByCategory(String ic_id) {
		return im.itemCountByCategory(ic_id);
	}
	@Override
	public Items select(String i_id) {
		return im.select(i_id);
	}
	@Override
	public List<Items> searchItemList(String keyword, int offset, int pageSize) {
		Map<String, Object> map = new HashMap<>();
		map.put("keyword", keyword);
		map.put("offset", offset);
		map.put("pageSize", pageSize);
		return im.searchItemList(map);
	}
	@Override
	public int countSearchItems(String query) {
		// TODO Auto-generated method stub
		return im.countSearchItems(query);
	}
	@Override
	public List<Items> findTopWishItems(int i) {
		return im.findTopWishItems(i);
	}
}
