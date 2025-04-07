package com.green.Lupang.service;

import java.util.List;

import com.green.Lupang.dto.User;

public interface UserService {

	User select(String u_id);

	int insert(User user);

	void insertPhoto(List<User> photo);

	User u_id(String id);

	int update(User user);

}
