<!-- myboardList.jsp -->
<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<link rel="stylesheet" href="/css/header.css">
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec"
   uri="http://www.springframework.org/security/tags"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<%@include file="../board/layout/header.jsp"%>

<sec:authorize access="isAuthenticated()">
   <sec:authentication property="principal" var="principal" />
</sec:authorize>
<!DOCTYPE html>
<html lang="en">
<head>
<title>WECAMP</title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">

    <link rel="shortcut icon" href="/img/favicon.png">
	<link rel="icon" href="/img/favicon.png">
<link rel="stylesheet"
   href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css">
<script
   src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script
   src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script
   src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js"></script>

<link
   href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-bs4.min.css"
   rel="stylesheet">
<script
   src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-bs4.min.js"></script>
<link rel="stylesheet" href="/css/board/reply.css">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>

</head>
<article class="main-container">
<nav id="t-navigation">
                      <ul class="t-nav-ul">
                           <li class="t-list ">
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
                           <li class="t-list active">
                               <a href="/member/myboardList" class="t-anchor">
                                   <span class="t-icon"><ion-icon name="clipboard-outline"></ion-icon></span>
                                   <span class="t-title">게시글 목록</span>
                               </a>
                           </li>
                       </ul>
                  </nav>
<div class="ccontainer">

   <br> <br />
   <h1 class="text-center">
   <i>${username }님&nbsp;</i>
    게시글 조회</h1>
   <br> <br />
   <table class="table table-hover text-center ">
      <thead class="thead-dark">
      
         <tr>
            <th scope="col">글번호</th>
            <th scope="col">제목</th>
            <th scope="col">작성자</th>
            <th scope="col">작성일</th>
            <th scope="col">조회수</th>
            <th scope="col">비고</th>
         </tr>
      </thead>
      <c:forEach var="board" items="${boards.content}">
         <c:if test="${board.member.member_no eq principal.member.member_no}">
            <tbody>
               <tr>
                  <th scope="row">${board.board_no}</th>
                  <td>${board.title}</td>
                  <td><span><i>${board.member.username} </i></span></td>
                  <td>
                  	<i><fmt:formatDate value="${board.createDate}"
                              pattern="yyyy-MM-dd" /></i>&nbsp;&nbsp;
                  </td>
                  <td>${board.count}</td>
                  <td><a href="/board/${board.board_no} "
                     class="btn btn-primary">상세보기</a></td>
               </tr>
            </tbody>
         </c:if>
      </c:forEach>
   </table>


   <ul class="pagination justify-content-center">
      <c:choose>
         <c:when test="${boards.first }">
            <li class="page-item disabled"><a class="page-link"
               href="?page=${boards.number-1 }">이전</a></li>
         </c:when>
         <c:otherwise>
            <li class="page-item"><a class="page-link"
               href="?page=${boards.number-1 }">이전</a></li>
         </c:otherwise>
      </c:choose>

      <c:forEach var="i" begin="1" end="${boards.totalPages}">
         <li class="page-item"><a class="page-link" href="?page=${i-1}">${i}</a></li>
      </c:forEach>

      <c:choose>
         <c:when test="${boards.last }">
            <li class="page-item disabled"><a class="page-link"
               href="?page=${boards.number+1 }">다음</a></li>
         </c:when>
         <c:otherwise>
            <li class="page-item"><a class="page-link"
               href="?page=${boards.number+1}">다음</a></li>
         </c:otherwise>
      </c:choose>

   </ul>
</div>
<%@include file="../board/layout/footer.jsp"%>
</article>


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
    


<style>
   #footer{
   margin-top : 20rem;
   }
    
    .t-navbar{
       margin-bottom : 50px;
    }
</style>