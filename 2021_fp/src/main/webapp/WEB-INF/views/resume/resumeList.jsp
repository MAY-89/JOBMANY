<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/include/header.jsp"%>
<link rel="stylesheet" href=" ${pageContext.request.contextPath}/resources/css/resume/resumeList.css">
<!-- 상단 이미지 -->
<div>
	<img src="${pageContext.request.contextPath }/resources/img/resume/resume.jpg" class="main-header-top-img" alt="...">
</div>
<br/><br/><br/><br/><br/><br/><br/>

<section class="container resumeList">
	<div class="container resume-top">
		<div class="row">
			<div class="col-md-10">
				<span class="h3 resume-title-front">H</span>
				<span class="h3 resume-title-tail">ot Resume &nbsp; </span>
			</div>
			<div class="col-md-2">
				<input class="form-control resume-btn" type="button" value="이력서" onclick="location.href='resume'" />
			</div>
		</div>
	</div>
	<div class="container">
	<c:choose>
		<c:when test="${empty likeList }">
			<div class="row">
				<p>등록된 게시물이 없습니다.</p>
			</div>		
		</c:when>
		<c:otherwise>
			<c:forEach var="r" items="${likeList }" >
				<div class="col-sm-4 hotcard" onclick="location.href='readResume${pm.makeQuery(cri.page)}&rno=${r.rno}'">
					<div class="shadow p-2 mb-4 bg-white rounded resume-top-box">
						<div class="card mb-3" style="max-width: 18rem; max-height: 200px;">
						  <div class="row no-gutters">
						    <div class="col-sm-5 hidden-xs hidden-sm">                                             
						      <img style="width:100px; height:200px; "src="${pageContext.request.contextPath}/upload/${r.pic}" alt="${r.rname }의 사진">
						    </div>
						    <div class="col-sm-7" >
						      <div class="card-body" style="max-height: 200px;">
						        <h5 class="card-title">${r.rname }님의<br/> 이력서</h5>
						        <p class="card-text1">${r.introduce }</p>
						        <p class="card-text timebox"><small class="text-muted"><f:formatDate value="${r.regdate}" dateStyle="medium"/></small></p>
						        <p class="card-text"><small class="text-muted">👍 ${r.likecnt}&nbsp;&nbsp;&nbsp;조회수 ${r.views}</small></p>
						      </div>
						    </div>
						  </div>
						</div>
					</div>
				</div><!-- col-sm-4 END -->
			</c:forEach>
		</c:otherwise>
	</c:choose>
	</div>
</section>
<hr/>
<section class="container resume-board" style="width: 1000px;">
	<div class="container resume-list">
		<div class="row">
			<div class="col-md-10">
				<span class="h3 resume-title-front">L</span>
				<span class="h3 resume-title-tail">ist Board &nbsp; </span>
			</div>
			<div class="col-md-2">
				<input class="form-control resume-btn" type="submit" value="이력서" onclick="location.href='resume'" />
			</div>
		</div>
	</div>
	<div class="row">
		<div class="col">
			<select name="searchType">
				<option value="n">---------------------</option>
				<option value="t">제목</option>
				<option value="c">내용</option>
				<option value="w">작성자</option>
				<option value="tc">제목&amp;&amp;내용</option>
				<option value="cw">내용&amp;&amp;작성자</option>
				<option value="tcw">제목&amp;&amp;내용&amp;&amp;작성자</option>
			</select>
			<input type="text" id="keyword" name="keyword"/>
			<input type="button" value="SEARCH" id="searchBtn" class=""/>
		</div>
	</div>
	<div class="listBoard">
		<table class="table">
		  <thead>
		    <tr>
		      <th scope="col">작성자</th>
		      <th scope="col">등록일</th>
		      <th scope="col">조회수</th>
		      <th scope="col">좋아요</th>
		    </tr>
		  </thead>
		  <tbody>
		  <%-- <jsp:useBean id="now" class="java.util.Date" />
		  <f:formatDate value="${now }" pattern="yyyy-MM-dd"/> --%>
		  <c:choose>
		  	<c:when test="${empty list }">
		  		<tr>
		  			<td colspan="4">등록된 이력서가 없습니다.</td>
		  		</tr>
		  	</c:when>
		  	<c:otherwise>
		  		<c:forEach var="r" items="${list}">
			  		<tr onclick="location.href='readResume${pm.makeQuery(cri.page)}&rno=${r.rno}'" class="tabledata">
			  			<td>${r.rname }</td>
			  			<f:formatDate value="${r.regdate }" var="reg" pattern="yyyy-MM-dd"/>
			  			<c:choose>
			  				<c:when test="${now eq reg}">
			  					<td><f:formatDate value="${r.regdate }" pattern="HH:mm"/> </td>
			  				</c:when>
			  				<c:otherwise>
			  					<td><f:formatDate value="${r.regdate}" dateStyle="long"/> </td>
			  				</c:otherwise>
			  			</c:choose>
			  			<td>${r.views }</td>
			  			<td>${r.likecnt }</td>
			  		</tr>
		  		</c:forEach>
		  	</c:otherwise>
		  </c:choose>
		  </tbody>
		</table>
	</div>
	<div class="container text-center">
	  <ul class="pagination justify-content-center">
		<c:if test="${pm.first }">
			<li class="page-item"><a href="resumeList${pm.makeQuery(1)}">&laquo;&laquo;</a></li>
		</c:if>
		<c:if test="${pm.prev}">
			<li class="page-item">
				<a href="resumeList${pm.makeQuery(pm.startPage-1)}">&laquo;</a>
			</li>
		</c:if>
		<c:forEach var="i" begin="${pm.startPage}" end="${pm.endPage}">
			<li class="page-item" ${pm.cri.page == i ? 'class=active' : ''}>
				<a href="resumeList${pm.makeQuery(i)}">${i}</a>
			</li>
		</c:forEach>
		<c:if test="${pm.next}">
			<li class="page-item">
				<a href="resumeList${pm.makeQuery(pm.endPage+1)}">&raquo;</a>
			</li>
		</c:if>
		<c:if test="${pm.last }">
			<li class="page-item"><a href="resumeList${pm.makeQuery(pm.maxPage)}">&raquo;&raquo;</a></li>
		</c:if>						
	</ul>
	  <!-- 
	  <ul class="pagination justify-content-center">
	    <li class="page-item">
	      <a class="page-link" href="#">Previous</a>
	    </li>
	    <li class="page-item"><a class="page-link" href="#">1</a></li>
	    <li class="page-item"><a class="page-link" href="#">2</a></li> aria-current="page" 페이지 선택시
	    <li class="page-item"><a class="page-link" href="#">3</a></li>
	    <li class="page-item"><a class="page-link" href="#">4</a></li>
	    <li class="page-item"><a class="page-link" href="#">5</a></li>
	    <li class="page-item">
	      <a class="page-link" href="#">Next</a>
	    </li>
	  </ul>
	   -->
	</div>
</section>
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
	<script>
	$("#searchBtn").click(function(){
		var searchType = $("select option:selected").val();
		var keyword = $("#keyword").val();
		location.href="resumeList?searchType="+searchType+"&keyword="+keyword;
	});
	
	
	
	
</script>
<%@ include file="/WEB-INF/views/include/footer.jsp"%>