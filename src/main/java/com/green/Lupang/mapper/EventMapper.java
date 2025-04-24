package com.green.Lupang.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import com.green.Lupang.dto.Items;

@Mapper
public interface EventMapper {

	List<Items> getEventItems();

	int countByUserId(String userId);

	List<Items> findItemsByCategory(String string);

	void insertResult(@Param("userId") String userId, @Param("i_id") String i_id);

}
