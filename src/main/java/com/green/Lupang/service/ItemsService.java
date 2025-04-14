package com.green.Lupang.service;

import java.util.List;

import com.green.Lupang.dto.Items;
import com.green.Lupang.dto.ItemsCategory;

public interface ItemsService {
	List<ItemsCategory> ic_list();
	List<Items> itemList(String ic_id, int offset, int pageSize);
	int itemCountByCategory(String ic_id);
	String ic_name(String ic_id);
	Items select(String i_id);
	List<Items> searchItemList(String keyword, int offset, int pageSize);
	int countSearchItems(String query);
	List<Items> findTopWishItems(int i);
	int insert(Items items);
	String getmaxi_id();
	int update(Items items);
	int delete(String i_id);
	void insertCategory(ItemsCategory itemsCategory);
	void deleteCategory(String ic_id);
}
