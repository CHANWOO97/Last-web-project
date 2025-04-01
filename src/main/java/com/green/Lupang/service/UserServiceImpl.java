package com.green.Lupang.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.green.Lupang.dto.User;
import com.green.Lupang.mapper.UserMapper;

@Service
public class UserServiceImpl implements UserService{
	@Autowired
	private UserMapper um;

	@Override
	public User select(String u_id) {
		return um.select(u_id);
	}

	@Override
	public int insert(User user) {
	
		return um.insert(user);
	}

	@Override
	public void insertPhoto(List<User> photo) {
		um.insertPhoto(photo);
	}

}
