<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/include/header.jsp"%>
<link rel="stylesheet" href=" ${pageContext.request.contextPath}/resources/css/community/write.css">
<!-- 상단 이미지 -->
<div>
	<img src="${pageContext.request.contextPath }/resources/img/board/boardHeader.jpg" class="board-list-top-img" alt="...">
</div>
<section>
	<!-- 상단 타이틀 -->
	<div class="container write-title-top">
		<div class="row">
			<div class="col-md-10">
				<span class="h3 write-list-title-front">C</span>
				<span class="h3 write-list-title-tail">ommunity Board Write &nbsp; </span>
			</div>
		</div>
	</div>
	<div class="container">
		<div class="CBoardTopMargin">
			<form action="list">
				<div class="form-group">
					<label for="CBoardWriteTitle">title</label> <input type="text"
						class="form-control" id="CBoardWriteTitle" />
				</div>
				<div class="form-group">
					<label for="CBoardWriteContent">content</label>
					<textarea class="form-control" id="CBoardWriteContent" rows="7"></textarea>
				</div>
				<div class="row CBoardTopMargin">
					<div class="col-md-10"></div>
					<div class="col-md-2">
						<input class="form-control write-btn" type="submit"
							value="글쓰기"/>
					</div>
				</div>
			</form>
		</div>
	</div>
</section>
<%@ include file="/WEB-INF/views/include/footer.jsp"%>