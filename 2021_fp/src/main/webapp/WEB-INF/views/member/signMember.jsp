<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/include/header.jsp"%>
<link rel="stylesheet" href=" ${pageContext.request.contextPath}/resources/css/member/signMember.css">
<!-- 상단 이미지 -->
<div class="top-img">
	<img src="${pageContext.request.contextPath }/resources/img/member/loginImg.jpg" class="sign-header-top-img" alt="...">
</div>
<section>
	<div class="container">
	<div class="m-auto w-75 ">
			<div class="shadow p-3 pl-3 mb-5 rounded w-75 m-auto memberBoxing" >
				<form id="signForm" action="signMember" method="post">
				 <div class="form-row inline">
				    <div class="form-group col-md-12 mb-0">
				    	<div class="row align-items-center">
				    		<div class="form-group col-md-6 sign-epw">
							<h1 class="title">회원 가입</h1>
						      <label for="userEmaill">Email</label>
						      <input type="email" name="uemail" class="form-control" id="userEmaill" required="required" value="${userVO.uemail}"  >
						      <!-- 아이디 중복 시에 나타나는 오류 창  -->
						      <!-- <label class=""  ></label> -->
						      <label for="password">비밀번호</label>
						      <input type="password" name="upassword" class="form-control" id="password" required="required">
						      <label for="passwordRe">비밀번호 확인</label>
						      <input type="password" class="form-control" id="passwordRe" required="required">
				      	</div>
				      	<div class="row">
				      		<div class="col sign-pimg">
						    <div class="shadow bg-white rounded sign-img-bg">
						    	<img src="${pageContext.request.contextPath }/resources/img/test.png" class="rounded img-fluid " alt="짱구">
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
				      		<input value="${userVO.uname}" type="text" name="uname" class="form-control" id="userName" required="required">
				      	</div>
				      	<div class="form-group col-md-5 btnFile">
				      		<input type="file" accept="image/*" name="pic" class="custom-file-input" id="validatedInputGroupCustomFile">
					     	<label class="custom-file-label" for="validatedInputGroupCustomFile">Choose</label>
				      	</div>
				     </div>
				     <div class="row">
				     	<div class="form-group col-md-6">
				      		<label for="nickName">닉네임</label>
					      	<input value="${userVO.unickname}" type="text" name="unickname" class="form-control" id="nickName" required="required">	
				      	</div>
				      	<div class="form-group col-md-6">
				      		<label for="userAge">생년월일</label>
					      	<input type="number" value="${userVO.ubirth}" name="ubirth" class="form-control" id="userAge">	
				      	</div>
			     	</div>
				</div>
			</div>
			  <div class="form-row inline">
			    <div class="form-group col-md-12">
			      <label for="sample4_postcode">주소</label>
			      <div class="row">
			      	<div class="form-group col-md-6">
			      		<input value="${userVO.postcode}" type="text" name="postcode" id="sample6_postcode" readonly placeholder="우편번호" class="form-control " />
			      	</div>
			      	<div class="form-group col-md-6">
			      		<input type="text" name="addr" value="${userVO.addr}" id="sample6_address" class="form-control" readonly placeholder="주소">
			      	</div>
			      </div>
			       <input type="button" onclick="sample6_execDaumPostcode()" value="우편번호 찾기" class="btn member-btn" />
			    </div>
			  </div>
			  <span id="guide" style="color:#999;display:none"></span>
			  <div class="form-group">
			    <input type="text" name="detailAddr" value="${userVO.detailAddr}" id="sample6_detailAddress" placeholder="상세주소" class="form-control">
			    <input type="hidden" name="extraAddr" id="sample6_extraAddress" readonly placeholder="참고항목">
			  </div>
				<div class="form-group">
					<button type="submit" class="m-auto btn member-btn signUp-btn" id="signSubmit"> 회원가입 </button>
				</div>
			</form>
		</div>
		</div>
	</div>
</section>
<%@ include file="/WEB-INF/views/include/footer.jsp" %>
<script>
		var user_age = 0;
		/* 버튼 클릭시 생년월일 일치 확인 */
		document.getElementById("signSubmit").onclick = function() {
			user_age = document.getElementById('userAge').value;
			var password = document.getElementById("password").value;
			var passwordre = document.getElementById("passwordRe").value;
			if(password != passwordre){
				alert("비밀번호를 확인 해주세요");
				return false;
			}
			if (user_age.length != 8) {
				alert("생년월일이 잘못 되었습니다");
				return false;
			} 
	}
		var message = '${message}';
		if(message != null && message != ""){
			alert(message);
		}
</script>		
