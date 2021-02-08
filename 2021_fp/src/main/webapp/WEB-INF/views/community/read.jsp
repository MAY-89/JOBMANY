<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/include/header.jsp"%>
<link rel="stylesheet"
	href=" ${pageContext.request.contextPath}/resources/css/community/read.css">
<!-- 상단 이미지 -->
<div>
	<img src="${pageContext.request.contextPath }/resources/img/board/boardHeader.jpg" class="board-list-top-img" alt="...">
</div>
<section>
	<div class="container">
		<div class="container read-top">
			<div class="row">
				<div class="col-md-10">
					<span class="h3 read-title-front">C</span>
					<span class="h3 read-title-tail">ommunity Board list &nbsp; </span>
				</div>
			</div>
		</div>
		<!-- title -->
		<div class="col ">
			<div class="row readTitle">
				<p class="h3">칼바람 하자 들어와</p>
			</div>
			<ul class="list-group list-group-horizontal" style="padding: 0;">
				<li class="list-group-item read read-writer">황정욱</li>
				<li class="list-group-item read read-views">
					<i class="bi bi-people"> 98</i>
				</li>
				<li class="list-group-item read read-day">
					<i class="bi bi-calendar2-check"> 2021.02.06 10:00</i>
				</li>
				<li class="list-group-item read read-comments">
					<i class="bi bi-chat-right-dots"> 3 Comments</i>
				</li>

			</ul>
		</div>
		<!-- read main -->
		<div class="col read-content">
			<div class="col read-content-inner">
				<p>
					칼바람 하자고 하니까 왜 아무도 안들어와 <br /> 아직 프로젝트 중이야?
				</p>
			</div>
		</div>
		<!-- read footer -->
		<hr />

	</div>

<!-- Comment -->
	<div class="container read-comment">
		<p class="h3 read-comment-title">&nbsp;&nbsp;Comment</p>
		<hr />
		<!-- comments view -->
		<div class="row read-comment-item">
			<div class="col-sm-1">
				
			</div>
			<div class="col-sm-10">
				<div class="row">
					<p class="comment-writer col-sm-10">장인제</p>
					<span class="col-sm-2">2021.02.06 10:00</span>
				</div>
				<p>칼바람 한번 하면 3시간입니다.</p>
				<a href="#" class="reply-btn">
					<i class="bi bi-reply-fill">Reply</i>
				</a>
			</div>
		</div>
		<hr />
		<!-- comments end -->
		<!-- comments view -->
		<div class="row read-comment-item">
			<div class="col-sm-1">
				
			</div>
			<div class="col-sm-10">
				<div class="row">
					<p class="comment-writer col-sm-10">최기근</p>
					<span class="col-sm-2">2021.02.06 10:00</span>
				</div>
				<p>세나 길드 들어와</p>
				<a href="#" class="reply-btn">
					<i class="bi bi-reply-fill">Reply</i>
				</a>
			</div>
		</div>
		<hr />
		<!-- comments end -->
		<!-- comments view -->
		<div class="row read-comment-item">
			<div class="col-sm-1">
				
			</div>
			<div class="col-sm-10">
				<div class="row">
					<p class="comment-writer col-sm-10">권민규</p>
					<span class="col-sm-2">2021.02.06 10:00</span>
				</div>
				<p>수고하셨습니다.</p>
				<a href="#" class="reply-btn">
					<i class="bi bi-reply-fill">Reply</i>
				</a>
			</div>
		</div>
		<hr />
		<!-- comments end -->
	</div>
<!-- Post Comment -->
	<div class="container read-post">
		<p class="h3 read-post-title">Post a Comment</p>
		<hr />
		<form>
			<div class="row">
				<div class="form-group col-sm-2">
					<label for="">name</label> 
					<input type="email" class="form-control" id="" placeholder="이름">
				</div>
				<div class="col-sm-2"></div>
				<div class="form-group col-sm-5"></div>
				<div class="form-group col-lg-12">
					<label for="exampleFormControlTextarea1">comment</label>
					<textarea class="form-control" id="exampleFormControlTextarea1" rows="3"></textarea>
				</div>
			</div>
			<div class="col-md-12 read-btn">
				<button type="button" class="btn read-btn-send" onclick="location.href='plus'">
					<span>Send Message</span>
				</button>
				<button type="button" class="btn read-btn-list" >
					<span>목록</span>
				</button>
			</div>
		</form>
	</div>
</section>
<%@ include file="/WEB-INF/views/include/footer.jsp"%>