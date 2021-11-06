package com.work.wecamp.camplike.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import com.work.wecamp.camp.dto.Campsite;
import com.work.wecamp.camplike.dto.CamplikeDto;
import com.work.wecamp.camplike.service.CamplikeService;
import com.work.wecamp.member.config.auth.PrincipalDetails;
import com.work.wecamp.member.model.Member;
import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
public class CamplikeController<Campsite> {
	@Autowired
	private CamplikeService camplikeService;
	
	/**
	 * 좋아요 누르기
	 * @param model
	 * @param dto
	 * @param principalDetails
	 * @return
	 */
	@GetMapping("/like")
	public String like(Model model, CamplikeDto dto,  @AuthenticationPrincipal PrincipalDetails principalDetails) {
		camplikeService.like(dto);
		String campsiteno = dto.getCampsiteNo();
		return "redirect:/camp/detail?campsiteNo=" + campsiteno;
		
	}
	
	/**
	 * 좋아요 삭제
	 * @param model
	 * @param dto
	 * @param principalDetails
	 * @return
	 */
	@GetMapping("/dislike")
	public String dislike(Model model, CamplikeDto dto,  @AuthenticationPrincipal PrincipalDetails principalDetails) {
		Member mdto = principalDetails.getMember();
		model.addAttribute("dto", dto);
		int member_no = mdto.getMember_no();
		String campsite_no = dto.getCampsiteNo();
		camplikeService.dislike(campsite_no, member_no);
		String campsiteno = dto.getCampsiteNo();
		
		return "redirect:/camp/detail?campsiteNo=" + campsiteno;
		
	}
	
	
	
	
}
