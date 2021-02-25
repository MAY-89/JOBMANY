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
				</div>

				</div>
				</div>
	</form>
	<div class="container text-center paging-block">
	<ul class="pagination justify-content-center pageBlock">
	</ul>
</div>
	<!-- 보드 끝 -->
</section>

<%@ include file="/WEB-INF/views/include/footer.jsp"%>

<script>
	var category = "";
	var page = 1;

	
	function printPage(data){
		var str = "";
		$(".pagination").html("");
		if(data.first){
			str += "<li class='page-item'>";
			str += "<a class='page-link prevBtn' href='#' >Previous</a>";
			str += "</li>";
		}
		for(var i = data.startPage; i <= data.endPage; i++){
			str += "<li ";
			if(data.cri.page == i){
				str+= "class='page-item active'";
			}
			str += " class='page-item'>";
			str += "<a class='page-link pageBtn' href='#'>"+i+"</a>";
			str += "</li>";
		}
		if(data.next){
			str += "<li class='page-item'>";
			str += "<a class='page-link nextBtn' href='#'>"; 
			str += "Next";
			str += "</a></li>";
		}
		$(".pagination").append(str);
	}
		
	
	window.onload = function() {
		getCommunityList(1);
	};
	
	$(".pagination").on("click",".page-item a",function(event){
		event.preventDefault();
		
		var page = this.text;
		if(category == 'resume'){
			getResumeList(page);
		}else{
			
			getCommunityList(page);
		}
		console.log(this.text);
	});

	$(".resumBtn").click(function() {
		category = "resume";
		getResumeList(1);
	});

	function getResumeList(page) {
		var url = "${root}/members/getMyList/${userInfo.uno}/resume/"+page;
		$(".resum").html("");
		$(".commu").html("");
		$.getJSON(url,function(data) {
			console.log(data);
			var str = "";
			str += "<div class='col board-list-size-right'>";
			str += "<div class='container board-list-size-right-boxing'>";
			str += "<div class='row board-list-size-right-box'>";
			$(data.list).each(function() {
				if (this == null) {
					str="없음";
				} else {
					str += "<div class='col list-box'>";
					str += "<div class='item2-title'>";
					str += "<span class='h5'><a href=";
					str += "${root}/resume/read?rno="+this.rno;
					str += ">";
					str += this.rname + "님의 이력서</a>";
					str += "</span>";
					str += "</div>";
					str += "<div class='row mt-0'>";
					str += "<div class='col-md-8 overflow-hidden item2-content'>";
					str += "<span>";
					if(this.introduce != null){
						str += this.introduce;
					}else{
						str += "자기소개서 없음";
					}
					str += "</span>";
					str += "</div>";
					str += "<div class='col item2-footer'>";
					str += "<span>📅<i>&nbsp;" + getDate(this.regdate) + "</i></span> <span>🖋<i>&nbsp;";
					str += this.rname + "</i></span> <span>✔️<i>&nbsp;";
					str += this.views + "</i></span>";
					str += "</div></div></div>";
				}
			});
			str +="</div></div></div>";
			$(".commu").html(str);
			printPage(data.pm);
		});
	}

	$(".commBtn").click(function() {
		category = "community";
		getCommunityList(1);
	});

	function getCommunityList(page) {
		var url = "${root}/members/getMyList/${userInfo.uno}/community/"+page;
		$(".commu").html("");
		$(".resum").html("");
		$.getJSON(url,function(data) {
			var str = "";
			str += "<div class='col board-list-size-right'>";
			str += "<div class='container board-list-size-right-boxing'>";
			str += "<div class='row board-list-size-right-box'>";
			
			$(data.list).each(function() {
							
						if (this == null) {
							str += "없음";
						} else {
							str += "<div class='col list-box'>";				
							str += "<div class='item3-title'>";
							str += "<span class='h5'><a href=";
							str += "${root}/community/readDetail?cbno="+this.cbno;
							str += ">";
							str += this.cbtitle	+ "</a>";
							str += "</span>";
							str += "</div>";
							str += "<div class='row mt-0'>";
							str += "<div class='col-md-9 overflow-hidden item3-content'>";
							str += "<span>"	+ this.cbcontent + "</span>";
							str += "</div>";
							str += "<div class='col item3-footer'>";
							str += "<span>📅<i>&nbsp;"+ getDate(this.cbregdate) + "</i></span> <span>🖋<i>&nbsp;";
							str += this.cbwriter + "</i></span> <span>✔️<i>&nbsp;";
							str += this.cbviewcnt + "</i></span>";
							str += "</div></div></div>";
						}
					});
			str += "</div></div></div>";
			$(".commu").append(str);
			printPage(data.pm);
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