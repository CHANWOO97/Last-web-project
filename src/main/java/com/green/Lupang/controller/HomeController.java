package com.green.Lupang.controller;

import java.util.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import com.green.Lupang.dto.ItemsCategory;
import com.green.Lupang.dto.WishList;
import com.green.Lupang.service.ItemsService;
import com.green.Lupang.service.WishListService;

import jakarta.servlet.http.HttpSession;

@Controller
public class HomeController {
	@Autowired
	private ItemsService is;
	@Autowired
	private WishListService wls;
	
	@GetMapping({"/", "/layout/home"})
	public String main(Model model, HttpSession session) {
		String id = (String)session.getAttribute("id");
		List<ItemsCategory> ic_list = is.ic_list();
		model.addAttribute("ic_list", ic_list);
		model.addAttribute("id", id);
		return "layout/home";
	}
	
	@PostMapping("/wishlist/toggle")
	@ResponseBody
	public Map<String, String> toggleWishlist(@RequestParam("i_id") String i_id, HttpSession session) {
	    String u_id = (String) session.getAttribute("id");
	    Map<String, String> result = new HashMap<>();
	    if (u_id == null) {
	        result.put("status", "unauthorized");
	        return result;
	    }

	    boolean exists = wls.exists(u_id, i_id);
	    if (exists) {
	    	wls.remove(u_id, i_id);
	        result.put("status", "removed");
	    } else {
	    	wls.add(u_id, i_id);
	        result.put("status", "added");
	    }
	    return result;
	}
	@PostMapping("/wishlist/remove")
	@ResponseBody
	public String wishlistDelete(@RequestParam("i_id") String i_id, HttpSession session){
		String u_id = (String) session.getAttribute("id");
		boolean exists = wls.exists(u_id, i_id);
		if (exists) {
	    	wls.remove(u_id, i_id);
	        return "success";
	    } else {
	    	return "failed";
	    }		
	}
	@GetMapping("/items/wishlist")
	public String wishlist(HttpSession session, Model model) {
	    String id = (String) session.getAttribute("id");
	    List<ItemsCategory> ic_list = is.ic_list();	
	    List<WishList> wishlist = wls.getWishlistByUserId(id);	    
	    model.addAttribute("wishlist", wishlist);
	    model.addAttribute("ic_list", ic_list);
	    return "items/wishlist";
	}
}
