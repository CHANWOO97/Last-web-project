package com.green.Lupang.mapper;

import java.util.List;
import org.apache.ibatis.annotations.Mapper;
import com.green.Lupang.dto.User;

@Mapper
public interface UserMapper {

	User select(String u_id);
	int insert(User user);
	void insertPhoto(List<User> photo);
	User u_id(String id);
	int update(User user);
	void updateSr_id(User user);
	int delete(String u_id);
	void updateSRoleWait(String u_id);
}
