<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<link rel="stylesheet" href="/css/header.css">
<%@include file="layout/header.jsp"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
    <link rel="shortcut icon" href="/img/favicon.png">
	<link rel="icon" href="/img/favicon.png">
<div class="container">

   <br> <br />
   <h1 class="text-center">CAMP INSIGHT</h1>
   <br> <br />
   <table class="table table-hover text-center ">
      <thead class="thead-dark">
         <tr>
            <th scope="col"><i>No</i></th>
            <th scope="col">제목</th>
            <th scope="col">작성자</th>
            <th scope="col">작성일</th>
            <th scope="col">조회</th>
            <th scope="col"></th>
         </tr>
      </thead>
      <c:forEach var="board" items="${boards.content}">
         <tbody>
            <tr>
               <th scope="row"><i>${board.board_no}</i></th>
               <td>${board.title}</td>
               <td><span><i>${board.member.username} </i></span></td>
               <td><span><i><fmt:formatDate
                           value="${board.createDate}" pattern="yyyy-MM-dd" /></i></span></td>
               <td>${board.count}</td>
               <td><a href="/board/${board.board_no} "
                  class="btn btn-primary">상세보기</a></td>
            </tr>
         </tbody>
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

      <c:if test="${not empty principal.member.member_no}">
         <a href="/board/saveForm" class="btn btn-primary">글쓰기</a>
      </c:if>

   </ul>

</div>

<%@include file="layout/footer.jsp"%>

<style>
	#footer{
		position: absolute;
		bottom: 0;
	}
	 .t-modal{
	 	height : 540px;
	 }
	 .t-navbar{
	 	margin-bottom : 50px;
	 }
	#board-container{
		margin-bottom : 130px;
	}


</style>


