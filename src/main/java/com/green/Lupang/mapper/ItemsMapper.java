package com.green.Lupang.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.green.Lupang.dto.Items;
import com.green.Lupang.dto.ItemsCategory;

@Mapper
public interface ItemsMapper {
	List<ItemsCategory> ic_list();

	List<Items> itemList(Map<String, Object> map);

	int itemCountByCategory(String ic_id);

	String ic_name(String ic_id);

	Items select(String i_id);
}
