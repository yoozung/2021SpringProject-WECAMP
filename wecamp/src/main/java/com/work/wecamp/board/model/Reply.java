package com.work.wecamp.board.model;


import java.sql.Timestamp;
import java.time.LocalDateTime;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.SequenceGenerator;

import org.hibernate.annotations.CreationTimestamp;

import com.work.wecamp.member.model.Member;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;


@Data
@NoArgsConstructor
@AllArgsConstructor
@Builder
@Entity
@SequenceGenerator(name = "REPLY_SEQ_GENERATOR", sequenceName = "REPLY_SEQ" , initialValue = 1, allocationSize = 1)
public class Reply {
   
   
   @Id //pk
   @GeneratedValue(strategy = GenerationType.SEQUENCE, generator = "REPLY_SEQ_GENERATOR")
   private int reply_no;
   
   private String content;
   
   @ManyToOne // many : reply, one : board
   @JoinColumn(name="board_no")
   private Board board;
   
   @ManyToOne // many : reply, one : member
   // 한명의 멤버는 여러개의 댓글
   @JoinColumn(name="member_no")
   private Member member;
   
   @CreationTimestamp
   private Timestamp createDate;

//   public void update(Member member, Board board, String content) {
//      setMember(member);
//      setBoard(board);
//      setContent(content);
//      
//   }

}