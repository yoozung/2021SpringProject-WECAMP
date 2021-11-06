<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<link rel="stylesheet" href="../css/header.css">
<%@include file="layout/header.jsp"%>


<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>



<div class="container">
   <div style="text-align: left;">
      No.<span id="id"><i>${board.board_no}</i></span>
   </div>
   <div class="inner_wrap"></div>
   <div>
      작성자 : <span style=><i>${board.member.username}</i></span>
      <hr />
   </div>
   <div>
      <h3 style="font-size: 2rem">${board.title}</h3>
   </div>
	<hr style="background:#C7C7C7"/>
   <div style="text-align: right;">
      조회 : <span><i>${board.count}</i></span><br> <span><i><fmt:formatDate
               value="${board.createDate}" pattern="yyyy-MM-dd" /></i></span><br>
   </div>
   <br><br/>
   <div>
      <h3 style="font-size:1.2rem; color:#2D3134;">${board.content}</h3>
   </div>
   <div>
      <br>
      <div id="replyicon" style="text-align: right;">
      <a href="#hiddenList03"><img src="https://img.icons8.com/external-flatart-icons-outline-flatarticons/28/000000/external-comment-chat-flatart-icons-outline-flatarticons-2.png" />&ensp;댓글&ensp;${board.replys.size()}</a>
         
      </div>
   </div>

   <hr />


   <div style="float: right;">
      <c:if test="${board.member.member_no == principal.member.member_no}">
         <a href="/board/${board.board_no }/updateForm"
            class="btn btn-warning">수정</a>
         <button id="btn-delete" class="btn btn-danger">삭제</button>
      </c:if>
      <button class="btn btn-secondary" onclick=history.back()>목록</button>
   </div>
   <br /> <br /> <br />


   <h4>
      <span class="icon-commenting" id="spreadBtn04">&ensp;댓글&ensp;${board.replys.size()}</span>
   </h4>
   <div id="hiddenList03" class="replylist">
      <div class="card">
         <div class="card-header">댓글</div>
         <ul id="reply-box" class="list-group">
            <c:forEach var="reply" items="${board.replys}">
               <li id="reply-${reply.reply_no }"
                  class="list-group-item d-flex justify-content-between">
                  <div class="font-italic">${reply.content}</div>
                  <div class="d-flex" style="font-size:0.8rem">
                     <div>작성자: ${reply.member.username }&nbsp;&nbsp;</div>
                     <div  style="color:#B8C2DD">
                        <i><fmt:formatDate value="${board.createDate}"
                              pattern="yyyy-MM-dd" /></i>&nbsp;&nbsp;
                     </div>
                     <c:if
                        test="${reply.member.member_no eq principal.member.member_no}">
                        <button
                           onClick="index.replyDelete(${board.board_no},${reply.reply_no})"
                           class="btn btn-primary badge">삭제</button>
                     </c:if>
                  </div>
               </li>
            </c:forEach>
         </ul>

      </div>
      <br /> <br />
      <div class="card">
         <form>
            <input type="hidden" id="userId"
               value="${principal.member.member_no }" /> <input type="hidden"
               id="boardId" value="${board.board_no}" />
            <div class="card-body">
               <textarea id="reply-content" class="form-control" rows="1"
                  placeholder="여러분의 소중한 댓글을 입력해주세요"></textarea>
            </div>
            <div class="card-footer" style="text-align: right;">
            	<c:if test="${principal ne null}">
            		<button type="button" id="btn-reply-save" class="btn btn-primary">등록</button>
            	</c:if>
               
            </div>
         </form>
      </div>
   </div>
</div>

<%@include file="layout/footer.jsp"%>

<script src="/js/board/board.js"></script>


<style>
	.container{
		margin-bottom: 100px;
	}
	 .t-modal{
	 	height : 540px;
	 }
	 .t-navbar{
	 	margin-bottom : 50px;
	 }
</style>