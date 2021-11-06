package com.work.wecamp.board.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.data.web.PageableDefault;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;

import com.work.wecamp.board.service.BoardService;


@Controller
public class BoardController {
   
   
   
   //컨트롤러에서 세션찾는방법
   //@AuthenticationPrincipal PrincipalDetails principal
   @Autowired
   private BoardService boardService;
   
   @GetMapping("/board")
   public String index(Model model, @PageableDefault(size=3, sort="createDate", direction=Sort.Direction.DESC)Pageable pageable) {
      model.addAttribute("boards", boardService.view(pageable));
      //model.addAttribute("count", boardService.updateCount(id));
      return "board/index"; // viewResolver 작동
   }
   
   
   // Member 로그인할시 사용가능
   @GetMapping("/board/saveForm")
   public String saveForm() {
      return "board/saveForm";
   }
   
   @GetMapping("/board/{id}")
   public String findById(@PathVariable int id, Model model) {
      System.out.println("detail 요청시 조회수:"+ boardService.updateCount(id));
      model.addAttribute("board", boardService.detail(id));
      return "board/detail";
   }
   
   @GetMapping("/board/{id}/updateForm")
   public String updateForm(@PathVariable int id, Model model) {
      System.out.println("요청");
      model.addAttribute("board", boardService.detail(id));
      return "board/updateForm";
   }
   
   
   
   

}