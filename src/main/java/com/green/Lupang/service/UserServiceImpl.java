package com.green.Lupang.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

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

	@Override
	public User u_id(String id) {
		return um.u_id(id);
	}

	@Override
	public int update(User user) {
		return um.update(user);
	}

	@Override
	public void updateSr_id(User user) {
		um.updateSr_id(user);
	}

	@Override
	public int delete(String u_id) {
		return um.delete(u_id);
	}

	@Override
	public void updateSRoleWait(String u_id) {
		um.updateSRoleWait(u_id);
		
	}

	@Override
	public void updateSellerRole_Y(String u_id) {
		um.updateSellerRole_Y(u_id);
		
	}

	@Override
	public void updateSellerRole_N(String u_id) {
		um.updateSellerRole_N(u_id);
		
	}

}
