package com.work.wecamp.board.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.work.wecamp.board.model.Board;
import com.work.wecamp.board.model.Reply;
import com.work.wecamp.board.repository.BoardRepository;
import com.work.wecamp.board.repository.ReplyRepository;
import com.work.wecamp.member.model.Member;

@Service
public class BoardService {

   @Autowired
   private BoardRepository boardRepository;

   @Autowired
   private ReplyRepository replyRepository;

   @Transactional
   public void write(Board board, Member member) { // title, content
      board.setCount(0);
      board.setMember(member);
      boardRepository.save(board);
   }

   @Transactional(readOnly = true)
   public Page<Board> view(Pageable pageable) {
      // return boardRepository.findAll(PageRequest .of(0, 3)); //디폴트 페이지 , 한페이지 게시글수
      // pageable = PageRequest.of(0, 3);
      return boardRepository.findAll(pageable);
   }

   @Transactional(readOnly = true)
   public Board detail(int id) {
      return boardRepository.findById(id).orElseThrow(() -> {
         return new IllegalArgumentException("글 상세보기 실패 : 아이디를 찾을 수 없습니다.");
      });
   }

   @Transactional
   public void delete(int id) {
      boardRepository.deleteById(id);
   }

   @Transactional
   public void update(int id, Board requestBoard) {
      Board board = boardRepository.findById(id).orElseThrow(() -> {
         return new IllegalArgumentException("글 찾기 실패 : 아이디를 찾을 수 없습니다.");
      }); // 영속화 완료
      board.setTitle(requestBoard.getTitle());
      board.setContent(requestBoard.getContent());

   }

   @Transactional
   public void replyWrite(Member member, int boardId, Reply requestReply) {

      Board board = boardRepository.findById(boardId).orElseThrow(() -> {
         return new IllegalArgumentException("댓글 쓰기 실패 : 게시글 id를 찾을 수 없습니다.");
      });

      requestReply.setMember(member);
      requestReply.setBoard(board);

      replyRepository.save(requestReply);
   }

   @Transactional
   public void replyDelete(int replyId) {
      replyRepository.deleteById(replyId);

   }

   @Transactional
   public int updateCount(int id) {
      return boardRepository.updateCount(id);
      
   }

//   public List<Board> 글목록(){
//      return boardRepository.findAll();
//   }

}