<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/include/header.jsp"%>
<link rel="stylesheet" href=" ${pageContext.request.contextPath}/resources/css/member/findUser.css">
<!-- 상단 이미지 -->
<div>
	<img src="${pageContext.request.contextPath }/resources/img/member/loginImg.jpg" class="main-header-top-img" alt="...">
</div>
<section>
	<div class="container">
	<div class="p-3 pl-3 mb-5 bg-white rounded w-75 m-auto" >
		<div class="row">
			<div class="col-sm">
				<form action="#">
					<div class="form-group col-md-12">
				  		<h2 class="title">아이디 찾기</h2>
		    			<div class="form-group">
						    <label class="sr-only" for="userName">이름</label>
					   		<input type="text" class="form-control userName" id="userEmaill" required="required" placeholder="이름을 입력해주세요"/>
					 	</div>
					 	<div class="form-group">
					 		<label class="sr-only" for="userBirth">생년월일</label>
					    	<input type="number" class="form-control userBirth" id="password" required="required" placeholder="생년월일을 입력해주세요" />
		      			</div>
		      			<div class="form-group pt-2">
		      				<input type="submit" class="form-control btn member-btn" value="아이디 찾기" >
		      			</div>				
					</div>
				</form>
			</div>
			<div class="col-sm virLineFind">
					<form action="#">
						<div class="form-group col-md-12">
					  		<h2 class="title">비밀번호 찾기</h2>
			    			<div class="form-group">
							    <label class="sr-only" for="userEmail">Email</label>
						   		<input type="text" class="form-control userName" id="userEmaill" required="required" placeholder="이메일을 입력해주세요"/>
						 	</div>
			      			<div class="form-group font-italic">
			      				비밀번호 찾기 버튼을 누르시면 해당 메일로 확인 메일이 발송됩니다
			      			</div>	
			      			<div class="form-group">
			      				<input type="submit" class="form-control btn member-btn" value="비밀 번호 찾기" >
			      			</div>				
						</div>
					</form>
			</div>
		</div>
		</div>
	</div>
</section>

<%@ include file="/WEB-INF/views/include/footer.jsp" %>