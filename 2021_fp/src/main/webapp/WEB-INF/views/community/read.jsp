<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="f" uri="http://java.sun.com/jsp/jstl/fmt"%>
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<%@ include file="/WEB-INF/views/include/header.jsp"%>

<link rel="stylesheet"
	href=" ${pageContext.request.contextPath}/resources/css/community/read.css">
<!-- 상단 이미지 -->
<div>
	<img
		src="${pageContext.request.contextPath }/resources/img/board/boardHeader.jpg"
		class="main-header-top-img" alt="...">
</div>
<section>
	<div class="container">
		<div class="container read-top">
			<div class="row">
				<div class="col-md-10">
					<span class="h3 read-title-front">C</span> <span
						class="h3 read-title-tail">ommunity Board list &nbsp; </span>
				</div>
			</div>
		</div>
		<!-- title -->
		<div class="col ">
			<div class="row readTitle">
				<p class="h3">${communityBoardVO.cbtitle}</p>
			</div>
			<ul class="list-group list-group-horizontal" style="padding: 0;">
				<li class="list-group-item read read-writer">🖋&nbsp;${communityBoardVO.cbwriter}</li>
				<li class="list-group-item read read-views">👥<i>
						${communityBoardVO.cbviewcnt}</i>
				</li>
				<li class="list-group-item read read-day">📅<i>
				<f:formatDate var="reg" pattern="yyyy.MM.dd HH:mm" value="${communityBoardVO.cbregdate}"/>
					<c:choose>
						<c:when test="${now eq reg}">
							<f:formatDate pattern="HH:mm" value=""/>
						</c:when>
						<c:otherwise>
							${reg}
						</c:otherwise>
					</c:choose>
				</i>
				</li>
				<li class="list-group-item read read-comments"><i
					class="bi bi-chat-right-dots"> ${commentCount}</i></li>

			</ul>
		</div>
		<!-- read main -->
		<div class="col read-content">
			<div class="col read-content-inner">
				<p>${communityBoardVO.cbcontent}</p>
			</div>
		</div>
		<!-- read footer -->

		<div class="read-btns">

			<!-- 모두 -->
			<input type="button" id="listBtn" class="btn read-btn-list" value="목록" />
			<!-- 내 글일 때 -->
			
				<c:if test="${not empty userInfo}">
					<c:if test="${userInfo.uno eq communityBoardVO.uno}">
						<input type="button" id="removeBtn" class="btn read-btn-list" value="삭제" />
						<input type="button" id="modifyBtn" class="btn read-btn-list" value="수정" />
						<c:choose>
							
							<c:when test="${likeyYN != 1}">
								<input type="button" id="likeBtn" value="🖤"/>
							</c:when>
							<c:otherwise>
								<input type="button" id="likeBtn" value="❤"/>
							</c:otherwise>
						</c:choose>
					</c:if>
				</c:if>
			

		</div>
		<form id="readForm" method="post">
			<input type="hidden" id="likeyCbno" name="cbno" value="${communityBoardVO.cbno}" />
			<input type="hidden" name="page" value="${cri.page}" /> 
			<input type="hidden" name="perPageNum" value="${cri.perPageNum}" />
			<input type="hidden" name="searchType" value="${cri.searchType}" />
			<input type="hidden" name="keyword" value="${cri.keyword}" />
			<input type="hidden" id="likeyUno" name="uno" value="${communityBoardVO.uno}" />
		</form>
		<hr />

	</div>
	
	<!-- Post Comment -->
	<div class="container read-post">
		<p class="h3 read-post-title">Post a Comment</p>
		<hr />
		<form class="writeComment commentWrap">
			<div class="row">
				<div class="form-group col-sm-2">
					<label for="">name</label> <input type="email" class="form-control"
						id="" placeholder="이름" readonly value="${userInfo.uname}">
				</div>
				<div class="col-sm-2"></div>
				<div class="form-group col-sm-5"></div>
				<div class="form-group col-lg-12">
					<label for="exampleFormControlTextarea1">comment</label>
					<textarea class="form-control" name="cccontent" id="exampleFormControlTextarea1"
						rows="3"></textarea>
				</div>
			</div>
			<div class="col-md-12 read-btn">
				<input type="button" class="btn read-btn-send sendMessage" value="Send Message"/>
				<input type="hidden" name="cbno" value="${communityBoardVO.cbno}" />
				<input type="hidden" class="commentPosition" name="position" value="${communityCommentVO.position}"/>
			</div>
		</form>
	</div>
	
	
	
	
	<!-- Comment -->
	<div class="container read-comment">
		<p class="h3 read-comment-title">&nbsp;&nbsp;Comment</p>
		<hr />
		<!-- comments view -->
		<c:choose>
		<c:when test="${not empty list}">
		<c:forEach var="communityCommentVO" items="${list}">
		<div class="commentWrap">
			<div class="row read-comment-item">
				<c:choose>
				<c:when test="${communityCommentVO.ccshowboard ne 'N'}">
					<div class="col-sm-1"></div>
					<c:if test="${communityCommentVO.ccdepth eq 1}">
					<div class="col-sm-1"></div>
					</c:if>
					
					<div class="col-sm-10">
						<div class="row">
							<p class="comment-writer col-sm-10">${communityCommentVO.ccwriter}</p>
							<span class="col-sm-2 comment-format">
								<f:formatDate value="${communityCommentVO.ccregdate}" pattern="yyyy.MM.dd HH:mm"/>						
							</span>
						</div>
						<p class="comment-content">${communityCommentVO.cccontent}</p>
						<c:if test="${communityCommentVO.ccdepth eq 0}">
							<a class="reply-btn"> <i class="bi bi-reply-fill">Reply</i></a>
						</c:if>
						<c:if test="${not empty userInfo}">
							<c:if test="${userInfo.uno eq communityCommentVO.uno}">
							<a class="delete-btn"> ❌<i>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</i></a>
							</c:if>
						</c:if>
					</div>
				</c:when>
				<c:otherwise>
					<div class="col-sm-1"></div>
					<div class="col-sm-10">삭제된 댓글입니다.</div>
				</c:otherwise>
				</c:choose>
			</div>
			<form class="WIFI writeComment" style="display:none;">
				<div class="row">
					<div class="form-group col-sm-2">
						<label for="">name</label> <input type="email" class="form-control"
							id="" placeholder="이름" readonly value="${userInfo.uname}">
					</div>
					<div class="col-sm-2"></div>
					<div class="form-group col-sm-5"></div>
					<div class="form-group col-lg-12">
						<label for="exampleFormControlTextarea1">comment</label>
						<textarea class="form-control" name="cccontent" id="exampleFormControlTextarea1"
							rows="3"></textarea>
					</div>
				</div>
				<div class="col-md-12 read-btn">
					<input type="button" class="btn read-btn-send sendMessage" value="Send Message"/>
				</div>
				<input type="hidden" class="boardCbno" name="cbno" value="${communityBoardVO.cbno}" />
				<input type="hidden" name="ccdepth" value=1 />
				<input type="hidden" class="commentCcno" name="ccno" value="${communityCommentVO.ccno}" />
				<input type="hidden" class="commentCcorigin" name="ccorigin" value="${communityCommentVO.ccorigin}" />
				<input type="hidden" class="commentCCdepth" value="${communityCommentVO.ccdepth}"/>
				<input type="hidden" class="commentPosition" name="position" value="${communityCommentVO.position}"/>
				</form>
			<hr/>
		</div>
		</c:forEach>
		</c:when>
		</c:choose>
		
		
		
		<!-- comments end -->
	</div>
	
</section>

<script>
	$(function(){
		if('${position}'>=1){
			window.scrollTo(0,'${position}');
		}
		
		
			
		
		var formObj = $("#readForm");
		
		$("#listBtn").click(function(){
			formObj.attr("action","list");
			formObj.attr("method","get");
			formObj.submit();
		});
		
		$("#removeBtn").click(function(){
			formObj.attr("action","remove").submit();
		});
		
		$("#modifyBtn").click(function(){
			formObj.attr("action","modify");
			formObj.attr("method","get");
			formObj.submit();
		});
		
		// 쌉중요 가장 가까운 요소 찾아가는 방법
		$(".reply-btn").click(function(){
			var obj = $(this).closest(".commentWrap").find(".WIFI");
			if(obj.css("display") == "none"){
				obj.show();
			} else {
				obj.hide();
			}
		});
		
		$(".sendMessage").click(function(){
			var position = $(window).scrollTop(); 
	        console.log(position);
	        
	       $(this).closest(".commentWrap").find(".commentPosition").val(position);
	       // el에 set으로 값을 주는 방법.
	        
			var obj = $(this).closest(".writeComment");
			obj.attr("action", "writeComment");
			obj.attr("method", "post");
			obj.submit();
			
		});
		
		$(".delete-btn").click(function(event){
			event.preventDefault();
			var obj = $(this).closest(".commentWrap").find(".boardCbno");
			var obj2 = $(this).closest(".commentWrap").find(".commentCcno");
			var obj3 = $(this).closest(".commentWrap").find(".commentCcorigin");
			var obj4 = $(this).closest(".commentWrap").find(".commentCcdepth");
	          
			var position = $(window).scrollTop(); 
	        console.log(position);

			
			
			location.href="removeComment?ccno="+obj2.val()+"&cbno="+obj.val()+"&ccorigin="+obj3.val()+"&ccdepth="+obj4.val()+"&position="+position;
		})
		
		$("#likeBtn").on("click",function(){
			var url = "like/"+$("#likeyCbno").val()+"/"+$("#likeyUno").val();
			$.ajax({
				type : "POST",
				url : url,
				contentType : "application/x-www-form-urlencoded; charset=UTF-8",
				success : function(){
					if($("#likeBtn").val()==="❤"){
						$("#likeBtn").val('🖤');
					}else{
						$("#likeBtn").val('❤');
					}
				}
			});
		});
	});
</script>


<%@ include file="/WEB-INF/views/include/footer.jsp"%>