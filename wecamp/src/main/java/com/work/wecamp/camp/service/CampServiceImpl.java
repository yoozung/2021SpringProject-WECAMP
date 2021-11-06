package com.work.wecamp.camp.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.work.wecamp.camp.dao.CampDao;
import com.work.wecamp.camp.dto.Campsite;
import com.work.wecamp.util.TestApiUtil;

import lombok.extern.slf4j.Slf4j;

@Service
@Slf4j
public class CampServiceImpl implements CampService {
	
	@Autowired
	private CampDao campDao;
	
	
	@Override
	public int insertCampsite() {
		
		int insertResult = 0;
		int result = 0;
		
		/*api 데이터 받아오기 */
		List<Campsite> campList = TestApiUtil.getCampList();
		
		for(int i=0; i < campList.size(); i++) {
			insertResult = campDao.insertCampsite(campList.get(i));
			
			if(insertResult != 1) {
				System.out.println("오류오류");
				result = 1;
				break;
			}
		}
		return result;
	}
	
	/*메인화면 버튼 클릭*/
	@Override
	public List<Campsite> selectMain(String induty) {
		List<Campsite> campList = campDao.selectMain(induty);
		return campList;
	}

	
	@Override
	public List<Map<String,String>> selectDoNm() {
		List<Map<String,String>> doNm = campDao.selectDoNm();
		return doNm;
	}

	@Override
	public List<Map<String, String>> selectSigungu(String doNm) {
		List<Map<String,String>> sigungu = campDao.selectSigungu(doNm);
		return sigungu;
	}


	@Override
	public int doSiTotalCount(String sigungu) {
		return campDao.doSiTotalCount(sigungu);
	}

	@Override
	public int totalCount(Map<String,Object> doSi) {
		return campDao.totalCount(doSi);
	}

	@Override
	public List<Map<String, Campsite>> selectCampsiteAll(Map<String, Object> doSi) {
		
		return campDao.selectCampsiteAll(doSi);
	}

	@Override
	public Campsite selectOne(int campsiteNo) {
		return campDao.selectOne(campsiteNo);
	}
	
	/*------------------------------------------------------------------------------*/
	
	
	
	
	
}
