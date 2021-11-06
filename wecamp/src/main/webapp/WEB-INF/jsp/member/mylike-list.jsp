<!-- member/myInfoUpdate -->
<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ page import="com.work.wecamp.member.model.Member"%>
<%@ page import="com.work.wecamp.member.controller.MemberController"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ include file="../inc/Taglib.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
    <link rel="shortcut icon" href="/img/favicon.png">
	<link rel="icon" href="/img/favicon.png">
<title>WECAMP</title>

<link rel="stylesheet" href="/css/member/mylike-list.css">
<link rel="stylesheet" href="/css/member/join.css">
<link rel="stylesheet" href="/css/member/join2.css">
<link rel="stylesheet" href="/css/header.css">
<link rel="stylesheet" href="/css/member/myInfo.css" />
   
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
                        <li class="t-list active">
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
               <h2>좋아요 누른 캠핑장</h2>
               <h3 style="display: none">내정보조회폼</h3>
               <div class="join-form">
                  <div class="nec-input">
                     <span class="esq" style="color: #fff;">*</span> <span></span>
                  </div>

                  
                  <c:forEach var="r" items="${campList}">
                  
                     <div class="camp-img-box">
                        <c:choose>
                           <c:when test="${empty r.thumbnail}">
                              <div class="camp-img"
                                 style="background-image: url('https://gocamping.or.kr/upload/camp/6764/thumb/thumb_720_3462IXfFkJ3mBey7bbrXyHsv.jpg')">
                                 <img src="${r.thumbnail}">
                              </div>
                           </c:when>
                           <c:otherwise>
                              <img class="camp-img" src="${r.thumbnail}">
                           </c:otherwise>
                        </c:choose>
                     
                     <div class="like-camp-info">
                        <div class="like-info-campnm"><a href="/">${r.facltNm}</a></div>
                        <div class="like-info-content">${r.lineIntro}</div>
                        <c:if test="${r.lineIntro eq null}"><div class="like-info-content">등록된 한 줄 소개가 없습니다.</div></c:if>
                        <div class="like-info-content">${r.addr1}</div>
                        <div class="like-info-content">${r.tel}</div>
                        <input type="hidden" value="${r.campsiteNo}" id="campsite-no" />
                        <input type="hidden" value="${r.induty}" id="induty" />
                     </div>
                     </div>
                  
                  </c:forEach>
                  
               </div>
            </section>
         </article>
      </div>
   </main>
   		<jsp:include page="../inc/footer.jsp"></jsp:include>
		<style>
			.main-container{
				margin-bottom : 3rem;
			}
		</style>
		
   <script type="text/javascript" src="/js/member/join.js"></script>
   <script type="text/javascript" src="/js/member/infoUpdate.js"></script>
   <!-- 합쳐지고 최소화된 최신 CSS -->
   <script type="module"
      src="https://unpkg.com/ionicons@5.5.2/dist/ionicons/ionicons.esm.js"></script>
   <script nomodule
      src="https://unpkg.com/ionicons@5.5.2/dist/ionicons/ionicons.js"></script>
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