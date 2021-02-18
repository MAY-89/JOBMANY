<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/include/header.jsp" %>
<link rel="stylesheet" href=" ${pageContext.request.contextPath}/resources/css/main.css">
<header class="main-header">
	<div class="main-header-top">
		<img src="${pageContext.request.contextPath }/resources/img/main/mainHeader.jpg" class="main-header-top-img" alt="...">
		<div class="container">
			<div class="row main-header-top-img-text">
				<div class="col-lg-12">
					<span class="h1 main-header-top-img-text-top">당</span>
					<span class="h1 main-header-top-img-text-top-second">신의,</span>
				</div>
				<div class="col">
					<span class="h4 main-header-top-img-text-bottom">방문을 환영합니다.</span>
				</div>
				<div class="col-lg-12">
					<span class="h3 main-header-top-img-text-top2">자격을,</span>
				</div>
				<div class="col">
					<span class="h3 main-header-top-img-text-bottom2">증명하세요.</span>
				</div>
			</div>
		</div>
	</div>
</header>
<section class="bravo-text">
	<div class="container section-main">
		<div class="row section-main-body">
			<div class="col align-items-center">
				<div class="col main-inner-item-left-top">
					
				</div>
				<div class="col main-inner-item-left-center">
					<span>북도령 권민규</span>
				</div>
				<div class="col main-inner-item-left-bottom">
					One of three columns
				</div>
			</div>
			<div class="line"></div>
			<div class="col align-items-center">
				<div class="col main-inner-item-center-top">
					
				</div>
				<div class="col main-inner-item-center-center">
					<span>잠좀자라 양명안</span>
				</div>
				<div class="col main-inner-item-center-bottom">
					One of three columns
				</div>
			</div>
			<div class="line"></div>
			<div class="col align-items-center">
				<div class="col main-inner-item-right-top">
					
				</div>
				<div class="col main-inner-item-right-center">
					<span>졸린다 장인제</span>
				</div>
				<div class="col main-inner-item-right-bottom">
					One of three columns
				</div>
			</div>
		</div>
	</div>
	<hr style="margin-top:80px;"/>
</section>
<section class="like-board">
	<div class="container">
		<div class="row">
			<!-- 커뮤니티 -->
			<div class="col cboard">
				<div class="container">
					<h1 class="title">커뮤니티</h1>
					<hr/>
				</div>
				<ul class="nav nav-tabs">
					<li class="nav-item">
						<a class="nav-link active" data-toggle="tab" href="#cmonth">
						월간
						</a>
					</li>
					<li class="nav-item">
						<a class="nav-link" data-toggle="tab" href="#cweek">
						주간
						</a>
					</li>
					<li class="nav-item">
						<a class="nav-link" data-toggle="tab" href="#cday">
						일간
						</a>
					</li>
				</ul>
				<div class="tab-content">
					<div class="tab-pane fade show active" id="cmonth">
						<table>
							<tr>
								<th>1</th>
								<td class="ttile">
									<a href="#">제목</a>
								</td>
								<td>🖋<i>writer</i></td>
								<td class="tview">💬<i>view</i></td>
							</tr>
						</table>
					</div>
					<div class="tab-pane fade" id="cweek">
						<table>
							<tr>
								<th>1</th>
								<td class="ttile">
									<a href="#">제목</a>
								</td>
								<td>🖋<i>writer</i></td>
								<td class="tview">💬<i>view</i></td>
							</tr>
						</table>
					</div>
					<div class="tab-pane fade" id="cday">
						<table>
							<tr>
								<th>1</th>
								<td class="ttile">
									<a href="#">제목</a>
								</td>
								<td>🖋<i>writer</i></td>
								<td class="tview">💬<i>view</i></td>
							</tr>
						</table>
					</div>
				</div>
			</div>
			<!-- 이력서 -->
			<div class="col rboard">
				<div class="container">
					<h1 class="title">이력서</h1>
					<hr/>
				</div>
				<ul class="nav nav-tabs">
					<li class="nav-item">
						<a class="nav-link active" data-toggle="tab" href="#rmonth">
						월간
						</a>
					</li>
					<li class="nav-item">
						<a class="nav-link" data-toggle="tab" href="#rweek">
						주간
						</a>
					</li>
					<li class="nav-item">
						<a class="nav-link" data-toggle="tab" href="#rday">
						일간
						</a>
					</li>
				</ul>
				<div class="tab-content">
					<div class="tab-pane fade show active" id="rmonth">
						<table>
							<tr>
								<th>1</th>
								<td class="ttile">
									<a href="#">
									🖋<i>writer</i>
									</a>님의 이력서
								</td>
								<td class="tlike">📬<i>like</i></td>
							</tr>
						</table>
					</div>
					<div class="tab-pane fade" id="rweek">
						<table>
							<tr>
								<th>1</th>
								<td class="ttile">
									<a href="#">
									🖋<i>writer</i>
									</a>님의 이력서
								</td>
								<td class="tlike">📬<i>like</i></td>
							</tr>
						</table>
					</div>
					<div class="tab-pane fade" id="rday">
						<table>
							<tr>
								<th>1</th>
								<td class="ttile">
									<a href="#">
									🖋<i>writer</i>
									</a>님의 이력서
								</td>
								<td class="tlike">📬<i>like</i></td>
							</tr>
						</table>
					</div>
				</div>
			</div>
		</div>
	</div>
</section>
<!-- <div class="overflow-hidden cb-content">
	<span>
	문장 테스트 
		Since Bootstrap is developed to be mobile first,
		we use a handful of media queries to create sensible
		breakpoints for our layouts and interfaces.
		Since Bootstrap is developed to be mobile first,
		we use a handful of media queries to create sensible
		breakpoints for our layouts and interfaces.
	</span>
</div> -->
<%@ include file="/WEB-INF/views/include/footer.jsp" %>

<script>
	var message = '${message}';
	var wrongAccept = '${wrongAccept}';
	if(message != null && !message == ""){
		alert(message);
	}

	if(wrongAccept != null && !wrongAccept == ""){
		alert(wrongAccept);
		
	}

	/*
	$(function(){
		
		$.ajax({
			method : "get",
			url : "resume/mainList",
			contentType: "application/x-www-form-urlencoded; charset=UTF-8",
			success : function(data) {
				console.log(data);
				$(data).each(function(){
					var html = "";
					html += "<tr>";
					html += "<td>"+this.rno;
					html += "</td>";
					html += "<td>"+this.rname+"님의 이력서";
					html += "</td>";
					html += "<td>"+this.likecnt;
					html += "</td>";
					html += "</tr>";
					$("table").append(html);
				});
			}
		});
	
	});
	*/
	

	
</script>