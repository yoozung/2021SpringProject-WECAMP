<!-- member/myInfoUpdate -->
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
    <link rel="shortcut icon" href="/img/favicon.png">
	<link rel="icon" href="/img/favicon.png">

<link rel="stylesheet" href="/css/member/join.css">
<link rel="stylesheet" href="/css/member/join2.css">
<link rel="stylesheet" href="/css/header.css">
<link rel="stylesheet" href="/css/member/myInfo.css" />
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
</head>

<sec:authorize access="isAuthenticated()">
   <sec:authentication property="principal" var="principal" />
</sec:authorize>
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
                  <h2>내정보조회</h2>
                  <h3  style="display:none">내정보조회폼</h3>
                  <div class="join-form">
                     <form name="frm" id="join_form" method="post" action="/myInfoUpdate">
                        <div class="nec-input">
                           <span class="esq">*</span>
                           <span>필수입력사항</span>
                           <br/>
                  <c:choose>
                     <c:when test="${not empty principal.member.provider}">
                           <span>※소셜회원은 정보조회만 가능합니다.</span>
                     </c:when>
                     
                     <c:otherwise></c:otherwise>
                  </c:choose>
                        </div>
                        
                        <table class="input-table">
                        
                           <tr>
                              <th>
                                 아이디
                                 <span class="esq ">*</span>
                              </th>
                              <td>
                                       <input class="id_input" type="text" id="user-id" name="memberId" size="40" 
                                       value=${ memberId } readonly="readonly">
                              </td>
                              
                           </tr>
         <c:choose>
            <c:when test="${not empty principal.member.provider}">
                                <tr>
                              <th>
                                 비밀번호
                                 <span class="esq">*</span>
                              </th>
                              <td>
                                       <input class="pw_input" type="password" id="user-password" size="40" name="memberPw" readonly="readonly" style="background-color: #e2e2e2;">
                              </td>
                           </tr>                           
                           <tr>
                              <th>
                                 비밀번호확인
                                 <span class="esq">*</span>
                              </th>
                              <td>
                                       <input class="pwck_input" type="password" id="user-password-chk" name="memberPw2" size="40" readonly="readonly" style="background-color: #e2e2e2;">
                              </td>
                           </tr>
             </c:when>

          <c:otherwise>
                             <tr>
                              <th>
                                 비밀번호
                                 <span class="esq">*</span>
                              </th>
                              <td>
                                       <input class="pw_input" type="password" id="user-password" size="40" name="memberPw" placeholder="비밀번호를 입력해주세요">
                              <span class="final_pw_ck">비밀번호를 입력해주세요.</span>
                              </td>
                           </tr>                           
                           <tr>
                              <th>
                                 비밀번호확인
                                 <span class="esq">*</span>
                              </th>
                              <td>
                                       <input class="pwck_input" type="password" id="user-password-chk" name="memberPw2" size="40" placeholder="비밀번호를 한번 더 입력해주세요">
                              <span class="final_pwck_ck">비밀번호 확인을 입력해주세요.</span>
                              <span class="pwck_input_re_1">비밀번호가 일치합니다.</span>
                              <span class="pwck_input_re_2">비밀번호가 일치하지 않습니다.</span>
                              </td>
                           </tr>
          </c:otherwise>


   </c:choose>
                           <tr>
                              <th>
                                 이름
                                 <span class="esq">*</span>
                              </th>
                              <td>
                                       <input class="user_input" type="text" id="user-name" name="username" placeholder="이름을 입력해주세요" size="40"
                                       value=${ username }>
                              <span class="final_name_ck">이름을 입력해주세요.</span>
                              </td>
                           </tr>
                           <tr>
                              <th>
                                 이메일
                                 <span class="esq">*</span>
                              </th>
                              <td>
                                       <input class="mail_input" type="text" id="email" name="email" placeholder="ex)doeat@eat.com" size="40"
                                       value=${ email }>
                              <span class="final_mail_ck">이메일을 입력해주세요.</span>
                              </td>
                           </tr>
                           <tr>
                              <th>
                                 휴대폰
                                 <span class="esq">*</span>
                              </th>
                              <td>
                                       <input class="mobile_name" type="text" id="phone" name="mobile" placeholder="숫자만 입력해주세요" size="40"
                                       value=${ mobile }>
                              <span class="final_mobile_ck">휴대폰 번호를 입력해주세요.</span>
                              </td>
                              
                              
                           </tr>               
                              
                        </table>
                        <c:if test="${empty principal.member.provider}" >
                        <div class="submit-box">
                           <div class="join-box">
                              <button type="button" id="Send" class="join-button">내정보변경</button>
                           </div>
                        </div>
                              
                     </form>         
                        <div class="cancel-box">
                           <button class="cancel-button" onclick="location.href='/member/deleteForm' ">회원탈퇴</button>
                        </div>
                     </c:if>
                  </div>
               </section>
            </article>
         </div>
      </main>
      
      <jsp:include page="../inc/footer.jsp"></jsp:include>
      <style>
         .main-container{
            margin-bottom : 4rem;
         }
      </style>
      
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