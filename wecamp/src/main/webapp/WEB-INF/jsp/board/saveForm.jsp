<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<link rel="stylesheet" href="/css/header.css">
<%@include file="layout/header.jsp"%>
    <link rel="shortcut icon" href="/img/favicon.png">
	<link rel="icon" href="/img/favicon.png">
<div class="container">
	<form>
		<div class="form-group">
			<input type="text" class="form-control" placeholder="제목" id="title">
		</div>

		<div class="form-group">
			<textarea class="form-control summernote" rows="5" id="content"></textarea>
		</div>
	</form>
	<div style="text-align: right;"><button id="btn-save" class="btn btn-primary">글쓰기완료</button></div>
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