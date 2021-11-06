<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="com.work.wecamp.member.controller.MemberController" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>메인페이지</title>
<meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="shortcut icon" href="/img/favicon.png">
	<link rel="icon" href="/img/favicon.png">
    <link rel="stylesheet" href="/css/main.css"> 
    <link rel="stylesheet" href="/css/normalize.css">
    <link rel="stylesheet" href="/css/common.css">
</head>
<body>
	 <div id="main-container">
        
        <!-- 아이콘, 네비게이션 바 -->
        <jsp:include page="inc/header.jsp"></jsp:include>

        <div class="row">
            <div class="col">
                <h1>WECAMP</h1>
                <p>
                     우리가 찾던 모든 캠핑장, <br>
                    지금 만나러 가보세요!
                </p>
                <button type="button" class="search-btn">
                    Try Wecamp
                </button>
            </div>

            <div class="col t-col">
			
			
             <div class="card-box">
             	<a href="/camp/camplist/일반야영장">
	                <div class="card card1">
	                    <h5>일반야영장</h5>
	                    
	                </div>
				</a>
				
				<a href="/camp/camplist/자동차야영장">
	                <div class="card card2">
	                    <h5>자동차야영장</h5>
	                </div>
                </a>
              </div>
	
                <div class="card-box">
	                <a href="/camp/camplist/글램핑">
	                    <div class="card card3">
	                        <h5>글램핑</h5>
	                    
	                    </div>
					</a>
					
					<a href="/camp/camplist/카라반">
                    <div class="card card4">
                        <h5>카라반</h5>
                    
                    </div>
                    </a>
                </div>
            </div>
        </div>
    </div>
  	<script>
		const btn = document.querySelector(".search-btn");
		btn.addEventListener("click",function(){
			location.href = "/camp/camplist";
		})
  	</script>
</body>
</html>