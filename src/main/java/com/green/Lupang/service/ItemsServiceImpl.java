package com.green.Lupang.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.green.Lupang.dto.ItemsCategory;
import com.green.Lupang.mapper.ItemsMapper;

@Service
public class ItemsServiceImpl implements ItemsService{
	@Autowired
	private ItemsMapper im;
	@Override
	public List<ItemsCategory> ic_list() {
		return im.ic_list();
	}
}
