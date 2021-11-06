<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ include file="../inc/Taglib.jsp"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
    <link rel="shortcut icon" href="/img/favicon.png">
	<link rel="icon" href="/img/favicon.png">
<title>리뷰목록</title>

<link rel="stylesheet" href="/css/member/join.css">
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
                        <li class="t-list">
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
                        <li class="t-list active">
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
                  <h2>후기목록</h2>
                  <h3  style="display:none">후기목록</h3>
                  <div class="join-form">
                     <form name="frm" id="join_form" method="post" action="/myInfoUpdate">
                        <div class="nec-input">
                        <span>캠핑장명을 클릭하면 후기 상세 내용을 조회 변경할 수 있습니다.</span>
                        </div>
                        
                        <table class="input-table">
                        <c:forEach var="r" items="${list}">
                        
                           <tr>
                              
                              <td>
                              
                               <a href="/reviewDetail?reviewNo=${r.reviewNo}"
                                 name="reviewNo" value="${r.facltNm}">${r.facltNm}</a>
                                 
                                 <c:set var="dateValue" value="${r.createDate}" />
                                 
                                 (${fn:substring(dateValue,0,10)})
                                 <input type="hidden" ${r.reviewNo}>
                           </tr>
                           
                           </c:forEach>   
                        </table>
                     </form>            
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