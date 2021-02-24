<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/include/header.jsp"%>
<link rel="stylesheet"
	href=" ${pageContext.request.contextPath}/resources/css/member/myList.css">
<!-- 상단 이미지  -->
<div class="top-img">
	<img
		src="${pageContext.request.contextPath }/resources/img/member/loginImg.jpg"
		class="main-header-top-img" alt="...">
</div>
<section>
	<!-- 상단 타이틀 & 글쓰기 버튼 -->
	<div class="container board-title-top">
		<div class="row">
			<div class="col-md-10">
				<span class="h3 board-list-title-front">M</span> <span
					class="h3 board-list-title-tail">y list &nbsp; </span>
			</div>
		</div>
	</div>
	<!-- 중단 본문 -->
	<div class="container">
		<ul class="nav nav-tabs tabs-width">
			<li class="nav-item"><a
				class="nav-link active fav-comm-list commBtn" data-toggle="tab"
				href="#commu">커뮤니티</a></li>
			<li class="nav-item"><a
				class="nav-link fav-resume-list resumBtn" data-toggle="tab"
				href="#resum">이력서</a></li>
		</ul>
	</div>
	<form action="" method="POST">
		<div class="container">
			<div class="tab-content">
				<!-- 커뮤니티 -->
				<div class="tab-pane fade show active commu" id="#commu">
					<%-- <div class="col board-list-size-right">
						<div class="container board-list-size-right-boxing">
							<div class="row board-list-size-right-box">
								<c:choose>
									<c:when test="${category == 'community'}">
										<c:choose>
											<c:when test="${empty list }">없음</c:when>
											<c:otherwise>
												<c:forEach items="${list }" var="board">
													<div class="col list-box">
														<div class="row list-box-item3">
															<div class="item3-title">
																<span class="h5"> <a href="${i}">${board.cbtitle}</a>
																</span>
															</div>
															<div class="row mt-0">
																<div class="col-md-9 overflow-hidden item3-content">
																	<span> ${i.cbcontent} </span>
																</div>
																<div class="col item3-footer">
																	<span>📅<i>&nbsp; ${board.cbregdate} </i></span> <span>🖋<i>&nbsp;
																			${board.cbwriter} </i></span> <span>✔️<i>&nbsp;
																			${board.cbviewcnt} </i></span> <span>✔️<i>&nbsp;
																			${board.cbviewcnt} </i></span>
																</div>
															</div>
														</div>
													</div>
													<!-- 리스트 박스 끝 -->
												</c:forEach>
											</c:otherwise>
										</c:choose>
									</c:when>
								</c:choose>
								<!-- 페이징 -->
								
							</div>
						</div>
					</div> --%>
				</div>
				<!-- 이력서 -->
				<!-- 
				<div class="tab-pane fade resum" id="#resum">
					<div class="col board-list-size-right">
						<div class="container board-list-size-right-boxing">
							<div class="row board-list-size-right-box">
								
								<c:choose>
									<c:when test=" ${category eq 'resume' } ">
										<c:forEach var="r" items=" ${list} ">
											<div class="col list-box">
												<div class="row list-box-item1">
													<div class="item1-title">
														<span class="h5"> <a
															href="/resume/read?rno=${r.rno } "> ${r.rname}의 이력서 </a>
														</span>
													</div>
													<div class="row mt-0 item1-content-box">
														<div class="col">
															<ul>
																<li class="resume-info">이름 :<span>
																		${r.rname} </span></li>
															</ul>
														</div>
														<div class="col-md-6 overflow-hidden item1-content">
															<span> ${r.introduce} </span>
														</div>
														<div class="col item1-footer">
															<span>📅<i>&nbsp;${r.regdate} </i></span> <span>🖋<i>&nbsp;${r.rname}
															</i></span> <span>✔️<i>&nbsp;이력서 좋아요 여부</i></span>
														</div>
													</div>
												</div>
											</div>
										</c:forEach>
									</c:when>
								</c:choose>
							</div>
							 -->
						</div>
					</div>
					<!-- 페이징 블럭 -->
					<div class="container text-center paging-block">
						<ul class="pagination justify-content-center">
							<c:if test="${pm.first }">
								<li class="page-item"><a class="page-link"
									href="myList${pm.makeQuery(1) }">Previous</a></li>
							</c:if>
							<c:forEach var="i" begin="${pm.startPage }" end="${pm.endPage }">
								<li class="page-item ${pm.cri.page == i ? 'class=active' : '' }">
									<a class="page-link" href="myList${pm.makeQuery(i) }">${i }</a>
								</li>
							</c:forEach>
							<c:if test="${pm.next }">
								<li class="page-item"><a class="page-link"
									href="myList${pm.makeQuery(pm.endPage+1) }">Next</a></li>
							</c:if>
						</ul>
					</div>
					<!-- 페이징 블럭 끝 -->
				</div>
			</div>
	</form>
	<!-- 보드 끝 -->
</section>

<%@ include file="/WEB-INF/views/include/footer.jsp"%>
<script>
	var category = "";

	window.onload = function() {
		getCommunityList();
	};

	$(".resumBtn").click(function() {
		category = "resume";
		console.log("보바야");
		getResumeList();
	});

	function getResumeList() {
		var url = "${root}/members/getMyList/${userInfo.uno}/resume";
		var i = 0;
		$(".resum").html("");
		$(".commu").html("");
		$.getJSON(url,function(data) {
			console.log(data);
			var str = "";
			var list = data.list;
			console.log(list);
			$(data).each(function() {
				str += "<div class='col board-list-size-right'>";
				str += "<div class='container board-list-size-right-boxing'>";
				str += "<div class='row board-list-size-right-box'>";
				if (this.list == null) {
					없음
				} else {
					str += "<div class='col list-box'>";
					str += "<div class='item2-title'>";
					str += "<span class='h5'><a href=" + this.list[i].rno+">";
					str += this.list[i].rname + "님의 이력서</a>";
					str += "</span>";
					str += "</div>";
					str += "<div class='row mt-0'>";
					str += "<div class='col-md-8 overflow-hidden item2-content'>";
					str += "<span>"	+ this.list[i].introduce + "</span>";
					str += "</div>";
					str += "<div class='col item2-footer'>";
					str += "<span>📅<i>&nbsp;" + getDate(this.list[i].regdate) + "</i></span> <span>🖋<i>&nbsp;";
					str += this.list[i].rname + "</i></span> <span>✔️<i>&nbsp;";
					str += this.list[i].views + "</i></span>";
					str += "</div></div></div></div></div></div></div></div>";
				}
				i++;
			});
			$(".commu").html(str);
		});
	}

	$(".commBtn").click(function() {
		category = "community";
		console.log("바보야");
		getCommunityList();
	});

	function getCommunityList() {
		var url = "${root}/members/getMyList/${userInfo.uno}/community";
		var i = 0;
		$(".commu").html("");
		$(".resum").html("");
		$.getJSON(url,function(data) {
			console.log(data);
			var str = "";
			$(data)
				.each(
					function() {
						str += "<div class='col board-list-size-right'>";
						str += "<div class='container board-list-size-right-boxing'>";
						str += "<div class='row board-list-size-right-box'>";
						if (this.list == null) {
							없음
						} else {
							str += "<div class='col list-box'>";
							str += "<div class='item3-title'>";
							str += "<span class='h5'><a href=" + this.list[i].cbno+">";
							str += this.list[i].cbtitle	+ "</a>";
							str += "</span>";
							str += "</div>";
							str += "<div class='row mt-0'>";
							str += "<div class='col-md-9 overflow-hidden item3-content'>";
							str += "<span>"	+ this.list[0].cbcontent + "</span>";
							str += "</div>";
							str += "<div class='col item3-footer'>";
							str += "<span>📅<i>&nbsp;"+ getDate(this.list[i].cbregdate) + "</i></span> <span>🖋<i>&nbsp;";
							str += this.list[i].cbwriter + "</i></span> <span>✔️<i>&nbsp;";
							str += this.list[i].cbviewcnt + "</i></span>";
							str += "</div></div></div></div></div></div></div></div>";
						}
						i++;
					});
			$(".commu").append(str);
		});
	}
	
	function getDate(timeValue){
		var dateObj = new Date(timeValue);
		var year = dateObj.getFullYear();
		var month = dateObj.getMonth()+1;
		var day = dateObj.getDate();
		var hour = dateObj.getHours();
		var minute = dateObj.getMinutes();
		var second = dateObj.getSeconds();
		
		var time = year+"/"+month+"/"+day+" "+hour+":"+minute+":"+second;
		return time;
	}
</script>