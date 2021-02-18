<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/include/header.jsp"%>
<link rel="stylesheet" href=" ${pageContext.request.contextPath}/resources/css/member/myList.css">
<!-- 상단 이미지  -->
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
	<form action="" method="POST">
		<div class="container">
			<div class="tab-content">
				<!-- 커뮤니티 -->
				<div class="tab-pane fade show active " id="comm">
					<div class="col board-list-size-right">
						<div class="container board-list-size-right-boxing">
							<div class="row board-list-size-right-box">
							<!-- 게시글 리스트(목록) 4개 -->
								<c:choose>
									<c:when test="<%-- ${not empty 게시글 정보 } --%>">
										<c:forEach var="<%-- 사용할 변수 --%>" items="<%-- ${넘어온 모델 } --%>">
										<div class="col list-box">
											<div class="row list-box-item3">
												<div class="item3-title">
													<span class="h5">
														<a href="<%-- ${쿼리스트링 } --%>"><!-- ${커뮤니티 게시글 타이틀 } --></a>
													</span>
												</div>
												<div class="row mt-0">
													<div class="col-md-9 overflow-hidden item3-content">
														<span>
															<!-- ${커뮤니티 게시글 본문 } -->
														</span>
													</div>
													<div class="col item3-footer">
														<span>📅<i>&nbsp;<%-- ${커뮤니티 게시글 날짜 } --%></i></span>
														<span>🖋<i>&nbsp;<%-- ${커뮤니티 게시글 작성자 } --%></i></span>
														<span>✔️<i>&nbsp;<%-- ${커뮤니티 게시글 스크랩 여부 } --%></i></span>
													</div>
												</div>
											</div>
										</div> <!-- 리스트 박스 끝 -->
										</c:forEach>
									</c:when>
								</c:choose>
							</div>
						</div>
					</div>
					<!-- 페이징 블럭 -->
					<div class="container text-center paging-block">
						<ul class="pagination justify-content-center">
							<c:if test="${pm.first }">
								<li class="page-item">
									<a class="page-link" href="myList${pm.makeQuery(1) }">Previous</a>
								</li>
							</c:if>
							<c:forEach var="i" begin="${pm.startPage }" end="${pm.endPage }">
								<li class="page-item ${pm.cri.page == i ? 'class=active' : '' }">
									<a class="page-link" href="myList${pm.makeQuery(i) }">${i }</a>
								</li>
							</c:forEach>
							<c:if test="${pm.next }">
								<li class="page-item">
									<a class="page-link" href="myList${pm.makeQuery(pm.endPage+1) }">Next</a>
								</li>
							</c:if>
						</ul>
					</div>
				</div>
				<!-- 이력서 -->
				<div class="tab-pane fade" id="resu">
			    	<div class="col board-list-size-right">
						<div class="container board-list-size-right-boxing">
							<div class="row board-list-size-right-box">
							<!-- 게시글 리스트(목록) 4개 -->
							<c:choose>
								<c:when test="<%-- ${not empty 이력서 게시글 정보 } --%>">
									<c:forEach var="<%-- 사용할 변수 --%>" items="<%-- ${넘어온 이력서 모델 } --%>">
									<div class="col list-box">
										<div class="row list-box-item1">
											<div class="item1-title">
												<span class="h5">
													<a href="<%-- ${쿼리스트링 } --%>"><!-- ${이력서 게시글 타이틀 } --></a>
												</span>
											</div>
											<div class="row mt-0 item1-content-box">
												<div class="col">
													<ul>
														<li class="resume-info">이름 :<span><%-- ${이력서 게시글 작성자 } --%></span></li>
														<li class="resume-info">직종 :<span><%-- ${이력서 게시글 직종 } --%></span></li>
														<li class="resume-info">경력 :<span><%-- ${이력서 게시글 경력 } --%></span></li>
													</ul>
												</div>
												<div class="col-md-6 overflow-hidden item1-content">
													<span>
														<!-- ${이력서 게시글 본문 } -->
													</span>
												</div>
												<div class="col item1-footer">
													<span>📅<i>&nbsp;<%-- ${이력서 게시글 날짜 } --%></i></span>
													<span>🖋<i>&nbsp;<%-- ${이력서 게시글 닉네임 } --%></i></span>
													<span>✔️<i>&nbsp;<%-- ${이력서 게시글 스크랩 여부 } --%></i></span>
												</div>
											</div>
										</div>
									</div> <!-- 리스트 끝 -->
									</c:forEach>
								</c:when>
							</c:choose>
							</div>
						</div>
					</div>
					<!-- 페이징 블럭 -->
					<div class="container text-center paging-block">
						<ul class="pagination justify-content-center">
							<c:if test="${pm.first }">
								<li class="page-item">
									<a class="page-link" href="myList${pm.makeQuery(1) }">Previous</a>
								</li>
							</c:if>
							<c:forEach var="i" begin="${pm.startPage }" end="${pm.endPage }">
								<li class="page-item ${pm.cri.page == i ? 'class=active' : '' }">
									<a class="page-link" href="myList${pm.makeQuery(i) }">${i }</a>
								</li>
							</c:forEach>
							<c:if test="${pm.next }">
								<li class="page-item">
									<a class="page-link" href="myList${pm.makeQuery(pm.endPage+1) }">Next</a>
								</li>
							</c:if>
						</ul>
					</div> <!-- 페이징 블럭 끝 -->
				</div>
			</div>
		</div>
	</form>
	<!-- 보드 끝 -->
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