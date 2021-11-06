<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<link rel="stylesheet" href="/css/header.css">
<%@include file="layout/header.jsp"%>
    <link rel="shortcut icon" href="/img/favicon.png">
	<link rel="icon" href="/img/favicon.png">
<div class="container">
	<form>
		<input type="hidden" id="id" value="${board.board_no}"/>
		<div class="form-group">
			<input value="${board.title}" type="text" class="form-control" placeholder="제목을 입력하세요" id="title">
		</div>

		<div class="form-group">
			<textarea class="form-control summernote" rows="5" id="content">${board.content}</textarea>
		</div>
	</form>
	<div style="text-align: right;">
		<button id="btn-update" class="btn btn-primary">글수정완료</button>
	</div>
	
</div>

<script>
	$('.summernote').summernote({
		placeholder : '내용을 입력하세요',
		tabsize : 2,
		height : 300
	});
</script>
<script src="/js/board/board.js"></script>
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

</style>