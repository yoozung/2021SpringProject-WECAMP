package com.work.wecamp.camp.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.json.simple.parser.ParseException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.work.wecamp.camp.dto.Campsite;
import com.work.wecamp.camp.service.CampService;
import com.work.wecamp.camplike.dto.CamplikeDto;
import com.work.wecamp.camplike.service.CamplikeService;
import com.work.wecamp.member.config.auth.PrincipalDetails;
import com.work.wecamp.member.model.Member;
import com.work.wecamp.review.dto.ReviewDto;
import com.work.wecamp.review.service.ReviewService;
import com.work.wecamp.util.PagingUtil;

import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
@RequestMapping("/camp")
public class CampController {
	@Autowired
	CampService campService;
	
	@Autowired
	private ReviewService reviewService;
	
	@Autowired
	private CamplikeService camplikeService;
	
	/*데이터 삽입*/
	@GetMapping("/request")
	public String requestApi(Model model,Campsite campsite) {
		
		int result = campService.insertCampsite();
		model.addAttribute("insertResult",result);
		
		return "/index";
	}
	
	/* 캠핑장 검색 첫 페이지 */
	@GetMapping(value={"/camplist","/camplist/{induty}"})
	public String getCampList(Model model,@PathVariable(required = false) String induty) {
		
		log.debug("enter getdoNm");
		
		model.addAttribute("induty",induty);
		
		return "campsite/camp-search";
	}
	
	/*도 이름 출력*/
	//조각페이지
	@PostMapping("/donm")
	public String getDoNm(Model model) {

		List<Map<String,String>> doNmList = campService.selectDoNm();
		model.addAttribute("doNms",doNmList);
		return "inc/camp-donm";
	}
	
	/*시군구 이름 출력*/
	@PostMapping("/sigungu")
	public String getSigungu(@RequestParam String doNm,Model model) {
	
		log.debug("enter getSigungu");
		
		List<Map<String,String>> sigunguList = campService.selectSigungu(doNm);
		model.addAttribute("sigungu",sigunguList);
		
		return "inc/camp-sigungu";
	}
	
	
	/* 캠핑장 모든 데이터 출력*/
	/*시군구*/
	@PostMapping("/all")
	public String getCampsiteAll(@RequestBody Map<String,Object> doSi,Model model) throws ParseException{
		log.debug("enter All Select");
		int totalCount = 0;
		
		if(doSi.get("advValue") != null) {
			
			
	        JSONParser jp = new JSONParser();
	        
	        
	        if(doSi.get("advValue") != "") {
		        JSONObject test = (JSONObject) jp.parse((String) doSi.get("advValue"));
				
				//HashMap<String, Object> test = (HashMap<String, Object>) doSi.get("advValue");
				
				if(test != null) {
					List<String> campThema = (List<String>) test.get("campThema");
					List<String> campType = (List<String>) test.get("campType");
					List<String> campLct = (List<String>) test.get("campLct");
					List<String> campEtc = (List<String>) test.get("campEtc");
					List<String> campSbrs = (List<String>) test.get("campSbrs");
					
					if(!campThema.isEmpty()) {
						doSi.put("campThema", campThema); 
					}
					if(!campType.isEmpty()) {
						doSi.put("campType", campType);
					}
					if(!campLct.isEmpty()) {
						doSi.put("campLct",campLct);
					}
					if(!campEtc.isEmpty()) {
						doSi.put("campEtc", campEtc);
					}
					if(!campSbrs.isEmpty()) {
						doSi.put("campSbrs",campSbrs);
					}
				}
	        }
			
		}
		
		totalCount = campService.totalCount(doSi);
		
		
		
		
		HashMap<String,Integer> pagingMap = 
					PagingUtil.ready(String.valueOf(doSi.get("page")),totalCount);
		
		
		doSi.put("startCount", String.valueOf(pagingMap.get("startCount")));
		doSi.put("endCount", String.valueOf(pagingMap.get("endCount")));
		
	
		List<Map<String, Campsite>> campList = 
				campService
					.selectCampsiteAll 
					(doSi);
		
		
		model.addAttribute("campList",campList);
		model.addAttribute("paging",pagingMap);
		
		return "inc/camp-search-list";
	}
/*-------------------------------------------------------------------------------*/

	
	   /* 캠핑장 상세조회 */
	   @GetMapping("/detail")
	   public String deatilCampsite(@RequestParam int campsiteNo, Model model,  @AuthenticationPrincipal PrincipalDetails principalDetails) {
	      log.debug("enter deatil Campsite");
	      
	      // 캠핑장 정보 가져오기
	      Campsite campsite = campService.selectOne(campsiteNo);
	      System.out.println("출력 : " + campsite.toString());
	      model.addAttribute("campsite",campsite);
	      
	      // 캠핑장에 대한 좋아요 수 가져오기
	      int likesize =  camplikeService.likesize(campsiteNo);
	      model.addAttribute("likesize", likesize);
	      System.out.println("~~~~~좋아요개수 확인: " + likesize);
	      
	      
	      // 회원 가져오기
	      if(principalDetails != null) {
	      Member dto = principalDetails.getMember();
	      model.addAttribute("dto", dto);
	      int member_no = dto.getMember_no();
	      System.out.println("@@@@@@좋아요기능 회원번호" + member_no);
	      
	         // 좋아요 가져오기
	         String str = Integer.toString(member_no);
	         System.out.println("※※※※※※※※※※※회원번호를 문자열로" + str);
	         
	         if (str !=  null) {
	            List<CamplikeDto> like = camplikeService.getlike(member_no, campsiteNo);
	            model.addAttribute("like", like);
	            System.out.println(" ##### 좋아요 담아오기  " + like);
	            
	            List<ReviewDto> list = reviewService.reviewList(campsiteNo);
	            model.addAttribute("list", list);
	            
	             int reviewCount = reviewService.reviewCount(campsiteNo);
	               model.addAttribute("reviewCount", reviewCount);
	            
	               
	               
	            System.out.println("-----------------------------------------------------list : " + list);
	            if (reviewCount != 0) {
	                  String star = reviewService.star(campsiteNo);
	                 String fcl = reviewService.fcl(campsiteNo);
	                 String env = reviewService.env(campsiteNo);
	                 String ser = reviewService.ser(campsiteNo);
	                  model.addAttribute("star", star);
	                  model.addAttribute("fcl", fcl);
	                  model.addAttribute("env", env);
	                  model.addAttribute("ser", ser);
	              }
	            
	            return "campsite/campsite-detail";
	            } 
	         }
	      
	      
	      // 리뷰 가져오기
	      List<ReviewDto> list = reviewService.reviewList(campsiteNo);
	      model.addAttribute("list", list);
	      
	       int reviewCount = reviewService.reviewCount(campsiteNo);
	        model.addAttribute("reviewCount", reviewCount);
	      
	        if (reviewCount != 0) {
	           String star = reviewService.star(campsiteNo);
	           String fcl = reviewService.fcl(campsiteNo);
	           String env = reviewService.env(campsiteNo);
	           String ser = reviewService.ser(campsiteNo);
	            model.addAttribute("star", star);
	            model.addAttribute("fcl", fcl);
	            model.addAttribute("env", env);
	            model.addAttribute("ser", ser);

	        }
	        
	          
	      System.out.println("-----------------------------------------------------list : " + list);
	      System.out.println("-----------------------------------------------------reviewCount : " + reviewCount);
	      
	      return "campsite/campsite-detail";
	   }
	   
	
	
	
	
	
	
	
	
	
	
	
}
