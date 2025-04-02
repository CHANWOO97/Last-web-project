package com.green.Lupang.mapper;

import java.util.List;
import org.apache.ibatis.annotations.Mapper;
import com.green.Lupang.dto.ItemsCategory;

@Mapper
public interface ItemsMapper {
	List<ItemsCategory> ic_list();
}
