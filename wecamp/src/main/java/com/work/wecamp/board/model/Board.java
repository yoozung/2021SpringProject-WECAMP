package com.work.wecamp.board.model;

import java.sql.Timestamp;
import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.Lob;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.OrderBy;
import javax.persistence.SequenceGenerator;

import org.hibernate.annotations.CreationTimestamp;

import com.fasterxml.jackson.annotation.JsonIgnoreProperties;
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
@SequenceGenerator(name = "BOARD_SEQ_GENERATOR", sequenceName = "BOARD_SEQ" , initialValue = 1, allocationSize = 1)
public class Board {

   
//   글번호 board_no(자동)
//   회원번호 member_no
//   제목 title     
//   파일 filename
//   내용 content
//   조회수 hit
//  작성자 이름 username
//   작성일 create_date(자동)
   @Id //pk
   @GeneratedValue(strategy = GenerationType.SEQUENCE, generator = "BOARD_SEQ_GENERATOR")
   private int board_no;
   
   private String title;
   
   @Lob
   private String content;
   
   
   
   private int count;
   
   @ManyToOne (fetch = FetchType.EAGER)//Many = Board, one =  Member, 연관 관계에 있는 Entity 들 모두 가져온다
   @JoinColumn(name="member_no")
   private Member member;

   
   
   //one = Board, Many = Reply
   @OneToMany(mappedBy = "board", fetch = FetchType.EAGER, cascade = CascadeType.REMOVE) // 연관관계의 주인이 아니다 = FK가 아니고, 컬럼 만들지 X.  mappedBy 뒤는 필드이름
   @OrderBy("id desc") //내림차순
   @JsonIgnoreProperties({"board"})
   private List<Reply> replys;
   
   
   @CreationTimestamp
   private Timestamp createDate;

}