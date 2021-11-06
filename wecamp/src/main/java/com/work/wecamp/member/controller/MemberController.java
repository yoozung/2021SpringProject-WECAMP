package com.work.wecamp.member.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.data.web.PageableDefault;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.work.wecamp.board.repository.BoardRepository;
import com.work.wecamp.board.service.BoardService;
import com.work.wecamp.camplike.service.CamplikeService;
import com.work.wecamp.member.config.auth.PrincipalDetails;
import com.work.wecamp.member.model.Member;
import com.work.wecamp.member.repository.MemberRepository;
import com.work.wecamp.member.service.MemberService;
import com.work.wecamp.review.dto.ReviewDto;
import com.work.wecamp.review.service.ReviewService;

@Controller
public class MemberController {
   
   @Autowired
   public MemberService memberservice;
   
   @Autowired
   private ReviewService reviewService;
   
   @Autowired
   private CamplikeService camplikeService;
   
   @Autowired
   private BoardService boardService;
   
   @Autowired
   private BoardRepository boardRepository;
   
   
   @Autowired
   private MemberRepository memberRepository;
   
   @Autowired
   private BCryptPasswordEncoder bCryptPasswordEncoder;
   
   /** 메인화면 */
   @GetMapping({"", "/"})
   public String main(@AuthenticationPrincipal PrincipalDetails principalDetails, Model model) {
      
      if(principalDetails != null) {
         Member dto = principalDetails.getMember();
         model.addAttribute("username",dto.getUsername());
         
      }

      return "/main"; 
   }
   
   @GetMapping("/loginFail")
   public String loginFail(@AuthenticationPrincipal PrincipalDetails principalDetails, Model model) {
      return "loginFail"; 
   }
   
   @GetMapping("/guide")
   public String guide() {
      return "guide";
   }
   
   @GetMapping("/joinForm")
   public String joinForm() {
      return "joinForm";
   }
   
   
   @GetMapping("/member/deleteForm")
   public String deleteForm(@AuthenticationPrincipal PrincipalDetails principalDetails, Model model) {
      Member dto = principalDetails.getMember();
      model.addAttribute("memberId",dto.getMemberId());
      model.addAttribute("memberPw",dto.getMemberPw());
      return "member/deleteForm";
   }
   
   @GetMapping("/member/myInfo")
   public String myInfo(@AuthenticationPrincipal PrincipalDetails principalDetails, Model model) {
      Member dto = principalDetails.getMember();
      model.addAttribute("username",dto.getUsername());
      return "member/myInfo";
   }
   
   
   @PostMapping("/delete")
   public String delete(@RequestParam(value = "memberPw") String memberPw, @AuthenticationPrincipal PrincipalDetails principalDetails, Model model) {
      Member dto = principalDetails.getMember();
      
      if(bCryptPasswordEncoder.matches(memberPw, dto.getMemberPw())) {
         memberRepository.delete(dto);
      } else {
         
      }return "/main";
   }
   
   @PostMapping("/join")
   public String join(Member member) {
      System.out.println(member);
      //암호화
      String rawPassword = member.getMemberPw();
      String encPassword = bCryptPasswordEncoder.encode(rawPassword);
      member.setMemberPw(encPassword);
      memberRepository.save(member);
      return "main";
   }
   
   @PostMapping("/myInfoUpdate")
   public String myInfoUpdate(@RequestParam(value = "memberPw") String memberPw, @RequestParam(value = "username") String username, @RequestParam(value = "email") String email, @RequestParam(value = "mobile") String mobile, @AuthenticationPrincipal PrincipalDetails principalDetails, Model model) {
      Member dto = principalDetails.getMember();
      
      String encPassword = bCryptPasswordEncoder.encode(memberPw);
      dto.setMemberPw(encPassword);
      dto.setUsername(username);
      dto.setEmail(email);
      dto.setMobile(mobile);
      memberRepository.save(dto);
      
      return "main"; 
   }
   
   @GetMapping("/member/login")
   public String login(@AuthenticationPrincipal PrincipalDetails principalDetails, Model model) {
      Member dto = principalDetails.getMember();
      model.addAttribute("username",dto.getUsername());
      return "member/login";
   }
   
   @GetMapping("/member/myInfoUpdate")
   public String doGet(@AuthenticationPrincipal PrincipalDetails principalDetails, Model model) {
      
      Member dto = principalDetails.getMember();
      model.addAttribute("memberId",dto.getMemberId());
      model.addAttribute("username",dto.getUsername());
      model.addAttribute("email",dto.getEmail());
      model.addAttribute("mobile",dto.getMobile());
      return "member/myInfoUpdate";
   
   }
   
   /** 아이디 중복 체크 */
   @RequestMapping(value = "/memberIdChk", method = RequestMethod.POST)
   @ResponseBody
   public String memberIdChkPOST(String memberId) throws Exception{
            
      String result = memberservice.idCheck(memberId);
            
      if(result != null) {
         return "fail";   // 중복 아이디가 존재
      } else {
         return "success";   // 중복 아이디 x
      }            
   } 
   
   @GetMapping("/member/reviewList")
   public String list(Model model, @AuthenticationPrincipal PrincipalDetails principalDetails) {
      Member dto = principalDetails.getMember();
      int member_no = dto.getMember_no();
      List<ReviewDto> list = reviewService.r(member_no);
      model.addAttribute("list", list);
      return "/member/reviewList";
   }
   
   /**
    *  
    * @param principalDetails
    * @return
    */
   @GetMapping("/member/mylike")
   public String mylike(Model model, @AuthenticationPrincipal PrincipalDetails principalDetails) {
      Member mdto = principalDetails.getMember();
      int member_no = mdto.getMember_no();
      List<com.work.wecamp.camp.dto.Campsite> campList = camplikeService.mylike(member_no);
      model.addAttribute("campList", campList);
      return "member/mylike-list";
      
   }
   
   @GetMapping("/member/myboardList")
   public String myboardList(@AuthenticationPrincipal PrincipalDetails principalDetails, Model model, @PageableDefault(size=3, sort="createDate", direction=Sort.Direction.DESC)Pageable pageable) {
      Member dto = principalDetails.getMember();
      model.addAttribute("username",dto.getUsername());
      model.addAttribute("boards", boardService.view(pageable));
      return "member/myboardList"; 
   }
   
}