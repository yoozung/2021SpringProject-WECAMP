package com.work.wecamp.review.dao;

import java.util.List;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import com.work.wecamp.review.dto.ReviewDto;

@Mapper
public interface ReviewDao {
	
	/** 리뷰 등록 */
	@Insert("insert into review values(review_no.nextval, #{campsiteNo}, #{memberNo}, #{content}, #{createDate}, #{starRating}, #{fclRating}, #{envRating}, #{serviceRating})")
	public int insertReview(ReviewDto dto);

	/** 캠핑장별 리뷰조회 */
	@Select("select a.username, b.* FROM member a, review b where a.member_no = b.member_no and b.campsite_no =#{campsiteNo}")
	public List<ReviewDto> reviewList(int campsiteNo);
	
	/** 본인이 작성한 리뷰조회 */
	/**	1. 마이페이지 - 본인이 쓴 후기조회 : 회원번호로 가져오기
	이 쿼리문으로 수정하기 --> select a.username, b.* from member a, review b where a.member_no = b.member_no;*/
	@Select("select a.faclt_nm, b.* from campsite a, review b where a.campsite_no = b.campsite_no and b.member_no= #{member_no} order by b.review_no desc")
	public List<ReviewDto> r(int member_no);

	/** 리뷰상세 */
	@Select("SELECT * FROM review WHERE review_no=#{reviewNo}")
	public ReviewDto reviewDetail(String reviewNo);
	
	/** 리뷰수정 */
	@Update("UPDATE review SET fcl_rating = #{dto.fclRating}, content = #{dto.content}, star_rating = #{dto.starRating}, env_rating = #{dto.envRating}, service_rating = #{dto.serviceRating} WHERE review_no = #{dto.reviewNo}")
	public int updateReview(ReviewDto dto, String reviewNo);

	/** 리뷰삭제 */
	@Delete("DELETE FROM review WHERE review_no=#{reviewNo}")
	public void deleteReview(String reviewNo);

	 @Select("SELECT COUNT(*) FROM review WHERE campsite_no = #{campsiteNo}")
	   public int reviewCount(int campsiteNo);
	 
	 @Select("SELECT TRUNC(avg(star_rating),2) FROM review where campsite_no =#{campsiteNo}")
     public String star(int campsiteNo);

     @Select("SELECT TRUNC(avg(fcl_rating),2) FROM review where campsite_no =#{campsiteNo}")
     public String fcl(int campsiteNo);

     @Select("SELECT TRUNC(avg(env_rating),2) FROM review where campsite_no =#{campsiteNo}")
     public String env(int campsiteNo);

     @Select("SELECT TRUNC(avg(service_rating),2) FROM review where campsite_no =#{campsiteNo}")
     public String ser(int campsiteNo);
	 
}
