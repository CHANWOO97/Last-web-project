package com.green.Lupang.service;

import java.util.List;

import com.green.Lupang.dto.Items;

public interface EventService {
	List<Items> getEventItems();

	boolean hasAlreadyPlayed(String userId);

	Items pickRandomPrize();

	void saveResult(String userId, String i_id);
}
