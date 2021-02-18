<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="f" uri="http://java.sun.com/jsp/jstl/fmt" %>
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<%@ include file="/WEB-INF/views/include/header.jsp"%>
<link rel="stylesheet"
	href=" ${pageContext.request.contextPath}/resources/css/community/list.css">
<style>
table tbody {
	cursor: pointer;
}
</style>
<div>
	<img src="${pageContext.request.contextPath }/resources/img/board/boardHeader.jpg" class="main-header-top-img" alt="...">
</div>

<section>
	<!-- 상단 타이틀 & 글쓰기 버튼 -->
	<div class="container board-title-top">
		<div class="row">
			<div class="col-md-10">
				<span class="h3 board-list-title-front">C</span>
				<span class="h3 board-list-title-tail">community Board list &nbsp; </span>
			</div>
			<div class="col-md-2">
			<c:if test="${not empty userInfo}">
				<input class="form-control write-btn" type="submit"
					value="글쓰기" onclick="location.href='write'" />
			</c:if>
			</div>
		</div>
	</div>
	<!-- 중단 게시글 목록  -->
	<div class="container board-list">
		<div class="row board-list-size">
			<form id="searchForm">
			<!-- 왼쪽 -->
			<div class="col-lg-3 board-list-size-left">
				<div class="row board-list-size-left-top">
					<div class="col top-box">
						<span class="h3">Category</span>
						<!-- Category 카테고리 옵션 목록 -->
						<select id="selectNum" name="searchType" class="from-control top-box-select" multiple>
							<option class="top-box-select-title" value="title" ${cri.searchType == 'title' ? 'selected' : ''}>TITLE</option>
							<option class="top-box-select-content" value="content" ${cri.searchType == 'content' ? 'selected' : ''}>CONTENT</option>
							<option class="top-box-select-writer" value="writer" ${cri.searchType == 'writer' ? 'selected' : ''}>WRITER</option>
						</select>
					</div>
					<div class="col center-box">
						
					</div>
					<div class="col bottom-box">
						<div class="row searchZone">
								<input type="text" name="keyword" class="form-control search-bar" value="${cri.keyword}" />
								<input type="button" id="searchBtn" class="form-control search-btn" value="SEARCH" />
						</div>
					</div>
				</div>
			</div>
			</form>
			<!-- 오른쪽 -->
			<div class="col-lg-9 board-list-size-right">
				<div class="container board-list-size-right-boxing">
					<div class="row board-list-size-right-box">
						<!-- 게시글 리스트(목록) 4개 -->
						<c:choose>
						<c:when test="${not empty list}">
						<c:forEach var="board" items="${list}">
						<div class="col list-box">
							<div class="row list-box-item1">
								<div class="item1-title">
									<span class="h5">
									<a href="read${pm.makeQuery(cri.page)}&cbno=${board.cbno}">
									${board.cbtitle}
									</a>
									</span>
								</div>
								<div class="row mt-0 item1-content-box">
									<div class="col-md-9 overflow-hidden item1-content">
										<span>
											${board.cbcontent}
										</span>
									</div>
									<div class="col item1-footer">
										<span>📅<i>&nbsp;
										<f:formatDate var="reg" pattern="yyyy.MM.dd" value="${board.cbregdate}"/>
										<c:choose>
												<c:when test="${now eq reg}">
													<f:formatDate pattern="HH:mm" value="${board.cbregdate}"/>
												</c:when>
												<c:otherwise>
													${reg}
												</c:otherwise>
											</c:choose>
										</i></span>
										<span>🖋<i>&nbsp;
										${board.cbwriter}
										</i></span>
										<span>👥<i>&nbsp;
										${board.cbviewcnt}
										</i></span>
									</div>
								</div>
							</div>
						</div>
						</c:forEach>
						</c:when>
						<c:otherwise>
							<div>
								게시물이 존재하지 않습니다.
							</div>
						</c:otherwise>
						</c:choose>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- 보드 끝 -->
	<div class="CBoardPagination paging-block">
		<nav aria-label="...">
			<ul class="pagination justify-content-center">
				
				<li class="page-item">
					<a class="page-link" href="list${pm.makeQuery(1)}">
						&laquo;&laquo;
					</a>
				</li>
				
				<c:if test="${pm.prev}">
					<li class="page-item">
						<a class="page-link" href="list${pm.makeQuery(pm.startPage-1)}">&laquo;</a>
					</li>
				</c:if>
				<c:forEach var="i" begin="${pm.startPage}" end="${pm.endPage}">
					<li class="page-item ${pm.cri.page == i ? ' active' : ''}" aria-current="page" >
						<a class="page-link" href="list${pm.makeQuery(i)}">${i}</a>
					</li>
				</c:forEach>
				<c:if test="${pm.next}">
					<li class="page-item">
						<a class="page-link" href="list${pm.makeQuery(pm.endPage+1)}">
							&raquo;
						</a>
					</li>
				</c:if>
				<c:if test="${pm.last}">
					<li class="page-item">
						<a class="page-link" href="list${pm.makeQuery(pm.maxPage)}">&raquo;&raquo;</a>
					</li>
				</c:if>
			</ul>
		</nav>
	</div>
</section>

<script>
	$(function(){
		$("#searchBtn").click(function(){
			$("#searchForm").submit();
		});
	});
</script>
<%@ include file="/WEB-INF/views/include/footer.jsp"%>