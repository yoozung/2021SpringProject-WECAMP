<!-- member/myInfoUpdate -->
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link type="text/css" rel="stylesheet" href="/css/review/reviewWrite2.css">
<link type="text/css" rel="stylesheet" href="/css/review/reviewWrite.css">
<link rel="stylesheet" href="/css/member/join.css">
<link rel="stylesheet" href="/css/member/join2.css">
<link rel="stylesheet" href="/css/header.css">
<link rel="stylesheet" href="/css/member/toggle.css" />
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
</head>
<body>
<!-- header 자리 -->
<jsp:include page="../inc/header.jsp"></jsp:include>

   <main id="main">

      <!-- 화면에 보여질 콘텐츠 박스 -->
      <div class="inner">
         <!-- flexbox -->
         <h2>${facltNm}</h2>
         <section class="item item1">
            <div class="review-form">
               <form name="frm" id="join_form" action="/reviewWrite">

                  <div class="nec-input"></div>
                  <input type="hidden" name="campsiteNo" id="campsiteNo"
                     value="${no}" readonly="readonly"> <input type="hidden"
                     name="memberNo" readonly="readonly" value="${dto.member_no}">
                  <table class="input-table" style="margin-top: 1rem;">

                     <tr>
                        <th>내용</th>
                        <td><textarea name="content" id="content"
                              style="width: 300px; height: 150px; font-size: 1.2rem;resize: none;"></textarea>
                        </td>
 

                     </tr>
                     <tr>
                        <th>시설별점</th>
                        <td>
                           <div class="fcl" id="fcl">
                              <fieldset name="fclRating">
                                 <input type="radio" name="fclRating" value="5" id="fcl_rate1"><label
                                    for="fcl_rate1">⭐</label> <input type="radio"
                                    name="fclRating" value="4" id="fcl_rate2"><label
                                    for="fcl_rate2">⭐</label> <input type="radio"
                                    name="fclRating" value="3" id="fcl_rate3"><label
                                    for="fcl_rate3">⭐</label> <input type="radio"
                                    name="fclRating" value="2" id="fcl_rate4"><label
                                    for="fcl_rate4">⭐</label> <input type="radio"
                                    name="fclRating" value="1" id="fcl_rate5"><label
                                    for="fcl_rate5">⭐</label>
                              </fieldset>
                              </br>
                           </div>
                        </td>
                     </tr>
                     <tr>
                        <th>환경별점</th>
                        <td>
                           <div class="env" id="env">
                              <fieldset name="envRating">
                                 <input type="radio" name="envRating" value="5" id="env_rate1"><label
                                    for="env_rate1">⭐</label> <input type="radio"
                                    name="envRating" value="4" id="env_rate2"><label
                                    for="env_rate2">⭐</label> <input type="radio"
                                    name="envRating" value="3" id="env_rate3"><label
                                    for="env_rate3">⭐</label> <input type="radio"
                                    name="envRating" value="2" id="env_rate4"><label
                                    for="env_rate4">⭐</label> <input type="radio"
                                    name="envRating" value="1" id="env_rate5"><label
                                    for="env_rate5">⭐</label>
                              </fieldset>
                              </br>
                           </div>
                        </td>
                     </tr>
                     <tr>
                        <th>서비스별점</th>
                        <td>
                           <div class="ser" id="ser">
                              <fieldset name="serviceRating">
                                 <input type="radio" name="serviceRating" value="5"
                                    id="service_rate1"><label for="service_rate1">⭐</label>
                                 <input type="radio" name="serviceRating" value="4"
                                    id="service_rate2"><label for="service_rate2">⭐</label>
                                 <input type="radio" name="serviceRating" value="3"
                                    id="service_rate3"><label for="service_rate3">⭐</label>
                                 <input type="radio" name="serviceRating" value="2"
                                    id="service_rate4"><label for="service_rate4">⭐</label>
                                 <input type="radio" name="serviceRating" value="1"
                                    id="service_rate5"><label for="service_rate5">⭐</label>
                              </fieldset>
                              </br>
                           </div>
                        </td>
                     </tr>
                  </table>
                     <div class="rsubmit-box">
                        <button type="button" id="Send" class="review-submit-btn">후기등록</button>
                     </div>
                     
                     <div class="rcancel-box">
                  <button class="review-cancle-btn" onclick="location.href='main'">취소하기</button>
               </div>
               </form>
            </div>
         </section>
      </div>
   </main>
	<jsp:include page="../inc/footer.jsp"></jsp:include>


   <script src="https://code.jquery.com/jquery-3.4.1.js"
  integrity="sha256-WpOohJOqMqqyKL9FccASB9O0KwACQJpFTUBLTYOVvVU="
  crossorigin="anonymous"></script>
<script type="text/javascript" src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script type="text/javascript" src="/js/review.js"></script>
<!-- 합쳐지고 최소화된 최신 CSS -->
<script type="module" src="https://unpkg.com/ionicons@5.5.2/dist/ionicons/ionicons.esm.js"></script>
<script nomodule src="https://unpkg.com/ionicons@5.5.2/dist/ionicons/ionicons.js"></script>


</body>
</html>