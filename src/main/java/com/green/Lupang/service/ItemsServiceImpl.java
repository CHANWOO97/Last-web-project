package com.green.Lupang.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.green.Lupang.mapper.ItemsMapper;

@Service
public class ItemsServiceImpl implements ItemsService{
	@Autowired
	private ItemsMapper im;
}
