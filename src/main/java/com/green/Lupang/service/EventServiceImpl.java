package com.green.Lupang.service;

import java.util.ArrayList;
import java.util.List;
import java.util.Random;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.green.Lupang.dto.Items;
import com.green.Lupang.mapper.EventMapper;

@Service
public class EventServiceImpl implements EventService{
	@Autowired
	private EventMapper em;
	
	@Override
	public List<Items> getEventItems() {
		return em.getEventItems();
	}

	@Override // 중복체크
	public boolean hasAlreadyPlayed(String userId) {
		return em.countByUserId(userId) > 0;
	}

	@Override
	public Items pickRandomPrize() {
		List<Items> prizes = em.getEventItems(); // ic_id='event'
	    int random = new Random().nextInt(prizes.size());	    
	    return prizes.get(random);
    }

	@Override
	public void saveResult(String userId, String i_id) {
		em.insertResult(userId, i_id);
	}
}
