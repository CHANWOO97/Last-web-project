package com.green.Lupang.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.green.Lupang.mapper.SellerMapper;

@Service
public class SellerServiceImpl implements SellerService{
	@Autowired
	private SellerMapper sm;
}
