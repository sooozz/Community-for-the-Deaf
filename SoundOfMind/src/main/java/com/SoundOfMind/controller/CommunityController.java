package com.SoundOfMind.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

import com.SoundOfMind.domain.Chatting;
import com.SoundOfMind.domain.Member;
import com.SoundOfMind.mapper.ChattingMapper;

@Controller
public class CommunityController {

	@Autowired
	private ChattingMapper Cmapper;

	@GetMapping("/community.do")
	public String community() {
		return "community";
	}

	@GetMapping("/chatting.do")
	public String chatting(HttpSession session) {
		Member member = (Member) session.getAttribute("user");
		if (member != null) {
			String id = member.getId();
//			채팅방목록
			List<Chatting> chatlist = Cmapper.chatlist(id);
			session.setAttribute("chatlist", chatlist);
		}
		return "chatting";
	}
}
