package com.green.Lupang.service;

import java.util.List;

import com.green.Lupang.dto.User;

public interface UserService {

	User select(String u_id);

	int insert(User user);

	void insertPhoto(List<User> photo);

	User u_id(String id);

	int update(User user);

	void updateSr_id(User user);

	int delete(String u_id);

	void updateSRoleWait(String u_id);
	
	void updateSellerRole_Y(String u_id);

	void updateSellerRole_N(String u_id);

	List<User> user_list(int startRow, int rowPerPage);

	int updateDel(User user);

	int countAllUser();

	String selectId(User user);
}
