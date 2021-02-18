<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="f" uri="http://java.sun.com/jsp/jstl/fmt"%>
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<%@ include file="/WEB-INF/views/include/header.jsp"%>
<link rel="stylesheet"
	href=" ${pageContext.request.contextPath}/resources/css/community/write.css">
<!-- 상단 이미지 -->
<div>
	<img
		src="${pageContext.request.contextPath }/resources/img/board/boardHeader.jpg"
		class="main-header-top-img" alt="...">
</div>
<section>

	<!-- 상단 타이틀 -->
	<div class="container write-title-top">
		<div class="row">
			<div class="col-md-10">
				<span class="h3 write-list-title-front">C</span> <span
					class="h3 write-list-title-tail">ommunity Board Modify &nbsp;
				</span>
			</div>
		</div>
	</div>
	<div class="container">
		<div class="CBoardTopMargin">
			<form action="modify" method="POST">
				<div class="form-group">
					<label for="CBoardWriteTitle">title</label> <input type="text"
						name="cbtitle" class="form-control" id="CBoardWriteTitle" value="${communityBoardVO.cbtitle}" />
				</div>
				<div class="form-group">
					<label for="CBoardWriteContent">content</label>
					<textarea class="form-control" name="cbcontent" id="CBoardWriteContent" rows="7">${communityBoardVO.cbcontent}</textarea>
				</div>
				<div class="row CBoardTopMargin">
					<div class="col-md-10"></div>
					<div class="col-md-2">
						<input class="form-control write-btn" type="submit" value="글쓰기" />
					</div>
				</div>
				
			<input type="hidden" name="cbno" value="${communityBoardVO.cbno}" />
			<input type="hidden" name="page" value="${cri.page}" /> 
			<input type="hidden" name="perPageNum" value="${cri.perPageNum}" />
			<input type="hidden" name="searchType" value="${cri.searchType}" />
			<input type="hidden" name="keyword" value="${cri.keyword}" />
		</form>
			
		</div>
	</div>
	
</section>
<%@ include file="/WEB-INF/views/include/footer.jsp"%>