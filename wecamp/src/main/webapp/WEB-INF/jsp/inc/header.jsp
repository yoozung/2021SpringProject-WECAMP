<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%> 
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>


<sec:authorize access="isAuthenticated()">
	<sec:authentication property="principal" var="principal" />
</sec:authorize>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="shortcut icon" href="/img/favicon.png">
<link rel="icon" href="/img/favicon.png">
<link rel="stylesheet" href="https://pro.fontawesome.com/releases/v5.10.0/css/all.css" integrity="sha384-AYmEC3Yw5cVb3ZcuHtOA93w35dYTsvhLPVnYs9eStHfGJvOvKxVfELGroGkvsg+p" crossorigin="anonymous"/>
<link rel="stylesheet" href="/css/member/login.css">
<link rel="stylesheet" href="/css/normalize.css">
<link rel="stylesheet" href="/css/common.css">

</head>
<body>
<!-- 아이콘, 네비게이션 바 -->
        <header class="t-navbar">
            <a href="/" class="header-logo" id="header-logo">
                <i class="fal fa-campground"></i>
                wecamp
            </a>
            <nav class="header-nav">
                <ul id="t-list">
                    <li><a href="/guide">GUIDE</a></li>
                    <li><a href="/board">CAMP INSIGHT</a></li>
                    <li><a href="/camp/camplist">CAMP SEARCH</a></li>
                </ul>
            </nav>


            <div class="header-dropdown">
                <button class="drop-button">
                    <i class="fas fa-bars"></i>
                </button>
                <div style="display: none;" id="drop-content">
                <!--  -->
               <c:choose>
				<c:when test="${empty principal}">
                         	<a href='#' id="login">로그인</a>
                           <a href='/joinForm' id="join">회원가입</a>
                          
                  </c:when>
                  
                  <c:otherwise>
                      <a href='/logout' id="login">로그아웃</a>
                           <a href='/member/myInfoUpdate' id="join">마이페이지</a>
                          
                  </c:otherwise>
               </c:choose>                

                </div>
            </div>  
        </header>
        
        
        
         <!--모달창 아이디: hidden-->
	    <div class="t-modal-container" id="t-modal">
	        <div class="t-modal">
	            <button class="t-close-btn" id="t-close">
	                <i class="fa fa-times"></i>
	            </button>
	              <div class="t-modal-header">
	                
	                <h3>LOGIN</h3>
	              </div>
	             
              <div class="t-modal-content">
	               
                <form action="/login" method="POST">
                  <div>
                    <input type="text"size="43" id="memberId" name="memberId" placeholder="아이디를 입력해주세요" class="form-input">
                  </div>

                  <div>
                    <input type="password"size="43" id="memberPw" name="memberPw" placeholder="비밀번호를 입력해주세요" class="form-input">
                  </div>

                  <button type="submit" class="login-button">Login</button>
				
				  <div class="inner-wrap"><hr></div>
				
                <!-- 구글 로그인 -->
                <a href="/oauth2/authorization/google">
                  <div class="google-btn">
                    <div class="google-icon-wrapper">
                      <img class="google-icon" src="https://upload.wikimedia.org/wikipedia/commons/5/53/Google_%22G%22_Logo.svg"/>
                    </div>
                    <p class="btn-text">Sign in with google</p>
                  </div>
                </a>
               
                <!-- 네이버 로그인 -->
                <a href="/oauth2/authorization/naver">
                    <div class="naver-btn">
                      <div class="naver-icon-wrapper">
                        <img class="naver-icon" src="/img/main/login/naver.png"/>
                      </div>
                      <p class="btn-text">네이버 로그인</p>
                    </div>
                  </a>


                  <!-- 카카오 로그인 -->
                  <a href="/oauth2/authorization/kakao">
                    <div class="kakao-btn">
                      <div class="kakao-icon-wrapper">
                        <img class="kakao-icon" src="/img/main/login/kakao.png"/>
                      </div>
                      <p class="btn-text">카카오 로그인</p>
                    </div>
                  </a>

                </form>
						
              </div>
	        </div>
	      </div>

        <script src="/js/main.js"></script>

</body>
</html>