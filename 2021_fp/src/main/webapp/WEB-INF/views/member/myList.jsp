<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/include/header.jsp"%>
<link rel="stylesheet" href=" ${pageContext.request.contextPath}/resources/css/member/myList.css">
<!-- 상단 이미지 -->
<div class="top-img">
	<img src="${pageContext.request.contextPath }/resources/img/member/loginImg.jpg" class="main-header-top-img" alt="...">
</div>
<section>
	<!-- 상단 타이틀 & 글쓰기 버튼 -->
	<div class="container board-title-top">
		<div class="row">
			<div class="col-md-10">
				<span class="h3 board-list-title-front">M</span>
				<span class="h3 board-list-title-tail">y list &nbsp; </span>
			</div>
		</div>
	</div>
	<!-- 중단 본문 -->
	<div class="container">
		<ul class="nav nav-tabs tabs-width">
	 		<li class="nav-item">
				<a class="nav-link active fav-comm-list" data-toggle="tab" href="#comm">커뮤니티</a>
			</li>
			<li class="nav-item">
				<a class="nav-link fav-resume-list" data-toggle="tab" href="#resu">이력서</a>
			</li>
		</ul>
	</div>
	<form action="">
	<div class="container">
		<div class="tab-content">
			<!-- 커뮤니티 -->
			<div class="tab-pane fade show active " id="comm">
				<div class="col board-list-size-right">
					<div class="container board-list-size-right-boxing">
						<div class="row board-list-size-right-box">
						<!-- 게시글 리스트(목록) 4개 -->
							<div class="col list-box">
								<div class="row list-box-item1">
									<div class="item1-title">
										<span class="h5"><a href="#">취업</a></span>
									</div>
									<div class="row mt-0 item1-content-box">
										<div class="col-md-9 overflow-hidden item1-content">
											<span>
												문장 테스트
												Since Bootstrap is develodped to be mobile first,
												we use a handful of media queries to create sensible
												breakpoints for our layouts and interfaces.
												Since Bootstrap is developed to be mobile first,
												we use a handful of media queries to create sensible
												breakpoints for our layouts and interfaces.
											</span>
										</div>
										<div class="col item1-footer">
											<span>📅<i>&nbsp;2021.02.06</i></span>
											<span>🖋<i>&nbsp;writer</i></span>
											<span>✔️<i>&nbsp;스크랩</i></span>
										</div>
									</div>
								</div>
							</div>
							<div class="col list-box">
								<div class="row list-box-item2">
									<div class="item2-title">
										<span class="h5"><a href="#">할 수</a></span>
									</div>
									<div class="row mt-0">
										<div class="col-md-9 overflow-hidden item2-content">
											<span>
												문장 테스트
												Since Bootstrap is developed to be mobile first,
												we use a handful of media queries to create sensible
												breakpoints for our layouts and interfaces.
												Since Bootstrap is developed to be mobile first,
												we use a handful of media queries to create sensible
												breakpoints for our layouts and interfaces.
											</span>
										</div>
										<div class="col item2-footer">
											<span>📅<i>&nbsp;2021.02.06</i></span>
											<span>🖋<i>&nbsp;writer</i></span>
											<span>✔️<i>&nbsp;스크랩</i></span>
										</div>
									</div>
								</div>
							</div>
							<div class="col list-box">
								<div class="row list-box-item3">
									<div class="item3-title">
										<span class="h5"><a href="#">있다!</a></span>
									</div>
									<div class="row mt-0">
										<div class="col-md-9 overflow-hidden item3-content">
											<span>
												문장 테스트
												Since Bootstrap is developed to be mobile first,
												we use a handful of media queries to create sensible
												breakpoints for our layouts and interfaces.
												Since Bootstrap is developed to be mobile first,
												we use a handful of media queries to create sensible
												breakpoints for our layouts and interfaces.
											</span>
										</div>
										<div class="col item3-footer">
											<span>📅<i>&nbsp;2021.02.06</i></span>
											<span>🖋<i>&nbsp;writer</i></span>
											<span>✔️<i>&nbsp;스크랩</i></span>
										</div>
									</div>
								</div>
							</div> <!-- 리스트 박스 끝 -->
						</div>
					</div>
				</div>
				<div class="container text-center paging-block">
					<ul class="pagination justify-content-center">
						<li class="page-item">
							<a class="page-link" href="#">Previous</a>
						</li>
						<li class="page-item"><a class="page-link" href="#">1</a></li>
						<li class="page-item"><a class="page-link" href="#">2</a></li>
						<li class="page-item"><a class="page-link" href="#">3</a></li>
						<li class="page-item"><a class="page-link" href="#">4</a></li>
						<li class="page-item"><a class="page-link" href="#">5</a></li>
						<li class="page-item">
							<a class="page-link" href="#">Next</a>
						</li>
					</ul>
				</div>
			</div>
			<!-- 이력서 -->
			<div class="tab-pane fade" id="resu">
		    	<div class="col board-list-size-right">
					<div class="container board-list-size-right-boxing">
						<div class="row board-list-size-right-box">
						<!-- 게시글 리스트(목록) 4개 -->
							<div class="col list-box">
								<div class="row list-box-item1">
									<div class="item1-title">
										<span class="h5"><a href="#">하다보면 된다!</a></span>
									</div>
									<div class="row mt-0 item1-content-box">
										<div class="col">
											<ul>
												<li class="resume-info">이름 :<span> 양명안</span></li>
												<li class="resume-info">직종 :<span> 사장</span></li>
												<li class="resume-info">경력 :<span> 10년</span></li>
											</ul>
										</div>
										<div class="col-md-6 overflow-hidden item1-content">
											<span>
												문장 테스트
												Since Bootstrap is developed to be mobile first,
												we use a handful of media queries to create sensible
												breakpoints for our layouts and interfaces.
												Since Bootstrap is developed to be mobile first,
												we use a handful of media queries to create sensible
												breakpoints for our layouts and interfaces.
											</span>
										</div>
										<div class="col item1-footer">
											<span>📅<i>&nbsp;2021.02.06</i></span>
											<span>🖋<i>&nbsp;writer</i></span>
											<span>✔️<i>&nbsp;스크랩</i></span>
										</div>
									</div>
								</div>
							</div>
							<div class="col list-box">
								<div class="row list-box-item1">
									<div class="item1-title">
										<span class="h5"><a href="#">성장하는 괴물입니다.!</a></span>
									</div>
									<div class="row mt-0 item1-content-box">
										<div class="col">
											<ul>
												<li class="resume-info">이름 :<span> 장인제</span></li>
												<li class="resume-info">직종 :<span> 부사장</span></li>
												<li class="resume-info">경력 :<span> 7년</span></li>
											</ul>
										</div>
										<div class="col-md-6 overflow-hidden item1-content">
											<span>
												문장 테스트
												Since Bootstrap is developed to be mobile first,
												we use a handful of media queries to create sensible
												breakpoints for our layouts and interfaces.
												Since Bootstrap is developed to be mobile first,
												we use a handful of media queries to create sensible
												breakpoints for our layouts and interfaces.
											</span>
										</div>
										<div class="col item1-footer">
											<span>📅<i>&nbsp;2021.02.06</i></span>
											<span>🖋<i>&nbsp;writer</i></span>
											<span>✔️<i>&nbsp;스크랩</i></span>
										</div>
									</div>
								</div>
							</div>
							<div class="col list-box">
								<div class="row list-box-item1">
									<div class="item1-title">
										<span class="h5"><a href="#">부숴져도 앞으로만 가지!</a></span>
									</div>
									<div class="row mt-0 item1-content-box">
										<div class="col">
											<ul>
												<li class="resume-info">이름 :<span> 권민규</span></li>
												<li class="resume-info">직종 :<span> 상무</span></li>
												<li class="resume-info">경력 :<span> 6년</span></li>
											</ul>
										</div>
										<div class="col-md-6 overflow-hidden item1-content">
											<span>
												문장 테스트
												Since Bootstrap is developed to be mobile first,
												we use a handful of media queries to create sensible
												breakpoints for our layouts and interfaces.
												Since Bootstrap is developed to be mobile first,
												we use a handful of media queries to create sensible
												breakpoints for our layouts and interfaces.
											</span>
										</div>
										<div class="col item1-footer">
											<span>📅<i>&nbsp;2021.02.06</i></span>
											<span>🖋<i>&nbsp;writer</i></span>
											<span>✔️<i>&nbsp;스크랩</i></span>
										</div>
									</div>
								</div>
							</div><!-- 리스트 끝  -->
						</div>
					</div>
				</div>
				<div class="container text-center paging-block">
					<ul class="pagination justify-content-center">
						<li class="page-item">
							<a class="page-link" href="#">Previous</a>
						</li>
						<li class="page-item"><a class="page-link" href="#">1</a></li>
						<li class="page-item"><a class="page-link" href="#">2</a></li>
						<li class="page-item"><a class="page-link" href="#">3</a></li>
						<li class="page-item"><a class="page-link" href="#">4</a></li>
						<li class="page-item"><a class="page-link" href="#">5</a></li>
						<li class="page-item">
							<a class="page-link" href="#">Next</a>
						</li>
					</ul>
				</div>
			</div>
		</div>
	</div>
	</form>
	<!-- 보드 끝 -->
	<!-- <div class="container text-center paging-block">
		<ul class="pagination justify-content-center">
			<li class="page-item">
				<a class="page-link" href="#">Previous</a>
			</li>
			<li class="page-item"><a class="page-link" href="#">1</a></li>
			<li class="page-item"><a class="page-link" href="#">2</a></li>
			<li class="page-item"><a class="page-link" href="#">3</a></li>
			<li class="page-item"><a class="page-link" href="#">4</a></li>
			<li class="page-item"><a class="page-link" href="#">5</a></li>
			<li class="page-item">
				<a class="page-link" href="#">Next</a>
			</li>
		</ul>
	</div> -->
</section>
<script>
	var btnList = document.getElementById("btnList");
	var myListTitle = document.getElementById("myListTitle"); 
	btnList.onclick = function(){
		
		if(btnList.value == "MyScrapList"){
			btnList.setAttribute("value","MyWriteList");
			myListTitle.innerHTML = "SCRAP";
		}else{
			btnList.setAttribute("value","MyScrapList");
			myListTitle.innerHTML = "My Writes";
		}
	};
</script>
<%@ include file="/WEB-INF/views/include/footer.jsp"%>