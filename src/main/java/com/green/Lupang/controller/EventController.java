package com.green.Lupang.controller;

import java.util.Arrays;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.green.Lupang.dto.Items;
import com.green.Lupang.service.EventService;
import com.green.Lupang.service.ItemsService;

import jakarta.servlet.http.HttpSession;

@Controller
public class EventController {
	@Autowired
	private EventService es;
	
//	@GetMapping("/event/roulette")
//	public String showRoulettePage(Model model) {
//        // DB에서 ic_id='event'인 상품만 불러오기
//        List<Items> eventItems = es.getEventItems();        
//        int total = eventItems.size();
//        double deg = 360.0 / total;
//        model.addAttribute("eventItems", eventItems);
//        model.addAttribute("total", total);
//        model.addAttribute("deg", deg);        
//        return "event/roulette"; // → /WEB-INF/views/event/roulette.jsp
//    }
	// 룰렛 페이지 출력 (상품 리스트 X, 그냥 정적 이미지로 보여줌)
    @GetMapping("/event/roulette")
    public String showRoulettePage() {
        return "event/roulette";
    }
	
    // 룰렛 회전 Ajax 요청 처리
    @PostMapping(value = "event/spin", produces = "application/json;charset=utf-8")
    @ResponseBody
    public Map<String, Object> spinRoulette(HttpSession session) {
        Map<String, Object> result = new HashMap<>();
        String userId = (String) session.getAttribute("id");

        // 로그인 여부 확인
        if (userId == null) {
            result.put("success", false);
            result.put("message", "로그인이 필요합니다.");
            return result;
        }

        // 계정당 1회 제한 확인
        if (es.hasAlreadyPlayed(userId)) {
            result.put("success", false);
            result.put("message", "이미 참여하셨습니다.");
            return result;
        }

        // 이벤트 상품 중 하나 랜덤 추첨
        Items prize = es.pickRandomPrize();

        // 결과 저장
        es.saveResult(userId, prize.getI_id());

        result.put("success", true);
        result.put("itemName", prize.getName());
        result.put("photo", prize.getPhoto());
        return result;
    }
}
