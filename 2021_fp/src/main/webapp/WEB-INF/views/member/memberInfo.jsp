<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/include/header.jsp"%>
<link rel="stylesheet" href=" ${pageContext.request.contextPath}/resources/css/member/memberInfo.css">
<!-- 상단 이미지 -->
<div class="top-img">
	<img src="${pageContext.request.contextPath}/resources/img/member/loginImg.jpg" class="sign-header-top-img" alt="...">
</div>

<style>
	.hiddenMember{
		display: none;
	}
	.imgView{
		width: 200px;
	}
	
</style>
<div class="top-img">
	<img src="${pageContext.request.contextPath}/resources/img/member/loginImg.jpg" class="sign-header-top-img" alt="...">
</div>
<section>
	<div class="container">
	<div class="m-auto w-75 info-box">
			<div class="shadow p-3 pl-3 mb-5 rounded w-75 m-auto memberBoxing" >
				<form id="signForm" action="modifyMember" method="post" encType="multipart/form-data">
				 <div class="form-row inline">
				    <div class="form-group col-md-12 mb-0">
				    	<div class="row align-items-center">
				    		<div class="form-group col-md-6 sign-epw">
							<h2 id="title">회원 정보 확인</h2>
						      <label for="userEmaill">Email</label>
						      <input type="email" class="form-control" name="uemail" value="${userInfo.uemail}" id="userEmaill" required="required" readonly />
						      <div>
						      <label for="password">비밀번호</label>
						      <input type="password" name="upassword" class="form-control upassword" id="upassword" required="required"  autocomplete="off"/>
					      	  <label class="result"></label>
							  </div>
				      	</div>
				      	<div class="row ml-5">
				      		<div class="col sign-pimg">
						    <div class="rounded m-auto">
						    <c:choose>
						    	<c:when test="${empty userInfo.pic}">
						    	<img src="${pageContext.request.contextPath}/resources/img/resume/resume-default-img.png" id="imgView" class="imgView" alt="profile">
						    	</c:when>
						    	<c:otherwise>
						    	<img src= "${pageContext.request.contextPath}/upload/${userInfo.pic}"     id="imgView" class="imgView" alt="profile">
						    	</c:otherwise>
						    </c:choose>
						    </div>
						    </div>
						</div>
				      </div>
				  </div>
			 </div>
			 <div class="form-row inline">
				<div class="form-group col-md-12">
					<label for="userName">이름</label>
				    <div class="row">
				    	<div class="form-group col-md-6">
				      		<input type="text" value="${userInfo.uname}" name="uname" class="form-control" id="uname" disabled required="required">
				      		<label class="result"></label>
				      	</div>
				      	<div class="form-group col-md-6">
				      		<input type="file" accept="image/*" name="file" class="m-auto btn member-btn form-control hiddenMember" id="profileImage" value="${userInfo.pic}" />
				      	</div>
				     </div>
				     <div class="row">
				     	<div class="form-group col-md-6">
				      		<label for="nickName">닉네임</label>
					      	<input type="text" name="unickname" value="${userInfo.unickname}" class="form-control" id="unickname" disabled required="required">
					      	<label class="result"></label>		
				      	</div>
				      	<div class="form-group col-md-6">
				      		<label for="userAge">생년월일</label>
					      	<input type="text" class="form-control" value="${userInfo.ubirth}" name="ubirth" id="ubirth" disabled >
					      	<label class="result"></label>
				      	</div>
			     	</div>
				</div>
			</div>
			  <div class="form-row inline">
			    <div class="form-group col-md-12">
			      <label for="sample4_postcode">주소</label>
			      <div class="row">
			      	<div class="form-group col-md-6">
			      		<input value="${userInfo.postcode}" type="text" name="postcode" id="sample6_postcode" readonly placeholder="우편번호" class="form-control"/>
			      	</div>
			      	<div class="form-group col-md-6">
			      		<input type="text" name="addr" value="${userInfo.addr}" id="sample6_address" class="form-control" readonly placeholder="주소">
			      	</div>
			      </div>
			    </div>
			  </div>
			  <div class="form-group">
			    <input type="button" onclick="sample6_execDaumPostcode()" value="우편번호 찾기" class="btn member-btn hiddenMember" />
			  </div>
			  <span id="guide" style="color:#999;display:none"></span>
			  <div class="form-group">
			    <input type="text" name="detailAddr" value="${userInfo.detailAddr}" id="sample6_detailAddress" placeholder="상세주소"  disabled class="form-control">
			    <input type="hidden" name="extraAddr" id="sample6_extraAddress" readonly placeholder="참고항목">
			  </div>
			 <div class="clickHidden">
			  <button type="button" class="btn member-btn mr-2" id="modifyMember"> 회원정보 수정 </button>
			  <button type="button" class="btn member-btn mr-2" id="withdraw"> 회원탈퇴 </button>
			 </div>
			 <div class="hiddenMember">
			  <button type="button" class="btn member-btn mt-2 mr-2" id="modify"> 수정완료 </button>
			 </div>
			 	<input type="hidden" id="uno" name="uno" value="${userInfo.uno}"/>
			 	<input type="hidden" name="csrf_token" value="${csrf_token}"/>
			</form>
		</div>
		 </div>
	</div>
	
</section>

<%@ include file="/WEB-INF/views/include/footer.jsp" %>
<script >var root = "${root}"</script>
<script src="${root}/resources/js/memberInfo.js"></script>




