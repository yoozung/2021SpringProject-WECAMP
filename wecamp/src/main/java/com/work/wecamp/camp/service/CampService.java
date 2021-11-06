package com.work.wecamp.camp.service;

import java.util.List;
import java.util.Map;

import com.work.wecamp.camp.dto.Campsite;
import com.work.wecamp.review.dto.ReviewDto;

public interface CampService {
	
	/*캠핑장 데이터 삽입*/
	public int insertCampsite();
	
	/*도 데이터 조회*/
	public List<Map<String,String>> selectDoNm();
	
	/*시군구 데이터 조회*/
	public List<Map<String,String>> selectSigungu(String doNm);
	

	/*시군구 캠핑장 데이터 수*/
	public int doSiTotalCount(String sigungu);
	
	/*캠핑장 총 데이터 수 */
	public int totalCount(Map<String,Object> doSi);
	
	/*캠핑장 전체 데이터 페이징 처리 */
	public List<Map<String,Campsite>> selectCampsiteAll(Map<String,Object> doSi);

	/*캠핑장 상세 조회 */
	public Campsite selectOne(int campsiteNo);

	public List<Campsite> selectMain(String induty);

	


}
