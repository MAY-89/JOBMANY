<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/include/header.jsp"%>
<link rel="stylesheet"
	href=" ${pageContext.request.contextPath}/resources/css/community/list.css">
<style>
table tbody {
	cursor: pointer;
}
</style>
<div>
	<img src="${pageContext.request.contextPath }/resources/img/board/boardHeader.jpg" class="board-list-top-img" alt="...">
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
				<input class="form-control write-btn" type="submit"
					value="글쓰기" onclick="location.href='write'" />
			</div>
		</div>
	</div>
	<!-- 중단 게시글 목록  -->
	<div class="container board-list">
		<div class="row board-list-size">
			<!-- 왼쪽 -->
			<div class="col-lg-3 board-list-size-left">
				<div class="row board-list-size-left-top">
					<div class="col top-box">
						<span class="h3">Category</span>
						<!-- Category 카테고리 옵션 목록 -->
						<select name="searchType" class="from-control top-box-select" multiple>
							<option class="top-box-select-title" value="title">TITLE</option>
							<option class="top-box-select-content" value="content">CONTENT</option>
							<option class="top-box-select-writer" value="writer">WRITER</option>
						</select>
					</div>
					<div class="col center-box">
						
					</div>
					<div class="col bottom-box">
						<div class="row searchZone">
								<input type="text" name="keyword" class="form-control search-bar" value="" />
								<input type="submit" class="form-control search-btn" value="SEARCH" />
							</div>
					</div>
				</div>
			</div>
			<!-- 오른쪽 -->
			<div class="col-lg-9 board-list-size-right">
				<div class="container board-list-size-right-boxing">
					<div class="row board-list-size-right-box">
						<!-- 게시글 리스트(목록) 4개 -->
						<div class="col list-box">
							<div class="row list-box-item1">
								<div class="item1-title">
									<span class="h5">Title</span>
								</div>
								<div class="row mt-0 item1-content-box">
									<div class="col-md-9 overflow-hidden item1-content">
										<span>
											<!-- 문장 테스트 -->
											Since Bootstrap is developed to be mobile first,
											we use a handful of media queries to create sensible
											breakpoints for our layouts and interfaces.
											Since Bootstrap is developed to be mobile first,
											we use a handful of media queries to create sensible
											breakpoints for our layouts and interfaces.
										</span>
									</div>
									<div class="col item1-footer">
										<span><i class="bi bi-calendar3">&nbsp;2021.02.06</i></span>
										<span><i class="bi bi-pencil">&nbsp;writer</i></span>
										<span><i class="bi bi-person-plus">&nbsp;views.</i></span>
									</div>
								</div>
							</div>
						</div>
						<div class="col list-box">
							<div class="row list-box-item2">
								<div class="item2-title">
									<span class="h5">Title</span>
								</div>
								<div class="row mt-0">
									<div class="col-md-9 overflow-hidden item2-content">
										<span>
											<!-- 문장 테스트 -->
											Since Bootstrap is developed to be mobile first,
											we use a handful of media queries to create sensible
											breakpoints for our layouts and interfaces.
											Since Bootstrap is developed to be mobile first,
											we use a handful of media queries to create sensible
											breakpoints for our layouts and interfaces.
										</span>
									</div>
									<div class="col item2-footer">
										<span><i class="bi bi-calendar3">&nbsp;2021.02.06</i></span>
										<span><i class="bi bi-pencil">&nbsp;writer</i></span>
										<span><i class="bi bi-person-plus">&nbsp;views.</i></span>
									</div>
								</div>
							</div>
						</div>
						<div class="col list-box">
							<div class="row list-box-item3">
								<div class="item3-title">
									<span class="h5">Title</span>
								</div>
								<div class="row mt-0">
									<div class="col-md-9 overflow-hidden item3-content">
										<span>
											<!-- 문장 테스트 -->
											Since Bootstrap is developed to be mobile first,
											we use a handful of media queries to create sensible
											breakpoints for our layouts and interfaces.
											Since Bootstrap is developed to be mobile first,
											we use a handful of media queries to create sensible
											breakpoints for our layouts and interfaces.
										</span>
									</div>
									<div class="col item3-footer">
										<span><i class="bi bi-calendar3">&nbsp;2021.02.06</i></span>
										<span><i class="bi bi-pencil">&nbsp;writer</i></span>
										<span><i class="bi bi-person-plus">&nbsp;views.</i></span>
									</div>
								</div>
							</div>
						</div>
						<div class="col list-box">
							<div class="row list-box-item4 ">
								<div class="item4-title">
									<span class="h5">Title</span>
								</div>
								<div class="row mt-0">
									<div class="col-md-9 overflow-hidden item4-content">
										<span>
											<!-- 문장 테스트 -->
											Since Bootstrap is developed to be mobile first,
											we use a handful of media queries to create sensible
											breakpoints for our layouts and interfaces.
											Since Bootstrap is developed to be mobile first,
											we use a handful of media queries to create sensible
											breakpoints for our layouts and interfaces.
										</span>
									</div>
									<div class="col item4-footer">
										<span><i class="bi bi-calendar3">&nbsp;2021.02.06</i></span>
										<span><i class="bi bi-pencil">&nbsp;writer</i></span>
										<span><i class="bi bi-person-plus">&nbsp;views.</i></span>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- 보드 끝 -->
	<div class="CBoardPagination paging-block">
		<nav aria-label="...">
			<ul class="pagination justify-content-center">
				<li class="page-item disabled">
					<a class="page-link" href="#" tabindex="-1" aria-disabled="true">
						Previous
					</a>
				</li>
				<li class="page-item">
					<a class="page-link" href="#">1</a>
				</li>
				<li class="page-item active" aria-current="page">
					<a class="page-link" href="#">2</a>
				</li>
				<li class="page-item">
					<a class="page-link" href="#">3</a>
				</li>
				<li class="page-item">
					<a class="page-link" href="#">Next</a>
				</li>
			</ul>
		</nav>
	</div>
</section>
<%@ include file="/WEB-INF/views/include/footer.jsp"%>