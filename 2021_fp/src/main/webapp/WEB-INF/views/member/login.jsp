<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/include/header.jsp"%>
<link rel="stylesheet" href=" ${pageContext.request.contextPath}/resources/css/member/login.css">
<!-- 상단 이미지 -->
<div>
	<img src="${pageContext.request.contextPath }/resources/img/member/loginImg.jpg" class="main-header-top-img" alt="...">
</div>
<section>
	<div class="container">
	<div class="">
			<div class="p-3 pl-3 mb-5 bg-white rounded m-auto login-box" >
				<form id="loginForm" action="#">
				 <div class="form-row inline">
				    <div class="form-group col-md-12">
				    	<h1 class="title">로그인</h1>
				    		<div class="form-group">
							    <label for="userEmaill">Email</label>
							    <input type="email" class="form-control" id="userEmaill" required="required" name="uemail" placeholder="아이디를 입력해주세요"/>
							    <label for="password">비밀번호</label>
							    <input type="password" class="form-control" id="password" required="required" name="upassword" placeholder="비밀번호를 입력해주세요" />
				      		</div>
				   			<div class="form-group">
				   				<button type="button" class="form-control btn font-weight-bold mr-2 member-btn" id="loginBtn">
				   					로그인
				   				</button>
				   			</div>
				   			<div class="form-row inline">
				   				<div class="form-group col-md-12 mb-0">
				   					<div class="row">
				   						<div class="form-group col-md-6 mb-0">
				   							<button type="button" class="form-control btn font-weight-bold member-btn" id="withdraw">
				   							 	회원가입
				   							 </button>
				   						</div>
				   						<div class="form-group col-md-6 mb-0">
					   						<button type="button" class="form-control btn font-weight-bold member-btn" id="modify">
					   							 ID/PW 찾기
					   						</button>
				   						</div>
				   					</div>
				  				</div>
				  			</div>
						</div>
					</div>
				</form>
			 </div>
		 </div>
	</div>
</section>
<%@ include file="/WEB-INF/views/include/footer.jsp" %>
<script>
	var loginForm = $("#loginForm");
	
	$("#loginBtn").click(function(){
		loginForm.attr("action", "login");
		loginForm.attr("method","post").submit();
	});
	
	var message = '${message}';
	if(message != null && !message == ""){
		alert(message);
	}
</script>