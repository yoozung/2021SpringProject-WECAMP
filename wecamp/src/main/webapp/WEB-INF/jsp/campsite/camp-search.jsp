<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>캠핑장조회</title>
	<link rel="stylesheet" href="/css/camp/campSearch.css" />
	<link rel="stylesheet" href="/css/camp/campToggle.css" />
	<link rel="stylesheet" href="/css/header.css"> 
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta2/css/all.min.css" integrity="sha512-YWzhKL2whUzgiheMoBFwW8CKV4qpHQAEuvilg9FAn5VJUDwKZZxkJNuGM4XkWuk94WCrrwslk8yWNGmY1EduTA==" crossorigin="anonymous" referrerpolicy="no-referrer" />
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css" integrity="sha384-zCbKRCUGaJDkqS1kPbPd7TveP5iyJE0EjAuZQTgFLD2ylzuqKfdKlfG/eSrtxUkn" crossorigin="anonymous">
	    <link rel="shortcut icon" href="/img/favicon.png">
	<link rel="icon" href="/img/favicon.png">

</head>
<body>
		<jsp:include page="../inc/header.jsp"></jsp:include>
		<!-- 시멘틱 태그 -->
		<main id="main">
			
			<!-- 화면에 보여질 태그 -->
			<div class="inner">
			
			<!-- 검색조건 컨테이너 -->
				<div id="camp-container">
				
					<!-- 검색어 박스  
					<div class="search-container">
					    <div class="search-box">
					        <input class="search-txt" type="text" name="" placeholder="Search">
					        <a class="search-btn" href="#">
					            <i class="fas fa-search"></i>
					        </a>
					    </div>
					</div>
					-->
					
					<!-- 접었다 펼치기 -->
					<div class="toggle-box">
						<button class="question" id="que-1">
							<span id="faq-title">지역검색</span>
							<span id="que-1-toggle">+</span>
						</button>
						
						<div class="faq-content">
						  <div class="answer" id="ans-1">
						  	<div class="t-box">
						  	<!-- 도이름 출력  -->
						  		<div class="do-box">
																		
						  		</div>
						  		<!-- 시군구 이름 출력 -->
						  		<div class="sigungu-box">
									
								</div>
							</div>
						  </div>
						</div>

					</div>
					
				 	<div class="toggle-box">
						<button class="question" id="que-2">
						<span id="faq-title">고급검색</span>
						<span id="que-2-toggle">+</span></button>
						<div class="faq-content">
						  <div class="answer" id="ans-2">
						  		<div class="option-box" id="option-box">
						  			
						  			<!-- 캠핑장 유형별 선택 -->
						  			<div class="camp-option">
						  				<span class="option-label">캠핑장 유형별 </span>
						
						  				
						  				<div class="camp-type-box">
						  					<label><input type="checkbox" name="camp-type" value="일반야영장"/>일반야영장</label>
						  					<label><input type="checkbox" name="camp-type" value="자동차야영장"/>자동차야영장</label>
						  					<label><input type="checkbox" name="camp-type" value="글램핑"/>글램핑</label>
						  					<label><input type="checkbox" name="camp-type" value="카라반"/>카라반</label>
						  				</div>
						  			</div>
						  			
						  			<!-- 캠핑장 유형별 선택 -->
						  			<div class="camp-option">
						  				<span class="option-label">입지별</span>
						  				
						  				<div class="camp-type-box">
						  					<label><input type="checkbox" name="camp-lct" value="해변"/>해변</label>
						  					<label><input type="checkbox" name="camp-lct" value="섬"/>섬</label>
						  					<label><input type="checkbox" name="camp-lct" value="산"/>산</label>
						  					<label><input type="checkbox" name="camp-lct" value="숲"/>숲</label>
						  					<label><input type="checkbox" name="camp-lct" value="계곡"/>계곡</label>
						  					<label><input type="checkbox" name="camp-lct" value="강"/>강</label>
						  					<label><input type="checkbox" name="camp-lct" value="호수"/>호수</label>
						  				</div>
						  			</div>
						  			
						  			<!-- 캠핑장 부대시설 선택 -->
						  			<div class="camp-option">
						  				<span class="option-label">부대시설별</span>
						  				
						  				<div class="camp-type-box">
						  					<label><input type="checkbox" name="camp-sbrs" value="전기"/>전기</label>
						  					<label><input type="checkbox" name="camp-sbrs" value="물놀이장"/>물놀이장</label>
						  					<label><input type="checkbox" name="camp-sbrs" value="온수"/>온수</label>
						  					<label><input type="checkbox" name="camp-sbrs" value="장작판매"/>장작판매</label>
						  					<label><input type="checkbox" name="camp-sbrs" value="마트.편의점"/>마트</label>
						  					<label><input type="checkbox" name="camp-sbrs" value="놀이터"/>놀이터</label>
						  				</div>
						  			</div>
						  			
						  			<!-- 캠핑장 테마별 선택 -->
						  			<div class="camp-option">
						  				<span class="option-label">테마별</span>
						  				<div class="camp-type-box">
						  					<label><input type="checkbox" name="camp-thema" value="일출명소"/>일출명소</label>
						  					<label><input type="checkbox" name="camp-thema" value="일몰명소"/>일몰명소</label>
						  					<label><input type="checkbox" name="camp-thema" value="가을단풍명소"/>가을단풍명소</label>
						  					<label><input type="checkbox" name="camp-thema" value="겨울눈꽃명소"/>겨울눈꽃명소</label>
						  					<label><input type="checkbox" name="camp-thema" value="걷기길"/>걷기길</label>
						  					<label><input type="checkbox" name="camp-thema" value="여름물놀이"/>여름물놀이</label>
						  					<label><input type="checkbox" name="camp-thema" value="봄꽃여행"/>봄꽃여행</label>
						  				</div>
						  			</div>
						  			
						  			<!-- 캠핑장 기타 -->
						  			<div class="camp-option">
						  				<span class="option-label">기타</span>
						  				<div class="camp-type-box">
						  					<label><input type="checkbox" name="camp-etc" value="가능"/>애완동물출입가능</label>
						  				</div>
						  			</div>

									
									<div class="camp-option" id="t-camp-search-box">
										<button id="camp-search-btn">검색</button>
									</div>
						  		</div>
						  </div>
						</div>
					</div>
					
				</div>
				
				<!-- 캠핑장 목록 출력  -->
				<div id="camp-list-container">
					
				</div>
			</div>
			<jsp:include page="../inc/footer.jsp"></jsp:include>
		</main>
		<a href="#" class="scrollToTop"></a>
	<input type="hidden" value="${induty}" id="induty"/>
	<div class="loadingBox" style="display : none">
		<div class="dim"></div>
		<div class="circle"></div>
	</div>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/axios/0.19.0/axios.min.js"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.29.1/moment.min.js" integrity="sha512-qTXRIMyZIFb8iQcfjXWCO8+M5Tbc38Qi5WzdPOYZHIlZpzBHG3L3by84BBBOiRGiEb7KKtAOAs5qYdUiZiQNNQ==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
	<script src="/js/campSearch.js"></script>
	<script src="/js/campToggle.js"></script>
	<script src="/js/paging.js"></script>
	<style>
		 .t-modal{
		 	height : 540px;
		 }
		 .t-navbar{
		 	margin-bottom : 50px;
		 }
		 #t-camp-search-box{
			border-style: none !important;
			text-align: center;
		}
		 
	</style>
</body>
</html>