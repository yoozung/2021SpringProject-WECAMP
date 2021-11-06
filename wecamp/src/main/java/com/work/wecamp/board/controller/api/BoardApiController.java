package com.work.wecamp.board.controller.api;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RestController;

import com.work.wecamp.board.model.Board;
import com.work.wecamp.board.model.Reply;
import com.work.wecamp.board.service.BoardService;
import com.work.wecamp.dto.ResponseDto;
import com.work.wecamp.member.config.auth.PrincipalDetails;

@RestController
public class BoardApiController {
   
   @Autowired
   private BoardService boardService;

   @PostMapping("/api/board")
   public ResponseDto<Integer> save(@RequestBody Board board, @AuthenticationPrincipal PrincipalDetails principal) {
      boardService.write(board, principal.getMember());
      return new ResponseDto<Integer>(HttpStatus.OK.value(), 1); 
   }
    
   @DeleteMapping("/api/board/{id}")
   public ResponseDto<Integer> deleteById(@PathVariable int id) {
      boardService.delete(id);
      return new ResponseDto<Integer>(HttpStatus.OK.value(), 1);
   }
   
   @PutMapping("/api/board/{id}")
   public ResponseDto<Integer> update(@PathVariable int id, @RequestBody Board board){
      System.out.println("BoardApiController : update : id : "+id);
      System.out.println("BoardApiController : update : board : "+board.getTitle());
      System.out.println("BoardApiController : update : board : "+board.getContent());
      boardService.update(id, board);
      return new ResponseDto<Integer>(HttpStatus.OK.value(), 1);
   }
   
   //데이터 받을때 컨트롤러에서 dto를 만들어서 하는것이 좋다.
   @PostMapping("/api/board/{boardId}/reply")
   public ResponseDto <Integer> replySave (@PathVariable int boardId, @RequestBody Reply reply,  @AuthenticationPrincipal PrincipalDetails principal) {
      boardService.replyWrite(principal.getMember(), boardId, reply);
      return new ResponseDto<Integer>(HttpStatus.OK.value(), 1); 
   }
   
   
   @DeleteMapping("/api/board/{boardId}/reply/{replyId}")
   public ResponseDto<Integer> replyDelete(@PathVariable int replyId) {
      boardService.replyDelete(replyId);
      return new ResponseDto<Integer>(HttpStatus.OK.value(), 1); 
   }
   
   

}