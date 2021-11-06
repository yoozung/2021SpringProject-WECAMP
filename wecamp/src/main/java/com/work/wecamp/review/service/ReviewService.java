package com.work.wecamp.review.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.stereotype.Service;


import com.work.wecamp.review.dao.ReviewDao;
import com.work.wecamp.review.dto.ReviewDto;
import com.work.wecamp.util.Utility;

import lombok.extern.slf4j.Slf4j;

@Repository
@Service
@Slf4j
public class ReviewService implements ReviewDao {
	@Autowired
	private ReviewDao reviewDao;

	/** 리뷰등록 */
	@Override
	public int insertReview(ReviewDto dto) {
		// 별점 평균 계산
		dto.setStarRating((dto.getEnvRating() + dto.getFclRating() + dto.getServiceRating())/3);
		dto.setCreateDate(Utility.getCurrentDate());
		System.out.println(dto.getStarRating());
		
		int result = reviewDao.insertReview(dto);
		return result;
	}

	/** 캠핑장별 리뷰조회 */
	public List<ReviewDto> reviewList(int campsiteNo) {
		return reviewDao.reviewList(campsiteNo);
	}
	
	/** 리뷰조회 */
	@Override
	public List<ReviewDto> r(int member_no) {
		return reviewDao.r(member_no);
	}
	
	/** 리뷰상세 */
	public ReviewDto reviewDetail(String reviewNo) {
		return reviewDao.reviewDetail(reviewNo);
	}

	/** 리뷰수정 */
	public int updateReview(ReviewDto dto, String reviewNo) {
		dto.setStarRating((dto.getEnvRating() + dto.getFclRating() + dto.getServiceRating())/3);
		reviewDao.updateReview(dto, reviewNo);
		return 0;
	}

	/** 리뷰삭제 */
	public void deleteReview(String reviewNo) {
		reviewDao.deleteReview(reviewNo);
	}

/** 캠핑장별 리뷰수 가져오기 */
   public int reviewCount(int campsiteNo) {
      return reviewDao.reviewCount(campsiteNo);
   }
   
 /** 캠핑장별 별점 총점 평균 */
   public String star(int campsiteNo) {
      return reviewDao.star(campsiteNo);

   }

   public String fcl(int campsiteNo) {
      return reviewDao.fcl(campsiteNo);
   }

   public String env(int campsiteNo) {
      return reviewDao.env(campsiteNo);
   }

   public String ser(int campsiteNo) {
      return reviewDao.ser(campsiteNo);
   }


}
