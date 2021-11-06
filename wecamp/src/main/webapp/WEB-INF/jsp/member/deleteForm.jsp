<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="/css/member/join2.css">
<link rel="stylesheet" href="/css/header.css">
<link rel="stylesheet" href="/css/member/myInfo.css" />
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
            <article class="main-container">
            <nav id="t-navigation">
                      <ul class="t-nav-ul">
                           <li class="t-list active">
                               <a href="/member/myInfoUpdate" class="t-anchor">
                                   <span class="t-icon"><ion-icon name="person-outline"></ion-icon></span>
                                   <span class="t-title">내정보 조회</span>
                               </a>
                           </li>
                           <li class="t-list">
                               <a href="/member/mylike" class="t-anchor">
                                   <span class="t-icon"><ion-icon name="heart-outline"></ion-icon></span>
                                   <span class="t-title">좋아요 목록</span>
                               </a>
                           </li>
                           <li class="t-list">
                               <a href="/member/reviewList" class="t-anchor">
                                   <span class="t-icon"><ion-icon name="chatbubbles-outline"></ion-icon></span>
                                   <span class="t-title">후기 목록</span>
                               </a>
                           </li>
                           <li class="t-list">
                               <a href="/member/myboardList" class="t-anchor">
                                   <span class="t-icon"><ion-icon name="clipboard-outline"></ion-icon></span>
                                   <span class="t-title">게시글 목록</span>
                               </a>
                           </li>
                       </ul>
                  </nav>
               <section class="item item1">
                  <h3  style="display:none">회원탈퇴폼</h3>
                  <div class="join-form">
                     <form name="frm" id="join_form" method="POST" action="/delete">
                        <div class="nec-input">
                        </div>
                        
                        <table class="input-table">
                        
                           <tr>
                              <th>
                                 회원탈퇴안내
                              </th>
                              <td>
                                       고객님께서 회원 탈퇴를 원하신다니 저희 wecamp의 서비스가 많이 부족하고
                                       미흡했나봅니다. 불편하셨던 점이나 불만사항을 알려주시면 적극 반영해서 고객님의
                                       불편을 해결해 드리도록 노력하겠습니다.<br><br>
                                       <span style="color:purple;"><strong>
                                       아울러 회원 탈퇴시의 아래 사항을 숙지하시기 바랍니다.<br><br>
                                       </strong></span>
                                       1. 소셜 로그인을 통해 로그인 하신 경우 회원탈퇴 기능을 사용하실 수 없습니다.<br>
                                       2. 회원 탈퇴 시 고객님의 개인정보는 전부 삭제 됩니다.<br>
                                       3. 탈퇴 시 고객님께서 작성하신 후기 및 좋아요 목록은 전부 삭제됩니다.<br>
                                       4. 작성하신 게시글 및 댓글 또한 전부 삭제되며 복원 불가합니다.<br>
                  
                              </td>
                              
                           </tr>
                                                      
                           <tr>
                              <th>
                                 비밀번호확인
                              </th>
                              <td>
                                       <input type="password" size="40" name="memberPw" placeholder="비밀번호를 입력해주세요"/>
                              </td>
                           </tr>
                                       
                              
                           <tr class="reg-agree">
                              <th>
                                 무엇이 불편하셨나요?
                              </th>
                              <td>
                                 <div>
                                             
                                          </div>
                                          
                                          
                                          <div class="check-view">
                                             <label class="reg-agree-chk">
                                                <input type="checkbox" name="reg-agree-chk" id="reg-agree-chk"/>
                                             </label>
                                          </div>
                                          
                                          <div class="check-view">
                                             <label class="reg-agree-chk">
                                                <input type="checkbox" name="reg-agree-chk" id="reg-agree-chk"/>
                                                <span class="ico"></span>
                                                캠핑장 정보 부족 <span class="nec-reg"></span>
                                             </label>
                                          </div>
                                          
                                          <div class="check-view">
                                             <label class="reg-agree-chk">
                                                <input type="checkbox" name="reg-agree-chk" id="reg-agree-chk"/>
                                                <span class="ico"></span>
                                                개인 정보 유출 우려 <span class="nec-reg"></span>
                                             </label>
                                          </div>
                                          
                                          <div class="check-view">
                                             <label class="reg-agree-chk">
                                                <input type="checkbox" name="reg-agree-chk" id="reg-agree-chk"/>
                                                <span class="ico"></span>
                                                 방문 빈도가 낮음<span class="nec-reg"></span>
                                             </label>
                                          </div>
                                          
                                          <div class="check-view">
                                             <label class="privacy-agree-es">
                                                <input type="checkbox" name="privacy-agree-es" id="privacy-agree-es"/>
                                                <span class="ico"></span>
                                                wecamp 신뢰도 불만 <span class="nec-reg"></span>
                                             </label>
                                          </div>
                                          
                                          <div class="check-view">
                                             <label class="age-chk">
                                                <input type="checkbox" name="age-chk" id="age-chk"/>
                                                <span class="ico"></span>
                                                다른 사이트 이용 <span class="nec-reg"></span>
                                             </label>
                                          </div>
                                       </div>
                                       <textarea placeholder="고객님의 진심어린 충고 부탁합니다." style="width:300px;height:200px;font-size:10px;"></textarea>
                              </td>
                           </tr>                                                                                                               
                        </table>
                        <div class="submit-box">
                           <div class="join-box">
                              <button type="button" id="Send" class="join-button" style="background: #D3E73E;">탈퇴하기</button>
                           </div>
                        </div>      
                     </form>   
                           
                        <div class="cancel-box">
                           <button class="cancel-button" onclick="location.href='/member/myInfoUpdate' ">취소하기</button>
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
<!-- 합쳐지고 최소화된 최신 CSS -->
 <script type="module" src="https://unpkg.com/ionicons@5.5.2/dist/ionicons/ionicons.esm.js"></script>
<script nomodule src="https://unpkg.com/ionicons@5.5.2/dist/ionicons/ionicons.js"></script>
<script type="text/javascript" src="/js/member/delete.js"></script>
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

    </script><br><br>
    
<!-- 푸터자리 -->
<jsp:include page="../inc/footer.jsp"></jsp:include>
</body>
</html>