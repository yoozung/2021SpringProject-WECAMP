<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>

<%@ include file="../inc/Taglib.jsp"%>
<!DOCTYPE html>
<html>
<head>
<script
   src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<meta charset="UTF-8">
<title>리뷰상세(수정삭제가능)</title>
<link type="text/css" rel="stylesheet" href="/css/review/reviewWrite.css">
<link rel="stylesheet" href="/css/member/join.css">
<link rel="stylesheet" href="/css/review/reviewDetail.css">
<link rel="stylesheet" href="/css/header.css">
<link rel="stylesheet" href="/css/member/myInfo.css" />
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
</head>
</head>
<body>
<!-- header 자리 -->
<jsp:include page="../inc/header.jsp"></jsp:include>

<main id="main">
         <!-- 화면에 보여질 콘텐츠 박스 --> 
         <div class="inner">
            <!-- flexbox -->
            <article class="main-container">

               <nav id="t-navigation">
                      <ul class="t-nav-ul">
                           <li class="t-list">
                               <a href="/member/myInfoUpdate" class="t-anchor">
                                   <span class="t-icon"><ion-icon name="person-outline"></ion-icon></span>
                                   <span class="t-title">내정보 조회</span>
                               </a>
                           </li>
                           <li class="t-list">
                               <a href="#" class="t-anchor">
                                   <span class="t-icon"><ion-icon name="heart-outline"></ion-icon></span>
                                   <span class="t-title">좋아요 목록</span>
                               </a>
                           </li>
                           <li class="t-list active">
                               <a href="/member/reviewList" class="t-anchor">
                                   <span class="t-icon"><ion-icon name="chatbubbles-outline"></ion-icon></span>
                                   <span class="t-title">후기 목록</span>
                               </a>
                           </li>
                           <li class="t-list">
                               <a href="#" class="t-anchor">
                                   <span class="t-icon"><ion-icon name="clipboard-outline"></ion-icon></span>
                                   <span class="t-title">게시글 목록</span>
                               </a>
                           </li>
                       </ul>
                  </nav>
                  
                  <section class="item item1">
                  <h2>후기 수정</h2>
                  <div class="join-form">
                     <form id="join_form" action="/reviewUpdate?reviewNo=${dto.reviewNo}">
                        <div class="nec-input">
                        </div>
                        
                        <table class="input-table">
                        <input type="hidden" value="${dto.reviewNo}" name="reviewNo">
                        <input type="hidden" value="${dto.campsiteNo}" name="campsiteNo">
                        <input type="hidden" value="${dto.memberNo}" name="memberNo">
                           
                           <tr>
                              <th>
                                 내용
                              </th>
                              <td>
                                 <textarea name="content" id="content" style="width:300px;height:200px;font-size:15px;resize:none">${dto.content}</textarea>
                              </td>
                           </tr>
                           
                           <tr>
                              <th>
                                 시설별점
                              </th>
                              <td>
                                       <div class="fcl" id="fcl">
                                             <fieldset name="fclRating"> 
                                                  <input type="radio" name="fclRating" value="5" id="fcl_rate1"><label for="fcl_rate1">⭐</label>
                                                  <input type="radio" name="fclRating" value="4" id="fcl_rate2"><label for="fcl_rate2">⭐</label>
                                                  <input type="radio" name="fclRating" value="3" id="fcl_rate3"><label for="fcl_rate3">⭐</label>
                                                  <input type="radio" name="fclRating" value="2" id="fcl_rate4"><label for="fcl_rate4">⭐</label>
                                                  <input type="radio" name="fclRating" value="1" id="fcl_rate5"><label for="fcl_rate5">⭐</label>
                                              </fieldset>
                                  </div>
                              </td>
                           </tr>
                           
                           <tr>
                              <th>
                                 환경별점
                              </th>
                              <td>
                                       <div class="env" id="env">
                                             <fieldset name="envRating"> 
                                                  <input type="radio" name="envRating" value="5" id="env_rate1"><label for="env_rate1">⭐</label>
                                                  <input type="radio" name="envRating" value="4" id="env_rate2"><label for="env_rate2">⭐</label>
                                                  <input type="radio" name="envRating" value="3" id="env_rate3"><label for="env_rate3">⭐</label>
                                                  <input type="radio" name="envRating" value="2" id="env_rate4"><label for="env_rate4">⭐</label>
                                                  <input type="radio" name="envRating" value="1" id="env_rate5"><label for="env_rate5">⭐</label>
                                              </fieldset>
                                 </div>
                              </td>
                           </tr>
                           
                           <tr>
                              <th>
                                 서비스별점
                              </th>
                              <td>
                                       <div class="ser" id="ser">
                                              <fieldset name="serviceRating"> 
                                                  <input type="radio" name="serviceRating" value="5" id="service_rate1"><label for="service_rate1">⭐</label>
                                                  <input type="radio" name="serviceRating" value="4" id="service_rate2"><label for="service_rate2">⭐</label>
                                                  <input type="radio" name="serviceRating" value="3" id="service_rate3"><label for="service_rate3">⭐</label>
                                                  <input type="radio" name="serviceRating" value="2" id="service_rate4"><label for="service_rate4">⭐</label>
                                                  <input type="radio" name="serviceRating" value="1" id="service_rate5"><label for="service_rate5">⭐</label>
                                              </fieldset>
                                 </div>
                              </td>
                           </tr>
                     </table>
                           <div class="submit-box">
                              <div class="join-box">
                                 <button type="submit" id="Send" class="join-button">후기변경</button>
                              </div>
                           </div>      
               </form>
                     <div class="cancel-box">
                        <button class="cancel-button" onclick="location.href='/reviewDelete?reviewNo=${dto.reviewNo}' ">삭제</button>
                     </div>
            </div>
         </section>
      </article>
   </div>
</main>
                           
<script src="https://code.jquery.com/jquery-3.4.1.js"
  integrity="sha256-WpOohJOqMqqyKL9FccASB9O0KwACQJpFTUBLTYOVvVU="
  crossorigin="anonymous"></script>
<script type="text/javascript" src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script type="text/javascript" src="/js/member/join.js"></script>
<script type="text/javascript" src="/js/member/infoUpdate.js"></script>
<!-- 합쳐지고 최소화된 최신 CSS -->
 <script type="module" src="https://unpkg.com/ionicons@5.5.2/dist/ionicons/ionicons.esm.js"></script>
    <script nomodule src="https://unpkg.com/ionicons@5.5.2/dist/ionicons/ionicons.js"></script>
    <script>
        //add active class in selected list item
        let list = document.querySelectorAll('.t-list');
        for(let i = 0; i < list.length; i++){
            list[i].onclick = function(){
                let j = 0;
                while(j < list.length){
                    list[j++].className = 't-list';
                }
                list[i].className = 't-list active';
            }
        }

    </script>
</body>
 
</html>